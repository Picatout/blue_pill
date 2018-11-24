/*
 * Description: interface carte SD
 * Auteur: PICATOUT
 * Date: 2018-11-20
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/blue_pill.h"
#include "sdcard.h"

uint16_t sdc_status; // indicateurs booléens carte SD
static unsigned blocks_count; // nombre de bloc de 512 octets

// après la mise sous tension la carte
// doit-être activée par 80 clock
static void dummy_clock(){
		int i;
		_spi_slave_deselect(SDC_SPI);
		// envoie de 80 clock pour activer la carte
		for (i=0;i<10;i++)spi_read(SDC_SPI);
}

// desactivation de l'interface avec la carte
void sdcard_deselect(){
	SDC_PORT->ODR|=SDC_SS_BIT;
	spi_write(SDC_SPI,0xff);
}

// attend que la carte soie prête
// lit des caractère de la carte 
// jusqu'à ce que le caractèr lu soit 0xff
// expire après 10msec
static void sdc_wait_ready(){
	unsigned char c;
	timer=10;
	while (timer){
		c=spi_read(SDC_SPI);
	    if (c==0xff){break;}
	}
}

 // calcule l'adresse à partir du no de secteur.
 // Un secteur est de 512 octets.    
 // arguments: 
 //   sector,  Numéro de secteur
 // retourne:
 //   Adresse sur la carte SD.    
static inline unsigned sector_to_address(unsigned sector){    
    return SECTOR_SIZE*sector;
}

/***********************************
* envoie d'une commande carte SD
* arguments: 
*    cmd  index de la commande
*    args arguments de la commande
*    supl  nombre d'octets supplémentaire dans la réponse
*    resp  réponse de la carte
* retourne:
*   r1 1ier octet réponse de la carte
***********************************/
unsigned char sdc_cmd(unsigned char cmd,unsigned char *args,unsigned supl, unsigned char* resp){
    unsigned char r1=-1;
    int i;
    sdc_wait_ready();
    spi_write(SDC_SPI,cmd|0x40);
    spi_block_write(SDC_SPI,args,5);
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
		r1=spi_read(SDC_SPI);
		if (r1!=0xff) {break;}
	}
	if (r1==1){
	// réception des autres octets de la réponse.
		spi_block_read(SDC_SPI,resp,supl);
	}else{
		sdc_status|=F_SDC_TO;
	}
    return r1;
}

unsigned char sdc_read_register(unsigned char index, unsigned char *reg){
	unsigned char c=0xff, r1, args[5]={0,0,0,0,0};
	_spi_enable(SDC_SPI);
	_sdcard_select();
	r1=sdc_cmd(index,args,0,0);
	if (r1){
		do {
			c=spi_read(SDC_SPI);
		}while (c==0xff);
		if (c==0xfe){ // lecture de 16 octets
			spi_block_read(SDC_SPI,reg,16);
			// lecture du CRC 16 bits
			spi_read(SDC_SPI);
			spi_read(SDC_SPI);
		}else{
			r1=0;
		}
	}
	sdcard_deselect();
	return r1;
}

// détermine la capacité de la carte
static unsigned char sdc_set_size(){
	unsigned char r1,csd[16];
	unsigned block_len,c_size,c_size_mult;
	r1=sdc_read_register(SEND_CSD,csd);
	if (r1){
		if (sdc_status&F_SDC_HC){//version 2, carte haute capacité
			blocks_count=1024*((csd[8]<<8)+csd[9]);
		}else{// version 1
			block_len=1<<((csd[5]&0xf)-1);
			c_size=(csd[6]&0xf<<10)+(csd[7]<<2)+((csd[8]>>6)&3)+1;
			c_size_mult=1<<(((csd[9]&0x3)<<1)+(csd[10]>>7)+2);
			blocks_count=(c_size*c_size_mult)>>9;
		}
	}
	return r1;
}

// flow chart REF: http://elm-chan.org/docs/mmc/ima/sdinit.png
void sdcard_init(){
		int i;
		uint8_t r1,args[5], resp[16];
		
		sdc_status=0;
		blocks_count=0;
		// initialise le périphérique SPI à la vitesse la plus lente.
		spi_init(SDC_SPI, SDC_CLK_SLOW, SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI, SPI_STD_PORT);
		dummy_clock();
		// delais 2 msec
		pause(2);
		_sdcard_select();
		args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMD0_CRC;
		r1=sdc_cmd(GO_IDLE_STATE,args,0,resp);
		if (r1==1){
			args[2]=1;args[3]=0xaa;args[4]=CMD8_CRC;
			r1=sdc_cmd(SEND_IF_COND,args,4,resp);
			if (r1==1){
				if ((args[2]==(resp[2]&0xf)) && (args[3]==resp[4])){
					sdc_status|=F_SDC_V2;
				}else{
					goto failed;
				}
			}
		}
		// envoie commande acmd41  APP_CMD
		// cette boucle peu prendre 1 seconde
		timer=1000;
		do {
			args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMDX_CRC;
			sdc_cmd(APP_CMD,args,0,resp);
			if (sdc_status&F_SDC_V2)args[0]=0x40;
			r1=sdc_cmd(APP_SEND_OP_COND,args,0,resp);
			if (!r1){break;}
		}while (timer);
		if (r1){
			sdc_status|=F_SDC_TO;
			goto failed;
		}
		if (sdc_status&F_SDC_V2){
	    // evoie commande cmd58 READ_OCR
			args[0]=0;args[1]=0;args[2]=0;args[3]=0;
			r1=sdc_cmd(READ_OCR,args,4,resp);
			if (resp[0]&BIT6){
				goto success;
			}
		}
		// envoie CMD16 SET_BLOCKLEN
		args[0]=0;args[1]=0;args[2]=2;args[3]=0;
		r1=sdc_cmd(SET_BLOCKLEN,args,0,resp);
		r1=sdc_set_size();
success:
	sdc_status|=F_SDC_OK;
	spi_baudrate(SDC_SPI,SDC_CLK_FAST);
failed:
	sdcard_deselect();
}


