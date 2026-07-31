# 📚 Alembic — Résumé de révision

## Qu'est-ce qu'Alembic ?

Alembic est l'outil officiel de migration de base de données pour SQLAlchemy.

Il permet de :

- versionner la base de données
- créer des migrations
- mettre à jour la base sans perdre les données
- revenir à une ancienne version si nécessaire

**En résumé :**

```
Models SQLAlchemy
        │
        ▼
Alembic compare
        │
        ▼
Migration Python
        │
        ▼
PostgreSQL
```

## Pourquoi utiliser Alembic ?

**Sans Alembic :**

```
Je modifie un modèle
        ↓
Je dois modifier la base manuellement
        ↓
Risque d'erreur
```

**Avec Alembic :**

```
Je modifie un modèle
        ↓
Alembic détecte les changements
        ↓
Migration automatique
        ↓
Base synchronisée
```

## Installation

```bash
pip install alembic
```

## Initialisation

Une seule fois :

```bash
alembic init alembic
```

Cela crée :

```
backend/
├── alembic/
│   ├── env.py
│   ├── versions/
│   ├── README
│   └── script.py.mako
└── alembic.ini
```

## Les fichiers importants

### `alembic.ini`

Configure Alembic.

Contient notamment :

```
sqlalchemy.url
```

Dans notre projet, cette URL est remplacée par :

```
settings.DATABASE_URL
```

### `env.py`

Le fichier le plus important.

Il indique à Alembic :

- quelle base utiliser
- quels modèles comparer
- quelles métadonnées charger

Exemple :

```python
config.set_main_option(
    "sqlalchemy.url",
    settings.DATABASE_URL,
)

target_metadata = Base.metadata
```

### `versions/`

Chaque migration est enregistrée ici.

Exemple :

```
versions/
└── b63de593d625_initial_schema.py
```

Chaque fichier représente une version de la base.

## Les Metadata

SQLAlchemy stocke toutes les tables ici :

```
Base.metadata
```

Alembic compare :

```
Base.metadata
      VS
  PostgreSQL
```

## Les commandes importantes

### Voir la version actuelle

```bash
alembic current
```

### Créer une migration

```bash
alembic revision --autogenerate -m "create users"
```

Alembic compare :

```
Models
   ↓
Database
   ↓
Migration
```

### Appliquer une migration

```bash
alembic upgrade head
```

La base est mise à jour vers la dernière version.

### Revenir en arrière

Une migration :

```bash
alembic downgrade -1
```

Ou une version précise :

```bash
alembic downgrade <revision_id>
```

### Marquer une base existante

Si les tables existent déjà :

```bash
alembic stamp head
```

Aucune modification n'est faite. Alembic enregistre simplement :

> "Cette base est déjà à jour."

## Workflow classique

```
Modifier un Model
        ↓
alembic revision --autogenerate
        ↓
Vérifier le fichier migration
        ↓
alembic upgrade head
        ↓
Base mise à jour
```

## Dans notre projet

Notre projet utilise :

```
FastAPI
   ↓
SQLAlchemy
   ↓
Alembic
   ↓
PostgreSQL
```

Dans `env.py` :

```
settings.DATABASE_URL
        ↓
Engine SQLAlchemy
        ↓
Base.metadata
        ↓
Autogenerate
```

## Quand utiliser Alembic ?

Chaque fois que tu modifies un modèle :

**1. Ajouter une colonne**

```python
phone = mapped_column(...)
```

**2. Créer une migration**

```bash
alembic revision --autogenerate -m "add phone"
```

**3. Appliquer**

```bash
alembic upgrade head
```

## Bonnes pratiques

- ✔ Toujours créer une migration après une modification des modèles.
- ✔ Vérifier le contenu du fichier généré avant de l'appliquer.
- ✔ Ne jamais modifier directement la base de données en production.
- ✔ Faire un commit Git après chaque migration importante.
- ✔ Conserver toutes les migrations dans `alembic/versions`.

## Les commandes à retenir

```bash
# Initialiser Alembic
alembic init alembic

# Voir la version actuelle
alembic current

# Créer une migration
alembic revision --autogenerate -m "message"

# Appliquer toutes les migrations
alembic upgrade head

# Revenir d'une migration
alembic downgrade -1

# Marquer une base existante comme à jour
alembic stamp head
```

## À retenir en une phrase

> SQLAlchemy décrit la structure de la base de données dans le code, tandis qu'Alembic compare cette structure avec la base PostgreSQL, génère les migrations nécessaires et versionne toutes les évolutions de la base de données.
