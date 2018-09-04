/*
 * Description: interface pour le gestionnaire d'interruptions.
 * Auteur: PICATOUT
 * Date: 2018-09-03
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#define _irq_m (irq/4)
#define _ipr(irq)  NVIC_IPR##(_irq_m(irq))
