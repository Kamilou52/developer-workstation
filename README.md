# Developer Workstation

> Environnement personnel de développement permettant de standardiser, automatiser et documenter la création et la gestion de projets logiciels.

---

# Présentation

**Developer Workstation** est un projet personnel dont l'objectif est de construire progressivement une boîte à outils professionnelle destinée au développement logiciel.

Le projet rassemble des scripts Bash, des modèles de projets, de la documentation et des outils d'automatisation afin de faciliter la création de nouveaux projets et l'administration d'un poste de développement.

---

# Objectifs

* Standardiser tous les nouveaux projets.
* Automatiser les tâches répétitives.
* Centraliser les scripts de développement.
* Documenter les procédures et les bonnes pratiques.
* Constituer une base réutilisable sur plusieurs postes de travail.

---

# Fonctionnalités

## Gestion du poste

* Bootstrap d'un nouveau poste.
* Mise à jour de l'environnement.
* Diagnostic du système.
* Sauvegarde de la configuration.
* Restauration de la configuration.

## Gestion Git

* Initialisation d'un dépôt.
* Vérification de la configuration Git.
* Vérification GitHub CLI.
* Vérification SSH.

## Génération de projets

* Création d'une structure standard.
* Initialisation Git.
* Premier commit.
* Utilisation de modèles (templates).

---

# Architecture du dépôt

> Cette section sera générée automatiquement dans une prochaine version.

---

## Scripts disponibles
---

<!-- BEGIN AUTO_SCRIPTS -->
- backup-config.sh
- bootstrap.sh
- doctor.sh
- doctor.sh.bak
- new-project.sh
- restore-config.sh
- update-dev.sh
- update-readme.sh
<!-- END AUTO_SCRIPTS -->

---

## Bibliothèques Bash
---

<!-- BEGIN AUTO_LIBRARIES -->
- checks.sh
- github.sh
- git.sh
- logger.sh
- output.sh
- readme.sh
<!-- END AUTO_LIBRARIES -->

---

# Templates

Le dossier `templates/` contient les modèles utilisés pour générer automatiquement les nouveaux projets.

Exemples :

* README
* .gitignore
* GitHub Actions
* autres modèles à venir

---

# Documentation

La documentation est organisée par domaines.

Exemples :

* Bash
* Git
* GitHub
* Linux
* Docker
* Node.js
* Scripts
* Learning Notes

---

# Installation

Cloner le dépôt :

```bash
git clone <repository-url>
```

Puis exécuter les scripts souhaités depuis la racine du projet.

---

# Utilisation

Exemples :

```bash
./scripts/doctor.sh
```

```bash
./scripts/update-dev.sh
```

```bash
./scripts/new-project.sh
```


# Version

---

<!-- BEGIN AUTO_VERSION -->
Version actuelle : **1.3.0**
<!-- END AUTO_VERSION -->

---

# Roadmap

## Version 1.x

* Amélioration des scripts existants.
* Automatisation du README.
* Gestion des templates.
* Création automatique de projets.

## Version 2.x

* Support Python.
* Support Node.js.
* Support Docker.
* Création automatique des dépôts GitHub.
* Automatisation des workflows GitHub Actions.

---

# Documentation associée

* `CHANGELOG.md`
* `ROADMAP.md`
* `docs/`

---

# Licence

À définir.

---

# Auteur

Projet développé et maintenu par **Mercipowerhouse** dans le cadre de la construction d'un environnement personnel de développement.
 
