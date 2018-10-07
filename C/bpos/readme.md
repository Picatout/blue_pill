bpos demo
--------

   Blue pill OS est un système d'exploitation simple inspiré de CP/M.
   
   
   no. fonction | nom | arguments | description
   ------------ | --- | --------- | -----------
   0 | SVC_RESET | aucun | réinitialise le µC
   1 | SVC_LED_ON | aucun | allume la LED verte
   2 | SVC_LED_OFF | aucun | éteint la LED verte
   3 | SVC_TIMER | durée en msec | démarre la minuterie
   4 | SVC_TIMEOUT | aucun | attend expiration minuterie
   5 | SVC_PRIVILIGED | aucun | accorde tous les privilèges au programme
   
   
La macro **_svc_call()** code en assembleur les appels système. Le registre cpu **r0** contient le premier argument et le registre **r1** le deuxième.
La signification des ces arguments dépend de la fonction demandée. Par exemple pour **SVC_TIMER** seul le contenu de **r0** est utilisé pour indiquer la
durée en millisecondes. Pour les fonctions qui requièrent de nombreux arguments on peut passer dans **r0** le nombre de ces arguments et dans **r1** un
pointeur vers un vecteur qui contient les adresses de chacun des arguments requis.  

Le gestionnaire d'interruption **SVcall_handler()** requière aussi du code en assembleur car le mécanisme pour récupérer le numéro de la fonction 
demandée et ses arguments nécessite des manipulations impossible à faire en **C**.  

Encore une fois le fichier **startup.c** a du être modifié. **SVcall_handler** a été ajouté à la table des vecteurs d'interruption et **startup()** a été modifée
pour créer une pile programme différende le la pile principale. Dans la fonction **main()** une fois la configuration complétée la macro **_unpriviliged()** est 
invoquée pour enlever les privilèges au programme. Normalement un système d'exploitation protège les resssources en donnant un accès limité aux programmes. 
Ces manipulations doivent aussi être faites en assembleur.
