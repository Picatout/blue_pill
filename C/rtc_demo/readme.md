RTC demo
--------

  Le stm32f103c8t6 possède ce que le fabricant appelle un **backup domain**.  Il s'agit d'un module **RTC** (**Real Time Clock**) et de 20 octets de mémoire RAM.
  Sur la **blue pill** la broche identifiée **VB** sert à connecter une pile au lithium de 3 volt  qui permet de conserver l'alimentation en permanence sur le 
  **backup domain**. L'oscillateur LSE qui fait partie de ce domaine continue lui aussi à fonctionner lorsque l'alimentation principale est coupée. On a donc
  tout ce qu'il faut pour utiliser une horloge-carlendrier sur ce µC. La note applicative AN2821  explique comment s'y prendre.
  
  Dans ce démo j'utilise simplement le RTC pour créer un délais pour faire clignoter la LED verte à une période de 2 secondes. Avec ce démo on voit comment
  
  * configurer le RTC, fonction **enable_rtc()** dans **rct.c**
  * utiliser les registres RCC_ISERx pour activer une interruption, fonction **enable_interrupt()** dans **nvic.c**
  * utiliser l'instruction machine **WFI** pour placer le µC en mode sleep jusqu'à la prochaine interruption. Ce qui permet de réduire la consommation.
  * activer le bit **SLEEPONEXIT** pour placer le µC en mode sleep à la sortie d'une interruption. Ce mode est utilisé lorsqu'une application est 
  pilotée par les interruptions et que la fonction **main()** n'a rien à faire. De cette façon le µC sort du mode sleep seulement pour traiter les interruptions.
  
  
  
  
