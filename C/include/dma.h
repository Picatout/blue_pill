/*
 * Description: interface bas niveau périphériques DMA
 * Auteur: PICATOUT
 * Date: 2018-10-29
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */


#define DMA1_BASE_ADR 0x40000000
#define DMA2_BASE_ADR 0x40020400

typedef struct {
	sfr_t isr;
	sfr_t ifcr;
} dma_flags_t;

#define DMA1_FLAGS ((dma_flags_t*)DMA1_BASE_ADR)
#define DMA2_FLAGS ((dma_flags_t*)DMA2_BASE_ADR)

// champs de bits de ISR
#define DMA_CCR_EN_POS 0
#define DMA_CCR_EN_MASK 1

// champs de bits de IFCR


typedef struct{	
	sfr_t ccr;
	sfr_t cndtr;
	sfr_t cpar;
	sfr_t cmar;
	sfr_t res;
}dma_chn_t;

#define DMA1_CHN ((dma_chn_t*)(DMA1_BASE_ADR+8))
#define DMA2_CHN ((dma_chn_t*)(DMA2_BASE_ADR+8))

// champs de bits de CCR

// champs de bits de CNDTR



