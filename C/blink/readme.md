blink
------

Dans cette première version de blink seul le périphérique GPIOC est utilisé. Cependant le signal clock du périphérique doit-être activé.
Cette activation se fait via le registre RCC_APB2ENR **APB2 peripheral clock enable register** en mettant le bit **IOPCEN** à 1.

La boucle de délais est simplement assurée par une boucle for().

 
