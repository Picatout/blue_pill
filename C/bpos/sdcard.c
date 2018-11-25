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

// retourne la capacité en Mo
unsigned sdcard_capacity(){
	return blocks_count/2048;
}

// après la mise sous tension la carte
// doit-être activée par 80 clock
static void dummy_clock(){
		int i;
		_sdcard_cs_high();
		// envoie de 80 clock pour activer la carte
		for (i=0;i<10;i++)spi_read(SDC_SPI);
}

// attend que la carte soie prête
// lit des caractère de la carte 
// jusqu'à ce que le caractèr lu soit 0xff
// expire après 10msec
static int sdc_wait_ready(){
	unsigned char c;
	unsigned t0;
	t0=ticks+500;
	while (ticks<t0){
		c=spi_read(SDC_SPI);
	    if (c==0xff){break;}
	}
	return c==0xff;
}

// desactivation de l'interface avec la carte
void sdcard_deselect(){
	_sdcard_cs_high();
	spi_write(SDC_SPI,0xff);
}

// sélection la carte
int sdcard_select(){
	_sdcard_cs_low();
	spi_write(SDC_SPI,0xff);
	if (sdc_wait_ready()){
		return 1;
	}else{
		sdcard_deselect();
		return 0;
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
* retourne:
*   r1 1ier octet réponse de la carte
***********************************/
unsigned char sdc_cmd(unsigned char cmd,unsigned char *args){
    unsigned char r1;
    int i;
    
    sdcard_deselect();
    if (!sdcard_select()) return 0xff;
    spi_write(SDC_SPI,cmd|0x40);
    spi_block_write(SDC_SPI,args,5);
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
		r1=spi_read(SDC_SPI);
		if (r1<128) {break;}
	}
    return r1;
}

unsigned char sdc_read_register(unsigned char index, unsigned char *reg){
	unsigned char c=0xff, r1, args[5]={0,0,0,0,0};
	r1=sdc_cmd(index,args);
	if (!r1){
		do {
			c=spi_read(SDC_SPI);
		}while (c==0xff);
		if (c==0xfe){ // lecture de 16 octets
			spi_block_read(SDC_SPI,reg,16);
			// lecture du CRC 16 bits
			spi_read(SDC_SPI);
			spi_read(SDC_SPI);
		}
	}
//	sdcard_deselect();
	return !r1;
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
int sdcard_init(){
		int i;
		unsigned t0;
		uint8_t r1,args[5], resp[16];
		
		sdc_status=0;
		blocks_count=0;
		// initialise le périphérique SPI à la vitesse la plus lente.
		spi_init(SDC_SPI, SDC_CLK_SLOW, SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI, SPI_STD_PORT);
		// delais 2 msec
		pause(2);
		sdcard_deselect();
		dummy_clock();
		if (!sdcard_select()){
				sdc_status|=F_SDC_IE;
				return 0;
		}
		// envoie GO_IDLE_STATE, CMD0 
		// si succès r1==1
//		print("sending CMD0\n");
		args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMD0_CRC;
		r1=sdc_cmd(GO_IDLE_STATE,args);
		switch (r1){
		case 1:
			break;
		case 0xff:
			sdc_status|=F_SDC_TO;
			return 0;
		default:
			sdc_status|=F_SDC_IE;
			return 0;
		}//switch (r1)
		sdc_status|=F_SDC_IN;
//		print("sending CMD8\n");
		args[2]=1;args[3]=0xaa;args[4]=CMD8_CRC;
		r1=sdc_cmd(SEND_IF_COND,args);
		if (r1==1){
			spi_block_read(SDC_SPI,resp,4);
			if ((resp[2]==1) && (resp[3]==0xAA)){
				sdc_status|=F_SDC_V2;
//				print("card version 2\n");
			}else{
				sdc_status|=F_SDC_BAD_CARD;
				return 0;
			}
		}
		// envoie commande acmd41  APP_SEND_OP_COND
		// cette boucle peu prendre 1 seconde
//		print("sending ACMD41\n");
		t0=ticks+1000;
		args[1]=0;args[2]=0;args[3]=0;args[4]=CMDX_CRC;
		do {
			args[0]=0;
			sdc_cmd(APP_CMD,args);
			if (sdc_status&F_SDC_V2)args[0]=0x40;
			r1=sdc_cmd(APP_SEND_OP_COND,args);
			if (!r1){
				break;
		    }
		}while (ticks<t0);
		if (r1) {
			sdc_status|=F_SDC_TO;
			sdcard_deselect();
			return 0;
		}
		if (sdc_status&F_SDC_V2){
//			print("carte V2, envoie CMD58\n");
	    // evoie commande cmd58 READ_OCR
			args[0]=0;args[1]=0;args[2]=0;args[3]=0;
			r1=sdc_cmd(READ_OCR,args);
			if (!r1){
			    spi_block_read(SDC_SPI,resp,4);
			    if (resp[0]&BIT6){
					sdc_status|=F_SDC_HC; // block address
				}
			}
		}
		// envoie CMD16 SET_BLOCKLEN
		if (!(sdc_status&F_SDC_HC)){
			print("setting block size\n");
			args[0]=0;args[1]=0;args[2]=2;args[3]=0;
			if((r1=sdc_cmd(SET_BLOCKLEN,args))){
				sdc_status|=F_SDC_IE;
				sdcard_deselect();
				return 0;
			}
		}
		r1=sdc_set_size();
		sdc_status|=F_SDC_OK;
		_spi_disable(SDC_SPI);
		spi_baudrate(SDC_SPI,SDC_CLK_FAST);
		_spi_enable(SDC_SPI);
		return 1;
}


