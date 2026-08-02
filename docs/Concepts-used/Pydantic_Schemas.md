# Schémas Pydantic - Guide de révision

## Qu'est-ce que Pydantic ?

Pydantic est la bibliothèque de validation de données utilisée par FastAPI.

Elle valide les données entrantes, sérialise les données sortantes, et génère automatiquement la documentation de l'API.

SQLAlchemy gère la base de données.

Pydantic gère les données échangées entre le client et l'API.

---

# Architecture

```
Client
   │
   ▼
Schéma Pydantic
   │
   ▼
CRUD / Service
   │
   ▼
Modèle SQLAlchemy
   │
   ▼
PostgreSQL
```

---

# Pourquoi utiliser des schémas ?

Les schémas ne sont **PAS** des tables de base de données.

Ils définissent :

- Les données que le client peut envoyer.
- Les données que l'API renvoie.
- Les règles de validation.
- Les types de données.

---

# Structure typique

Pour presque chaque modèle, créer ces schémas.

```
UserBase
    ↓
UserCreate
UserUpdate
UserRead
```

---

# Schéma de base (Base)

Contient les champs communs.

Exemple :

```python
class UserBase(BaseModel):
    email: EmailStr
```

Tous les autres schémas en héritent.

---

# Schéma de création (Create)

Utilisé lors de la création d'un nouvel objet.

Contient uniquement les champs que le client doit fournir.

Exemple :

```python
class UserCreate(UserBase):
    password: str
```

POST /users

---

# Schéma de mise à jour (Update)

Utilisé pour les requêtes PATCH ou PUT.

Presque tous les champs sont optionnels.

Exemple :

```python
class UserUpdate(BaseModel):
    email: EmailStr | None = None
```

PATCH /users/{id}

---

# Schéma de lecture (Read)

Renvoyé par l'API.

Contient généralement :

- id
- created_at
- updated_at
- champs calculés

Exemple :

```python
class UserRead(UserBase):
    id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(
        from_attributes=True
    )
```

GET /users/{id}

---

# model_config

```python
model_config = ConfigDict(
    from_attributes=True
)
```

Permet à Pydantic de convertir des objets SQLAlchemy en objets Pydantic.

Sans cela :

```
User ORM
      ↓
❌ Erreur
```

Avec cela :

```
User ORM
      ↓
UserRead
```

---

# model_validate()

Convertit des données en modèle Pydantic.

Exemple :

```python
user = UserRead.model_validate(data)
```

Utilisé en interne par FastAPI.

---

# Validation

Pydantic valide automatiquement :

- Email
- UUID
- datetime
- Decimal
- Enum
- int
- float
- bool
- list

Exemple :

```python
email: EmailStr
```

Nécessite :

```
email-validator
```

Installation :

```bash
pip install email-validator
```

---

# Champs optionnels

Obligatoire :

```python
name: str
```

Optionnel :

```python
phone: str | None = None
```

---

# Champs Enum

Exemple :

```python
status: JobOfferStatus
```

Seules les valeurs définies dans l'Enum sont acceptées.

---

# Schémas imbriqués

Un schéma peut contenir un autre schéma.

Exemple :

```python
class CompanyRead(BaseModel):
    ...

class JobOfferRead(BaseModel):
    company: CompanyRead
```

Utile pour les relations.

---

# SQLAlchemy vs Pydantic

SQLAlchemy

- Base de données
- Tables
- Relations
- Requêtes

Pydantic

- Validation
- Entrée de l'API
- Sortie de l'API
- Sérialisation

---

# Tester les schémas

## 1. Test d'import

```python
from app.schemas.user import *
```

Vérifie les imports.

---

## 2. Création d'objet

```python
user = UserCreate(
    email="test@test.com",
    password="12345678"
)
```

Vérifie la validation.

---

## 3. model_validate()

```python
UserRead.model_validate(data)
```

Vérifie la compatibilité avec l'ORM.

---

# Erreurs courantes

## Dépendance manquante

```
ImportError:
email-validator is not installed
```

Solution :

```bash
pip install email-validator
```

---

## Champ obligatoire manquant

```
ValidationError
Field required
```

Signifie qu'un champ obligatoire n'a pas été fourni.

---

## Enum invalide

```
AttributeError:
InterviewStatus.PENDING
```

Signifie que la valeur de l'Enum n'existe pas.

---

# Bonnes pratiques

✅ Un fichier de schémas par modèle

```
schemas/
    user.py
    profile.py
    company.py
```

✅ Séparer Create / Update / Read

✅ Ne jamais exposer les mots de passe

✅ Utiliser EmailStr pour les emails

✅ Utiliser les types UUID

✅ Utiliser ConfigDict(from_attributes=True)

✅ Tout valider avant le CRUD

---

# Ce que nous avons accompli

✔ Création des schémas pour chaque modèle SQLAlchemy.

✔ Création des schémas Base/Create/Update/Read.

✔ Configuration de `from_attributes=True`.

✔ Validation de tous les imports.

✔ Test de la création d'objets.

✔ Test de `model_validate()`.

✔ Correction des incohérences d'Enum.

✔ Installation de `email-validator`.

✔ Confirmation que tous les schémas fonctionnent correctement.

---

# Prochaine étape

```
Modèles ✅
Alembic ✅
Schémas ✅

↓

CRUD (Repositories)
```

La couche CRUD interagira directement avec les modèles SQLAlchemy et utilisera ces schémas Pydantic pour valider les requêtes et les réponses.
