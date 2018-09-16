blink version 2
---------------

  Cette seconde version de blink utilise le core timer du Cortex-M3 pour produire un délais 1 msec avec la fonction **millisec()**.  
  La fonction **delay()** produit un délais en millisecondes en appellant en boucle autant de fois que nécessaire **millisec()**.
  
  Deux nouveautés par rapport à la version 1.
  
  * Le µC est configuré pour fonctionner avec le cristal externe et le PLL pour **Fcpu** à sa fréquence maximale de 72Mhz. Voir fonction
    **set_sysclock()**.

  * Un délais de 1 milliseconde est créé en utlisant le coretimer du CPU Cortex-M3. Cette fonction s'appelle **millisec()**. 
    La fonction **delay()** appelle en boucle autant de fois que nécessaire la fonction **millisec()** pour créer le délais requis.
