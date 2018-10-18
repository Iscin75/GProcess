# GProcess - Rejoignez le process

Ce document répertorie les procédures de mise en place de l'environnement de développement pour l'application web et l'application Android.

## Récupération du répertoire

### Prérequis

Git : https://git-scm.com/download/win  
Kdiff3 : https://sourceforge.net/projects/kdiff3/files/  
Git Extensions : https://sourceforge.net/projects/gitextensions/  

### Parametrage de Git Extension

Une fois tous les outils installé on commence par parametrer notre outil Git Extensions.  

1. Se rendre dans le menu Outil > Paramètres
2. Définir les liens vers Git.exe et Kdiff3 (mergetool et difftool) installés precedemment s'ils n'ont pas été detectés.
3. Choisir un nom d'utilisateur/une adresse email qui seront utilisés pour vous identifier lors d'un commit/push.

### Telechargement du répertoire 

Dans Git Extensions :

1. Se rendre dans le menu Démarrer > Cloner un dépot
2. a. Dépot à cloner : https://github.com/Nicsi93/GProcess.git  
   b. Destination : Dossier dans lequel le répertoire sera sauvegarder  
   c. [Facultatif] Sous-dossier : Défini un sous dossier dans lequel sera stocké le repertoire dans la destination  
   d. Branche : par défaut : branche distance HEAD  
   e. Choisir dépot personnel, init. les sous modules, et télécharger l'historique  
   f. Cliquer sur "Cloner"  

### Commit un changement

Une fois que vous avez fini vos modifications, le bouton "Commit" devrait voir apparaitre un chiffre entre parenthèse correspondant au nombre de fichiers qui ont été modifiés. Pour envoyer vos changement sur le serveur il faut :

1. Cliquer sur le bouton "Commit(n)"
2. Indexer tous les changements du répertoire de travail dans la zone de staging (Partie gauche de l'interface)
3. Choisir l'option "Commiter et pousser" (Attention ! Ne cliquez pas que sur commiter sinon les changements ne seront pas visible des autres utilisateurs)

### Récupérer des changements 

Pour cela il suffit de cliquer sur le bouton "Récupérer" (Fleche bleue vers le bas), de choisir la branche origin et de cliquer sur récupérer.

## Version Javascript

### Prérequis

Visual Studio Code : https://code.visualstudio.com/Download  
Node.js LTS version : https://nodejs.org/en/download/

### Build du projet

1. Ouvrir Visual Studio Code.
2. Ouvrir le répertoire GProcess-JS.
3. Ouvrir un nouveau terminal (Ctrl + Shift + ù)
4. Installer toutes les dépendances 
``` bash
npm install
```
5. Lancer le projet en mode débug 
``` bash
npm run dev
``` 
ou créer un build pour la prod
``` bash
npm run build
```

## Version Android

### Prérequis

Android Studio : https://developer.android.com/studio/  
Java Development Kit 8 : https://www.oracle.com/technetwork/java/javase/downloads

### Build du projet

1. Ouvrir Android Studio
2. Ouvrir le répertoire GProcess-Android
3. Attendre la compilation de toutes les ressources par Gradle

