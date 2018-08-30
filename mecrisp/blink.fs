: pwr2 ( u1 -- u2 ) \ power of 2                                          
  1 swap lshift ;                                                          
$40011000 constant gpioc_crl
$40011004 constant gpioc_crh                                               
$40011010 constant gpioc_bsrr                                              
$40011014 constant gpioc_brr                                               
$44644444 gpioc_crh !                                                     
: led_on ( -- ) \ allume led verte                                          
  13 pwr2 gpioc_brr ! ;                                               
: led_off ( -- ) \ eteint led verte
  13 pwr2 gpioc_bsrr ! ;                                               
: delay ( u -- ) \ busy loop 
  1000 * 0 do i drop loop ;                                                  
: blink ( speed -- ) \ clignote led verte jusqu'a touche enfoncee 
  begin led_on dup delay led_off dup delay key? until key 2drop ;           
100 blink                                                                  

