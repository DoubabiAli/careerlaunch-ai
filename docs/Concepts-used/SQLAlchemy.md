# SQLAlchemy 2.0 — Revision Notes

---

## 1. What is SQLAlchemy?

SQLAlchemy is the **ORM (Object Relational Mapper)** for Python.

It allows Python classes to represent PostgreSQL tables.

Instead of writing SQL manually:

```sql
SELECT * FROM users;
```

you can write:

```python
session.query(User).all()
```

or (SQLAlchemy 2.0 style):

```python
users = session.scalars(select(User)).all()
```

---

## 2. Architecture

```
Python Objects
        │
        ▼
SQLAlchemy ORM
        │
        ▼
PostgreSQL
```

Example:

```python
class User(Base):
    __tablename__ = "users"
```

represents:

```sql
CREATE TABLE users (...)
```

---

## 3. DeclarativeBase

Every model inherits from the same `Base` class.

```python
from sqlalchemy.orm import DeclarativeBase

class Base(DeclarativeBase):
    pass
```

```python
class User(Base):
```

instead of:

```python
class User:
```

---

## 4. `__tablename__`

Specifies the SQL table name.

```python
__tablename__ = "users"
```

```sql
CREATE TABLE users
```

---

## 5. `mapped_column()`

Represents one database column.

```python
email = mapped_column(
    String(255),
    unique=True,
    nullable=False,
)
```

```sql
email VARCHAR(255)
UNIQUE
NOT NULL
```

---

## 6. `Mapped[]`

Every ORM attribute uses `Mapped[type]`.

```python
Mapped[str]
Mapped[int]
Mapped[UUID]
Mapped[datetime]
Mapped[Decimal]
Mapped[bool]
```

Lists:

```python
Mapped[list["JobOffer"]]
```

Optional:

```python
Mapped[str | None]
```

---

## 7. Primary Key

```python
id = mapped_column(
    PG_UUID(as_uuid=True),
    primary_key=True,
)
```

```sql
PRIMARY KEY
```

---

## 8. Foreign Key

```python
profile_id = mapped_column(
    ForeignKey("profiles.id")
)
```

```sql
FOREIGN KEY(profile_id)
REFERENCES profiles(id)
```

With cascade:

```python
ForeignKey(
    "profiles.id",
    ondelete="CASCADE",
)
```

---

## 9. UUID

Instead of integers (`1, 2, 3`), use UUIDs (`2e12f22b...`).

```python
from sqlalchemy.dialects.postgresql import UUID

UUID(as_uuid=True)
```

---

## 10. Data Types

| Python                    | SQL           |
| ------------------------- | ------------- |
| `String(255)`             | VARCHAR       |
| `Text`                    | TEXT          |
| `Integer`                 | INTEGER       |
| `Boolean`                 | BOOLEAN       |
| `Numeric(10,2)`           | DECIMAL(10,2) |
| `Date`                    | DATE          |
| `DateTime(timezone=True)` | TIMESTAMPTZ   |

---

## 11. Enum

Python Enum:

```python
class ContractType(Enum):
    CDI = "CDI"
```

Model:

```python
contract_type = mapped_column(
    SQLEnum(
        ContractType,
        name="contract_type"
    )
)
```

```sql
contract_type contract_type
```

---

## 12. Default Values

```python
server_default=func.now()
```

```sql
DEFAULT NOW()
```

Boolean:

```python
server_default="false"
```

---

## 13. `relationship()`

A relationship **does not create a column** — it lets Python navigate between tables.

```python
user.profile
```

**One-to-One**

```python
profile = relationship(
    back_populates="user"
)
```

**One-to-Many**

```python
job_offers = relationship(
    back_populates="company"
)
```

**Many-to-Many**

Uses an association table:

```
Profile
      │
ProfileSkill
      │
Skill
```

---

## 14. `back_populates`

Both sides must match.

```python
# User
profile = relationship(
    back_populates="user"
)
```

```python
# Profile
user = relationship(
    back_populates="profile"
)
```

Think of it as two-way navigation:

