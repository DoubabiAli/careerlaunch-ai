# 🐘 PostgreSQL — Fiche de Révision Complète

> Résumé rapide de toutes les notions vues, avec définition + exemple + usage dans **CareerLaunch AI**.

---

## 📦 Niveau 1 — Bases

### `CREATE TABLE`

Créer une table = créer un tableau structuré.

```sql
CREATE TABLE users (
    id UUID,
    email TEXT
);
```

**CareerLaunch AI** : `users`, `profiles`, `jobs`, `applications`, `messages`...

### 🔑 `PRIMARY KEY`

Identifiant unique d'une ligne, ne change jamais.

```sql
id UUID PRIMARY KEY
```

> À retenir : deux lignes ne peuvent jamais avoir le même id.

### 🔗 `FOREIGN KEY`

Relie deux tables entre elles.

```sql
user_id UUID REFERENCES users(id)
```

> À retenir : garantit qu'un profil ne peut pas exister sans utilisateur.

### 🚫 `UNIQUE`

Une valeur ne peut apparaître qu'une seule fois.

```sql
email TEXT UNIQUE
```

### ✅ `CHECK`

Impose une règle de validation.

```sql
CHECK (progress >= 0 AND progress <= 100)
```

### ⚡ `INDEX`

Accélère la recherche (comme l'index d'un livre).

```sql
CREATE INDEX idx_email ON users(email);
```

### 🎯 `ENUM`

Limite une colonne à des valeurs prédéfinies.

```sql
CREATE TYPE role_enum AS ENUM ('ADMIN','USER','COMPANY');
```

### 🆔 `UUID`

Identifiant long et quasi-impossible à deviner (sécurité).

```sql
id UUID PRIMARY KEY
```

### 🗂️ `JSONB`

Stocke des données flexibles (préférences, settings...).

```sql
settings JSONB
```

### 🕒 `TIMESTAMPTZ`

Date + heure + fuseau horaire.

```sql
created_at TIMESTAMPTZ DEFAULT NOW()
```

---

## 📊 Niveau 2 — Requêtes & organisation

| Notion           | C'est quoi ?                              | Exemple rapide                           | Usage CareerLaunch AI                     |
| ---------------- | ----------------------------------------- | ---------------------------------------- | ----------------------------------------- |
| **GROUP BY**     | Regrouper les lignes ayant la même valeur | `GROUP BY company`                       | Nombre d'offres par entreprise            |
| **HAVING**       | Filtrer les groupes (après GROUP BY)      | `HAVING COUNT(*) > 1`                    | Entreprises avec +10 offres               |
| **VIEW**         | Requête enregistrée sous un nom           | `CREATE VIEW active_users AS ...`        | Vue des utilisateurs actifs               |
| **TRANSACTION**  | Groupe d'actions tout-ou-rien             | `BEGIN ... COMMIT / ROLLBACK`            | Créer user + profil + abonnement ensemble |
| **SERIAL**       | Nombre auto-incrémenté                    | `id SERIAL`                              | Alternative simple à UUID                 |
| **CTE (WITH)**   | Requête temporaire nommée                 | `WITH x AS (...) SELECT * FROM x;`       | Simplifier une grosse requête             |
| **Sous-requête** | Requête dans une requête                  | `WHERE salary > (SELECT AVG(salary)...)` | Offres au-dessus du salaire moyen         |

---

## ⚙️ Niveau 3 — Logique avancée

| Notion              | C'est quoi ?                                   | Pourquoi ?                                          |
| ------------------- | ---------------------------------------------- | --------------------------------------------------- |
| **CREATE FUNCTION** | Fonction SQL réutilisable                      | Éviter de répéter du code                           |
| **PL/pgSQL**        | Langage de programmation de PostgreSQL         | Logique conditionnelle (`IF`, boucles) dans la base |
| **TRIGGER**         | Action automatique déclenchée par un événement | Ex: mettre à jour `updated_at` automatiquement      |
| **PROCEDURE**       | Suite d'actions SQL regroupées                 | Créer user + profil + notification en un appel      |

---

## 🔐 Niveau 4 — Administration

| Notion                        | C'est quoi ?                                               |
| ----------------------------- | ---------------------------------------------------------- |
| **ROLE**                      | Compte PostgreSQL (admin, developer, reader)               |
| **PERMISSIONS**               | Droits (lire ✅ / modifier ✅ / supprimer ❌)              |
| **SCHEMA**                    | Dossier qui organise les tables (`public`, `analytics`...) |
| **EXTENSIONS**                | Fonctionnalités en plus (`pgcrypto`, `pgvector`...)        |
| **EXPLAIN / EXPLAIN ANALYZE** | Voir comment une requête s'exécute (debug performance)     |
| **pg_dump / pg_restore**      | Sauvegarder / restaurer la base                            |
| **COPY**                      | Importer/exporter du CSV                                   |

---

## 🏗️ Niveau 5 — Conception

### Normalisation

Éviter les doublons → séparer `companies` et référencer via `company_id` dans `jobs`.

### Modélisation (MCD/MLD/UML)

Dessiner les relations **avant** d'écrire le SQL :

```
Users → Profiles → Applications → Jobs
```

---

## ✅ Bonnes pratiques à retenir

- Utiliser **UUID** pour les identifiants sensibles/publics
- Toujours ajouter `created_at` et `updated_at`
- Indexer les colonnes souvent recherchées (`email`, `user_id`, `company_id`)
- Noms de tables clairs et au pluriel (`users`, `jobs`, `profiles`)
- Éviter la duplication de données (→ normalisation)

---

## 📌 Exemple complet — table `users` de CareerLaunch AI

```sql
CREATE TABLE users (
    id UUID PRIMARY KEY,
    email TEXT UNIQUE,
    password_hash TEXT,
    role role_enum,
    settings JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    CHECK (email <> '')
);

CREATE TABLE profiles (
    id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    first_name TEXT,
    last_name TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

Cette table combine : `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK`, `ENUM`, `JSONB`, `TIMESTAMPTZ`.

---

## 🎯 Ordre d'apprentissage conseillé

`CREATE TABLE` → Types de données → `PRIMARY KEY` → `FOREIGN KEY` → Contraintes → Relations (1-1, 1-N, N-N) → `INDEX` → Requêtes SQL → `JOIN` → Fonctions/Vues → Transactions → PL/pgSQL
