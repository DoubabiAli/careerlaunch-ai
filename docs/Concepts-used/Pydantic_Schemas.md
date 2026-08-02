# Pydantic Schemas - Revision Guide

## What is Pydantic?

Pydantic is the data validation library used by FastAPI.

It validates incoming data, serializes outgoing data, and automatically generates API documentation.

SQLAlchemy manages the database.

Pydantic manages the data exchanged between the client and the API.

---

# Architecture

```
Client
   │
   ▼
Pydantic Schema
   │
   ▼
CRUD / Service
   │
   ▼
SQLAlchemy Model
   │
   ▼
PostgreSQL
```

---

# Why use Schemas?

Schemas are **NOT** database tables.

They define:

- What data the client can send.
- What data the API returns.
- Validation rules.
- Data types.

---

# Typical Structure

For almost every model, create these schemas.

```
UserBase
    ↓
UserCreate
UserUpdate
UserRead
```

---

# Base Schema

Contains the common fields.

Example:

```python
class UserBase(BaseModel):
    email: EmailStr
```

Every other schema inherits from it.

---

# Create Schema

Used when creating a new object.

Contains only the fields the client must provide.

Example:

```python
class UserCreate(UserBase):
    password: str
```

POST /users

---

# Update Schema

Used for PATCH or PUT requests.

Almost every field is optional.

Example:

```python
class UserUpdate(BaseModel):
    email: EmailStr | None = None
```

PATCH /users/{id}

---

# Read Schema

Returned by the API.

Usually contains:

- id
- created_at
- updated_at
- computed fields

Example:

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

Allows Pydantic to convert SQLAlchemy objects into Pydantic objects.

Without it:

```
User ORM
      ↓
❌ Error
```

With it:

```
User ORM
      ↓
UserRead
```

---

# model_validate()

Converts data into a Pydantic model.

Example:

```python
user = UserRead.model_validate(data)
```

Used internally by FastAPI.

---

# Validation

Pydantic automatically validates:

- Email
- UUID
- datetime
- Decimal
- Enum
- int
- float
- bool
- list

Example:

```python
email: EmailStr
```

Requires:

```
email-validator
```

Install:

```bash
pip install email-validator
```

---

# Optional Fields

Required:

```python
name: str
```

Optional:

```python
phone: str | None = None
```

---

# Enum Fields

Example:

```python
status: JobOfferStatus
```

Accepted values are only those defined in the Enum.

---

# Nested Schemas

A schema can contain another schema.

Example:

```python
class CompanyRead(BaseModel):
    ...

class JobOfferRead(BaseModel):
    company: CompanyRead
```

Useful for relationships.

---

# SQLAlchemy vs Pydantic

SQLAlchemy

- Database
- Tables
- Relationships
- Queries

Pydantic

- Validation
- API input
- API output
- Serialization

---

# Testing Schemas

## 1. Import Test

```python
from app.schemas.user import *
```

Verifies imports.

---

## 2. Object Creation

```python
user = UserCreate(
    email="test@test.com",
    password="12345678"
)
```

Verifies validation.

---

## 3. model_validate()

```python
UserRead.model_validate(data)
```

Verifies ORM compatibility.

---

# Common Errors

## Missing dependency

```
ImportError:
email-validator is not installed
```

Solution:

```bash
pip install email-validator
```

---

## Missing Required Field

```
ValidationError
Field required
```

Means a required field was not provided.

---

## Invalid Enum

```
AttributeError:
InterviewStatus.PENDING
```

Means the Enum value does not exist.

---

# Best Practices

✅ One schema file per model

```
schemas/
    user.py
    profile.py
    company.py
```

✅ Separate Create / Update / Read

✅ Never expose passwords

✅ Use EmailStr for emails

✅ Use UUID types

✅ Use ConfigDict(from_attributes=True)

✅ Validate everything before CRUD

---

# What We Completed

✔ Created schemas for every SQLAlchemy model.

✔ Created Base/Create/Update/Read schemas.

✔ Configured `from_attributes=True`.

✔ Validated all imports.

✔ Tested object creation.

✔ Tested `model_validate()`.

✔ Fixed Enum inconsistencies.

✔ Installed `email-validator`.

✔ Confirmed all schemas work correctly.

---

# Next Step

```
Models ✅
Alembic ✅
Schemas ✅

↓

CRUD (Repositories)
```

The CRUD layer will interact directly with SQLAlchemy models and use these Pydantic schemas to validate requests and responses.
