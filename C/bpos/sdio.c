/*
 * Description: interface carte SD
 * Auteur: PICATOUT
 * Date: 2018-11-20
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "sdio.h"

uint16_6 sdc_status; // indicateurs booléens carte SD
static unsigned blocks_count; // nombre de bloc de 1024 octets
static uint16_t seg_count; //  nombre de segments de 65535 blocs
static uint16_t sdc_segment; // segment sélectionné. 
uint8_t sdc_R[16] // tampon pour la réponse de la carte 

// après la mise sous tension la carte
// doit-être activée par 80 clock
static void dummy_clock(){
		int i;
		_slave_deselect(SDIO_SPI);
		// envoie de 80 clock pour activer la carte
		for (i=0;i<10;i++)spi_read(SDIO_SPI);
}

// desactivation de l'interface avec la carte
static void sdio_deselect(){
	_slave_deselect(SDIO_SPI);
	spi_write(SDIO_SPI,0xff);
}

// attend que la carte soie prête
// lit des caractère de la carte 
// jusqu'à ce que le caractèr lu soit 0xff
// expire après 10msec
static void sdio_wait_ready(){
	unsigned char c;
	ticks=10;
	while (ticks){
		c=spi_read(SDIO_SPI);
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
*    spl  nombre d'octets supplémentaire dans la réponse
*    resp  réponse de la carte
* retourne:
*   r1 1ier octet réponse de la carte
***********************************/
unsigned char sdio_cmd(unsigned char cmd,unsigned char *args,unsigned supl, unsigned char* resp){
    unsigned char r1=-1;
    int i;
    _spi_enable(SDIO_SPI);
    _spi_slave_select(SDIO_SPI);
    sdio_wait_ready();
    spi_write(SDIO_SPI,cmd|0x40);
    spi_write_block(SDIO_SPI,args,5);
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
		r1=spi_read(SDIO_SPI);
		if (r1!=0xff) {break;}
	}
// réception des autres octets de la réponse.
	spi_read_block(SDIO_SPI,resp,spl);
    _spi_slave_deselect(SDIO_SPI);
    _spi_disable(SDIO_SPI);
    return r1;
}

// flow chart REF: http://elm-chan.org/docs/mmc/ima/sdinit.png
void sdcard_init(){
		int i;
		spi_init(SDIO_SPI,SDIO_CLK_SLOW,SPI_CR1_MSTR|SPI_CR1_SSM,SPI_STD_PORT);
		dummy_clock();
		// delais 2 msec
		ticks=2;
		while (ticks);
		_slave_select(SDIO_SPI);
		spi_write(SDIO_SPI,CMD0);
}


