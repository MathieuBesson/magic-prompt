# My Magic Prompt

## Consignes de l'exercice

- [Lien consignes de l'exercice](https://docs.google.com/presentation/d/1lkhMRT13xt1UtHdR_GeVHKvkmeRAoywZmVjDWWnjZJs/edit?usp=sharing)

## Prérequis

## OS 

Une distribution linux, WSL ou Mac

### Utilitaires

- curl
- make 
- mailutils
- vim

## Usage

- Lancement du prompt : 

```bash
make my-magic-prompt
```

- Pour accéder au prompt, vous devez fournir un mot de passe et un login spécifique, ou créer les vôtres.

- Lancement des commandes : 

```bash
[COMMANDE] [ARGUMENTS] [OPTIONS]
```

## Commandes disponibles : 

- Commandes :

- **passw** : Permet de changer le mot de passe avec une demande de confirmation
- **profil** : Affiche toutes les informations sur vous-même (Prénom, Nom, Âge, Email)
- **ls** : Liste des fichiers et des dossiers visibles et cachés
- **cd** : Permet de naviguer dans un dossier que vous venez de créer ou de revenir au dossier précédent
- **pwd** : Indique le répertoire actuel
- **hour** : Donne l'heure actuelle
- **rm** : Supprime un fichier
- **rmd**, **rmdir** : Supprime un dossier
- **httpget** : Télécharge le code source HTML d'une page web et l'enregistre dans un fichier spécifique. Vous demande le nom du fichier.
- **smtp** : Vous permet d'envoyer un e-mail avec une adresse, un sujet et le corps du message
- **open** : Ouvre un fichier directement dans l'éditeur Vim même si le fichier n'existe pas
- **age** : Demande votre âge et vous indique si vous êtes majeur ou mineur
- **quit**, **exit** : Permet de sortir du prompt
- **help** : Affiche les commandes disponibles
- **about** : Description du programme
- **version**, **vers**, **--v** : Affiche la version du promptage


## TODO

- Ajouter des vérifications dans les paramètres de fonction
- Ajouter la bashdoc
- Relire le code et refacto