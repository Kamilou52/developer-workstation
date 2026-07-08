# new-project.sh

## Objectif

`new-project.sh` automatise la création d'un nouveau projet de développement.

L'objectif n'est pas uniquement de gagner du temps, mais également de garantir que tous les projets démarrent avec une structure cohérente, reproductible et conforme aux bonnes pratiques.

---

# Pourquoi créer ce script ?

Lorsqu'un développeur crée plusieurs projets, il répète toujours les mêmes opérations :

* créer un dossier ;
* créer l'arborescence du projet ;
* créer les fichiers de base ;
* initialiser Git ;
* créer la branche `main` ;
* effectuer le premier commit.

Automatiser ces opérations permet :

* d'éviter les oublis ;
* d'accélérer le démarrage d'un projet ;
* d'obtenir une structure identique sur tous les projets ;
* de faciliter la maintenance.

---

# Philosophie du projet

Ce script est développé progressivement.

Chaque version ajoute une fonctionnalité sans remettre en cause les précédentes.

Cette approche permet :

* un apprentissage progressif ;
* des tests simples ;
* une maintenance facilitée.

---

# Architecture

Le script suit une architecture modulaire.

Le programme principal ne contient presque aucune logique.

Chaque tâche est confiée à une fonction spécialisée.

```text
main()
│
├── ask_project_name()
├── create_project()
├── create_structure()
├── create_files()
├── initialize_git()
└── print_summary()
```

Le programme principal devient ainsi très lisible.

---

# Description des fonctions

## ask_project_name()

Responsabilité :

Demander le nom du projet.

Cette fonction ne fait rien d'autre.

Principe pédagogique :

Une fonction doit avoir une seule responsabilité.

---

## create_project()

Responsabilité :

Créer le dossier du projet.

Exemple :

```text
mon-projet/
```

Cette fonction ne crée aucun fichier.

Elle prépare simplement l'environnement.

---

## create_structure()

Responsabilité :

Créer les répertoires standards.

Exemple :

```text
docs/
src/
tests/
.github/workflows/
```

Tous les futurs projets posséderont la même organisation.

---

## create_files()

Responsabilité :

Créer les fichiers de base.

Exemple :

* README.md
* CHANGELOG.md
* LICENSE
* .gitignore

Le contenu de ces fichiers pourra être généré à partir de modèles dans les versions suivantes.

---

## initialize_git()

Responsabilité :

Préparer le dépôt Git.

Cette fonction effectue :

* git init
* création de la branche main
* git add
* premier commit

Le dépôt est immédiatement opérationnel.

---

## main()

Le rôle de `main()` est uniquement d'orchestrer les différentes fonctions.

Il ne contient aucune logique complexe.

Cette organisation améliore considérablement la lisibilité du script.

---

# Bibliothèques utilisées

Le script utilise les fonctions communes disponibles dans :

```text
scripts/lib/output.sh
```

Les fonctions :

* print_title()
* print_ok()
* print_warn()
* print_error()

ne sont donc jamais réécrites.

Elles sont simplement importées grâce à :

```bash
source "$(dirname "$0")/lib/output.sh"
```

---

# Principes de conception

## Une fonction = une responsabilité

Chaque fonction effectue une seule tâche.

Cela facilite :

* les tests ;
* la maintenance ;
* les évolutions.

---

## Réutilisation

Les fonctions communes sont placées dans `scripts/lib`.

Elles peuvent être utilisées par plusieurs scripts :

* doctor.sh
* new-project.sh
* bootstrap.sh
* update-dev.sh

Cela applique le principe DRY (Don't Repeat Yourself).

---

## Programme principal minimal

Le fichier principal doit ressembler à un plan d'exécution.

On doit comprendre son fonctionnement en quelques secondes.

---

## Évolution progressive

Une fonctionnalité est développée selon le cycle suivant :

1. développement ;
2. test ;
3. documentation ;
4. commit Git.

Cette méthode permet d'identifier rapidement l'origine d'un problème.

---

# Feuille de route

## Version 1.2

* création d'un projet standard ;
* initialisation Git ;
* premier commit.

---

## Version 1.3

Ajout de modèles (`templates`) :

* README ;
* .gitignore ;
* LICENSE ;
* CHANGELOG.

---

## Version 1.4

Création automatique du dépôt GitHub avec GitHub CLI.

---

## Version 1.5

Choix du type de projet :

* Python ;
* Node.js ;
* HTML/CSS/JavaScript ;
* Docker ;
* API REST.

---

## Version 2.0

Création complète d'un projet prêt à développer :

* dépôt GitHub créé ;
* dépôt local relié au dépôt distant ;
* branche `main` configurée ;
* premier push effectué ;
* structure adaptée au type de projet.

---

# Points pédagogiques

## Penser en responsabilités

Avant d'écrire une fonction, toujours se demander :

> Quelle est son unique responsabilité ?

Si la réponse contient plusieurs actions, il faut probablement créer plusieurs fonctions.

---

## Écrire avant d'optimiser

Créer d'abord une version simple et fonctionnelle.

L'amélioration vient ensuite.

Cette approche réduit les erreurs.

---

## Documenter avant d'oublier

La documentation fait partie du développement.

Elle explique :

* ce que fait le script ;
* pourquoi il est conçu ainsi ;
* comment il pourra évoluer.

---

## Standardiser

Chaque projet doit démarrer de la même manière.

La standardisation :

* facilite l'apprentissage ;
* réduit les erreurs ;
* améliore la qualité des projets.

---

# Leçon retenue

L'objectif n'est pas seulement d'automatiser des commandes Bash.

L'objectif est de construire progressivement un environnement de développement personnel, fiable, documenté, réutilisable et évolutif, comparable aux outils utilisés dans un contexte professionnel.

