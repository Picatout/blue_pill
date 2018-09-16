systick demo
-------------

  Dans cette version de blink le **coretimer** est configuré pour générer une interruption gérée par **systick_int()**. Deux variables statiques
  ont été ajoutées. **ticks** qui est un compteur de millisecondes et **timer**  qui est utilisé pour créer un délais en millisecondes.
  
  Pour cette version il faut donc modifié le fichier **startup.c** pour ajouter **systick_int** dans la table des vecteurs d'interruptions.
  
  Le code source a été réorganisé pour mettre tous les fichiers d'entête dans le répertoire **include** et les fichiers sources pour la gestion
  des différents périphériques de bas niveau dans le dossier **hal** (Hardware Abstraction Layer). Chaque classe périphérique aura un fichier à son nom
  dans ce répertoire.
  
  Dans cette version contrairement à la version **blink_v2** le **coretimer** fonctionne en continue et génère une interruption à chaque milliseconde.
  
  
