svc demo
--------

   Chaque version de blink est un plus sophistiquée que la précédente. Dans cette version on aborde le sujet des **Service Call**. Tout système d'exploitation
   nécessite l'utilisation de ce qu'on pourrait traduire en français par **appel système**. Puisqu'un système d'exploitation charge dynamiquement des programmes
   pour les exécuter et que ceux-ci ne sont pas liés au noyau du système d'exploitation ils ne connaissent pas les adresses des fonctions du système. 
   Il doit donc y avoir un mécanisme pour contourner ce problème.  Le mécanisme utilisé ressemble à celui utilisé pour les interruptions. Il s'agit de créer une 
   vecteur qui contient l'adresse de ces fonctions et d'assigner un numéro à chacune de ces fonctions. Le cortex-M3 possède une instruction machine
   appelée **SVC** qui accepte un argument litéral de 8 bits. Dans ce démo ce litéral est utilisé pour indiquer le numéro de la fonction désirée. De plus
   on peut passer des arguments à l'appel système. Dans ce démo notre mini système d'exploitation possède 5 fonctions.
   
   no. fonction | nom | arguments | description
   ------------ | --- | --------- | -----------
   1 | SVC_LED_ON | aucun | allume la LED verte
   2 | SVC_LED_OFF | aucun | éteint la LED verte
   3 | SVC_TIMER | durée en msec | démarre la minuterie
   4 | SVC_PRIVILIGED | aucun | accorde tous les privilèges au programme
   5 | SVC_RESET | aucun | réinitialise le µC
   
   
	La macro **_svc_call()** code en assembleur les appels système. Le registre cpu **r0** contient le premier argument et le registre **r1** le deuxième.
	La signification des ces arguments dépend de la fonction demandée. Par exemple pour **SVC_TIMER** seul le contenu de **r0** est utilisé pour indiquer la
	durée en millisecondes. Pour les fonctions qui requièrent de nombreux arguments on peut passer dans **r0** le nombre de ces arguments et dans **r1** un
	pointeur vers un vecteur qui contient les adresses de chacun des arguments requis.  

	Le gestionnaire d'interruption **SVcall_handler()** requière aussi du code en assembleur car le mécanisme pour récupérer le numéro de la fonction 
	demandée et ses arguments nécessite des manipulations impossible à faire en **C**.  
	
	Encore une fois le fichier **startup.c** a du être modifié. **SVcall_handler** a été ajouté à la table des vecteurs d'interruption et **startup()** a été modifée
	pour créer une pile programme différende le la pile principale. Dans la fonction **main()** une fois la configuration complétée la macro _unpriviliged** est 
	invoquée pour enlever les privilège au programme. Normalement dans un système d'exploitation protège les resssources en donnant un accès limité au programmes. 
	Ces manipulations doivent aussi être faites en assembleur.