```
User
 ↑    ↓
Profile
```

---

## 15. Cascade

Automatically deletes child objects.

```python
cascade="all, delete-orphan"
```

---

## 16. `TYPE_CHECKING`

Avoids circular imports.

```python
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from app.models.user import User
```

---

## 17. `from __future__ import annotations`

```python
from __future__ import annotations
```

Allows `Mapped["User"]` without import issues. Recommended in SQLAlchemy 2.0.

---

## 18. `__repr__()`

For debugging only.

```python
def __repr__(self):
    return f"<User(email={self.email})>"
```

---

## 19. Engine

Connects Python to PostgreSQL.

```python
engine = create_engine(
    DATABASE_URL
)
```

---

## 20. Session

The Session talks to the database (INSERT, UPDATE, DELETE, SELECT).

```python
with Session() as session:
```

---

## 21. `Base.metadata`

Contains every ORM model.

```python
Base.metadata.create_all(engine)
```

---

## 22. Mapper

SQLAlchemy transforms a Python Class into a Database Table.

Validation:

```python
configure_mappers()
```

If successful: `✅ All mappers are valid`

---

## 23. Naming Convention

| Type          | Example                                        |
| ------------- | ---------------------------------------------- |
| Classes       | `User`, `Profile`, `Company`, `JobOffer`       |
| Tables        | `users`, `profiles`, `company`, `job_offers`   |
| Relationships | `user`, `profile`, `job_offers`, `job_matches` |

Use descriptive names. Avoid generic names like `matches`, `items`, `data`.

---

## 24. SQL ↔ SQLAlchemy

| SQL          | SQLAlchemy                        |
| ------------ | --------------------------------- |
| CREATE TABLE | `class Model(Base)`               |
| PRIMARY KEY  | `primary_key=True`                |
| FOREIGN KEY  | `ForeignKey()`                    |
| VARCHAR      | `String`                          |
| TEXT         | `Text`                            |
| BOOLEAN      | `Boolean`                         |
| DATE         | `Date`                            |
| TIMESTAMP    | `DateTime`                        |
| ENUM         | `SQLEnum`                         |
| DEFAULT      | `server_default`                  |
| REFERENCES   | `relationship()` + `ForeignKey()` |

---

## 25. Common Mistakes

**❌ Forgetting `Mapped[]`**

```python
# Wrong
name = mapped_column(String)

# Correct
name: Mapped[str] = mapped_column(String)
```

**❌ Mismatched `back_populates`**

Both sides must have the exact same name.

**❌ Circular imports**

```python
# Wrong
from app.models.user import User

# Correct
if TYPE_CHECKING:
    from app.models.user import User
```

**❌ Forgetting `ForeignKey`**

Without it, SQLAlchemy cannot know how two tables are linked.

---

## 26. ORM Validation Checklist

- ✅ Every model inherits from `Base`
- ✅ Every table has `__tablename__`
- ✅ Every column uses `Mapped[]`
- ✅ Every primary key is defined
- ✅ Every foreign key is defined
- ✅ Every `relationship()` has a matching `back_populates`
- ✅ `configure_mappers()` runs without errors
- ✅ `Base.metadata.create_all(engine)` succeeds

---

## 27. Typical Workflow

```
1. Design the database (SQL)
        ↓
2. Create Python Enums
        ↓
3. Create SQLAlchemy Models
        ↓
4. Add Foreign Keys
        ↓
5. Add Relationships
        ↓
6. Validate with configure_mappers()
        ↓
7. Create Alembic Migrations
        ↓
8. Build CRUD Operations
        ↓
9. Expose API Endpoints
        ↓
10. Connect the Frontend
```

---

## Golden Rules

1. A model = one database table.
2. `mapped_column()` creates columns.
3. `relationship()` does not create columns; it creates navigation between objects.
4. Every `back_populates` must exist on both sides with the exact same name.
5. Use `TYPE_CHECKING` to avoid circular imports.
6. Validate your ORM with `configure_mappers()` before writing business logic.
7. Keep models focused on the database structure; business logic belongs in services, not models.
