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
2. Définir les liens vers Git.exe et Kdiff3 (mergetool et difftool) installés precedemment s'ils n'ont pas été detecté.
3. Choisir un nom d'utilisateur/une adresse email qui seront utilisés pour vous identifier lors d'un commit/push.

### Telechargement du répertoire :

Dans Git Extensions :

1. Se rendre dans le menu Démarrer > Cloner un dépot
2. a. Dépot à cloner : https://github.com/Nicsi93/GProcess.git
   b. Destination : Dossier dans lequel le répertoire sera sauvegarder
   c. [Facultatif] Sous-dossier : Défini un sous dossier dans lequel sera stocké le repertoire dans la destination
   d. Branche : par défaut : branche distance HEAD
   e. Choisir dépot personnel, init. les sous modules, et télécharger l'historique
   f. Cliquer sur "Cloner"

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

