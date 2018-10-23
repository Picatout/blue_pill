bpos demo
--------

   Blue pill OS est un système d'exploitation simple inspiré de CP/M.
   
   
   no. fonction | nom | arguments | description
   ------------ | --- | --------- | -----------
   0 | SVC_RESET | aucun | réinitialise le µC
   1 | SVC_LED_ON | aucun | allume la LED verte
   2 | SVC_LED_OFF | aucun | éteint la LED verte
   3 | SVC_TIMER | uint32_t* | démarre la minuterie
   4 | SVC_GET_TIMER | uint32_t* | retourne la valeur de la variable timer
   5 | SVC_CONIN| char* | reçoit un caractère de la console
   6 | SVC_CONOUT| char* | envoie un caractère à la console
   7 | SVC_READLN| char*, int* | lit une ligne de la console
   8 | SVC_PRINT| char* | imprime une chaine
   9 | SVC_PRINT_INT| int* | imprime un entier
  10 | SVC_PRINT_HEX| uint32_t* | imprime un entier en format hexadécimal
  11 | SVC_PEEK8| uint32_t* | lit un entier 8 bits à l'adresse donnée
  12 | SVC_PEEK16| uint32_t* | lit un entier 16 bits à l'acresse donnée
  13 | SVC_PEEK32| uint32_t* | lit un entier 32 bits à l'adresse donnée
  14 | SVC_POKE8| uint32_t*, uint8_t* | écris un entier 8 bits à l'adresse donnée
  15 | SVC_POKE16| uint32_t*,uint16_t* | écris un entier 16 bits à l'adresse donnée
  16 | SVC_POKE32| uint32_t*,uint32_t*| écris un entier 32 bits à l'adresse donnée 
   
   
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
