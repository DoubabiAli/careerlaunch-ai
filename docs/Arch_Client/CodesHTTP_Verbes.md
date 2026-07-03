# HTTP : Codes de statut & Verbes REST

## 📌 Qu'est-ce que HTTP ?

**HTTP (HyperText Transfer Protocol)** est le protocole qui permet la communication entre un **client** (navigateur, application mobile, logiciel...) et un **serveur**.

Chaque échange HTTP se compose de :

1. Une **requête** envoyée par le client.
2. Une **réponse** renvoyée par le serveur.

La réponse contient un **code de statut HTTP** qui indique le résultat de la requête.

---

# 📊 Les familles de codes HTTP

| Série   | Signification       |
| ------- | ------------------- |
| **1xx** | Information         |
| **2xx** | Succès              |
| **3xx** | Redirection         |
| **4xx** | Erreur côté client  |
| **5xx** | Erreur côté serveur |

> À connaître principalement : **2xx, 4xx et 5xx**.

---

# ✅ Les principaux codes HTTP

## 🟢 200 OK

La requête a été exécutée avec succès.

### Utilisation

- Lecture de données (**GET**)
- Mise à jour réussie (**PUT**, **PATCH**)
- Suppression réussie (**DELETE**, parfois avec un message)

**Exemple :**

```
GET /users
→ 200 OK
```

---

## 🟢 201 Created

Une nouvelle ressource a été créée avec succès.

### Utilisation

- Après un **POST**

**Exemple :**

```
POST /users
→ 201 Created
```

---

## 🔴 400 Bad Request

La requête est invalide ou mal formée.

Causes possibles :

- Paramètres manquants
- Mauvais format JSON
- Erreur de syntaxe

**Exemple :**

```
POST /users
{
   "nom":
}
→ 400 Bad Request
```

---

## 🔴 401 Unauthorized

Le client n'est **pas authentifié**.

### Utilisation

- Token absent
- Mot de passe incorrect
- Utilisateur non connecté

**Exemple :**

```
GET /profile
→ 401 Unauthorized
```

---

## 🔴 403 Forbidden

Le client est authentifié, mais **n'a pas les droits nécessaires**.

### Exemple

Un utilisateur tente d'accéder au panneau administrateur.

```
→ 403 Forbidden
```

---

## 🔴 404 Not Found

La ressource demandée n'existe pas.

### Exemple

```
GET /users/999
→ 404 Not Found
```

---

## 🔴 422 Unprocessable Entity

La requête est correcte, mais les **données ne respectent pas les règles métier ou de validation**.

### Exemples

- Email invalide
- Mot de passe trop court
- Champ obligatoire vide
- Date incohérente

```
POST /users
{
   "email":"abc"
}
→ 422 Unprocessable Entity
```

> **Différence avec 400 :**
>
> - **400** → la requête est mal formée.
> - **422** → la requête est bien formée, mais les données sont invalides.

---

## 🔴 500 Internal Server Error

Erreur interne du serveur.

Le problème ne vient **pas du client**, mais du serveur.

Causes possibles :

- Bug dans le code
- Base de données inaccessible
- Exception non gérée

```
GET /users
→ 500 Internal Server Error
```

---

# 🌍 Les verbes REST

Les verbes HTTP indiquent l'action à effectuer sur une ressource.

## 📥 GET

### Rôle

Lire ou récupérer des données.

### Caractéristiques

- Ne modifie pas les données.
- Peut être exécuté plusieurs fois sans effet secondaire.

**Exemples :**

```
GET /users
GET /products/15
```

---

## ➕ POST

### Rôle

Créer une nouvelle ressource.

### Utilisation

Envoie des données au serveur.

**Exemple :**

```
POST /users
```

Retour attendu :

```
201 Created
```

---

## ✏️ PUT

### Rôle

Modifier ou remplacer entièrement une ressource existante.

### Utilisation

```
PUT /users/15
```

Retour attendu :

```
200 OK
```

---

## 🗑️ DELETE

### Rôle

Supprimer une ressource.

### Utilisation

```
DELETE /users/15
```

Retour attendu :

- **200 OK** (avec un message)
- **204 No Content** (sans contenu)

---

# 📌 Quel verbe utiliser ?

| Action                  | Verbe HTTP | Code de succès courant           |
| ----------------------- | ---------- | -------------------------------- |
| Lire une ressource      | **GET**    | **200 OK**                       |
| Créer une ressource     | **POST**   | **201 Created**                  |
| Modifier une ressource  | **PUT**    | **200 OK**                       |
| Supprimer une ressource | **DELETE** | **200 OK** ou **204 No Content** |

---

# 💡 Exemples d'API REST

| Action                        | Requête           |
| ----------------------------- | ----------------- |
| Obtenir tous les utilisateurs | `GET /users`      |
| Obtenir un utilisateur        | `GET /users/5`    |
| Créer un utilisateur          | `POST /users`     |
| Modifier un utilisateur       | `PUT /users/5`    |
| Supprimer un utilisateur      | `DELETE /users/5` |

---

# 🧠 À retenir

- Les **codes HTTP** indiquent le résultat d'une requête.
- Les **2xx** correspondent à un succès, les **4xx** à une erreur du client et les **5xx** à une erreur du serveur.
- **200 OK** : requête réussie.
- **201 Created** : ressource créée.
- **400 Bad Request** : requête mal formée.
- **401 Unauthorized** : authentification requise ou invalide.
- **403 Forbidden** : accès refusé malgré une authentification valide.
- **404 Not Found** : ressource introuvable.
- **422 Unprocessable Entity** : données invalides malgré une requête correcte.
- **500 Internal Server Error** : erreur interne du serveur.
- Les verbes REST suivent les opérations **CRUD** :
  - **GET** → Lire (_Read_)
  - **POST** → Créer (_Create_)
  - **PUT** → Modifier (_Update_)
  - **DELETE** → Supprimer (_Delete_)
