/*
 * Description: interface bas niveau périphériques DMA
 * Auteur: PICATOUT
 * Date: 2018-10-29
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */


#define DMA1_BASE_ADR 0x40020000

#define DMACH1 (0)
#define DMACH2 (1)
#define DMACH3 (2)
#define DMACH4 (3)
#define DMACH5 (4)
#define DMACH6 (5)
#define DMACH7 (6)

typedef struct {
	sfr_t ISR;
	sfr_t IFCR;
} dma_flags_t;

#define DMA1_FLAGS ((dma_flags_t*)DMA1_BASE_ADR)

// champs de bits de ISR
#define DMA_ISR_GIF1 (1<<0)
#define DMA_ISR_TCIF1 (1<<1)
#define DMA_ISR_HTIF1 (1<<2)
#define DMA_ISR_TEIF1 (1<<3)
#define DMA_ISR_GIF2 (1<<4)
#define DMA_ISR_TCIF2 (1<<5)
#define DMA_ISR_HTIF2 (1<<6)
#define DMA_ISR_TEIF2 (1<<7)
#define DMA_ISR_GIF3 (1<<8)
#define DMA_ISR_TCIF3 (1<<9)
#define DMA_ISR_HTIF3 (1<<10)
#define DMA_ISR_TEIF3 (1<<11)
#define DMA_ISR_GIF4 (1<<12)
#define DMA_ISR_TCIF4 (1<<13)
#define DMA_ISR_HTIF4 (1<<14)
#define DMA_ISR_TEIF4 (1<<15)
#define DMA_ISR_GIF5 (1<<16)
#define DMA_ISR_TCIF5 (1<<17)
#define DMA_ISR_HTIF5 (1<<18)
#define DMA_ISR_TEIF5 (1<<19)
#define DMA_ISR_GIF6 (1<<20)
#define DMA_ISR_TCIF6 (1<<21)
#define DMA_ISR_HTIF6 (1<<22)
#define DMA_ISR_TEIF6 (1<<23)
#define DMA_ISR_GIF7 (1<<24)
#define DMA_ISR_TCIF7 (1<<25)
#define DMA_ISR_HTIF7 (1<<26)
#define DMA_ISR_TEIF7 (1<<27)

// champs de bits de IFCR
#define DMA_ISR_CGIF1 (1<<0)
#define DMA_ISR_CTCIF1 (1<<1)
#define DMA_ISR_CHTIF1 (1<<2)
#define DMA_ISR_CTEIF1 (1<<3)
#define DMA_ISR_CGIF2 (1<<4)
#define DMA_ISR_CTCIF2 (1<<5)
#define DMA_ISR_CHTIF2 (1<<6)
#define DMA_ISR_CTEIF2 (1<<7)
#define DMA_ISR_CGIF3 (1<<8)
#define DMA_ISR_CTCIF3 (1<<9)
#define DMA_ISR_CHTIF3 (1<<10)
#define DMA_ISR_CTEIF3 (1<<11)
#define DMA_ISR_CGIF4 (1<<12)
#define DMA_ISR_CTCIF4 (1<<13)
#define DMA_ISR_CHTIF4 (1<<14)
#define DMA_ISR_CTEIF4 (1<<15)
#define DMA_ISR_CGIF5 (1<<16)
#define DMA_ISR_CTCIF5 (1<<17)
#define DMA_ISR_CHTIF5 (1<<18)
#define DMA_ISR_CTEIF5 (1<<19)
#define DMA_ISR_CGIF6 (1<<20)
#define DMA_ISR_CTCIF6 (1<<21)
#define DMA_ISR_CHTIF6 (1<<22)
#define DMA_ISR_CTEIF6 (1<<23)
#define DMA_ISR_CGIF7 (1<<24)
#define DMA_ISR_CTCIF7 (1<<25)
#define DMA_ISR_CHTIF7 (1<<26)
#define DMA_ISR_CTEIF7 (1<<27)


typedef struct{	
	sfr_t ccr;
	sfr_t cndtr;
	sfr_t cpar;
	sfr_t cmar;
	sfr_t res;
}dma_chn_t;

#define DMA1 ((dma_chn_t*)(DMA1_BASE_ADR+8))

// champs de bits de CCR
#define DMA_CCR_EN (1<<0)
#define DMA_CCR_TCIE (1<<1)
#define DMA_CCR_HTIE (1<<2)
#define DMA_CCR_TEIE (1<<3)
#define DMA_CCR_DIR  (1<<4)
#define DMA_CCR_CIRC (1<<5)
#define DMA_CCR_PINC (1<<6)
#define DMA_CCR_MINC (1<<7)
#define DMA_CCR_PSIZE_POS (8) 
#define DMA_CCR_PSIZE_MASK (~(3<<8))
#define DMA_CCR_MSIZE_POS (10)
#define DMA_CCR_MSIZE_MASK (~(3<<10))
#define DMA_CCR_PL_POS (12)
#define DMA_CCR_PL_MASK (~(3<<12))
#define DMA_CCR_MEM2MEM (1<<14)


// champs de bits de CNDTR



