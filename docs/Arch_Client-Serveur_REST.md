# Architecture Client/Serveur & REST

## 📌 Architecture Client/Serveur

L'architecture **Client/Serveur** est un modèle dans lequel deux programmes communiquent via un réseau.

- **Client** : application qui envoie une requête (navigateur, application mobile, logiciel).
- **Serveur** : programme qui reçoit la requête, la traite, accède éventuellement à une base de données, puis renvoie une réponse.

### Cycle de communication

```
Client
   │
   │ Requête HTTP
   ▼
Serveur
   │
   │ Traitement
   │
   ▼
Base de données (si nécessaire)
   │
   ▼
Serveur
   │
   │ Réponse HTTP
   ▼
Client
```

---

## 📌 Requête HTTP (HTTP Request)

Une requête HTTP est un message envoyé par le client au serveur.

Elle contient généralement :

- **Méthode HTTP** (GET, POST, PUT, DELETE...)
- **URL** (ressource demandée)
- **Headers** (métadonnées)
- **Body** (données envoyées, uniquement si nécessaire)

Exemple :

```
GET /users/15 HTTP/1.1
Host: api.exemple.com
```

---

## 📌 Réponse HTTP (HTTP Response)

Le serveur renvoie une réponse qui contient :

- **Code de statut**
- **Headers**
- **Body** (souvent au format JSON)

Exemple :

```
HTTP/1.1 200 OK

{
   "id":15,
   "nom":"Ali"
}
```

---

# 🌍 API REST

REST (**Representational State Transfer**) est un style d'architecture permettant à un client de communiquer avec un serveur via HTTP.

Une API REST manipule des **ressources** identifiées par des URL.

Exemple :

```
/users
/products
/orders
```

Chaque ressource peut être créée, lue, modifiée ou supprimée.

---

# 📌 Les principales méthodes HTTP

## 🔹 GET

**Lire ou récupérer une ressource**

- Ne modifie pas les données.
- Peut être exécutée plusieurs fois sans effet secondaire.

Exemple :

```
GET /users
```

→ Retourne la liste des utilisateurs.

---

## 🔹 POST

**Créer une nouvelle ressource**

- Envoie des données au serveur.
- Ajoute généralement une nouvelle entrée.

Exemple :

```
POST /users
```

Body :

```json
{
  "nom": "Ali"
}
```

→ Crée un nouvel utilisateur.

---

## 🔹 PUT

**Modifier ou remplacer une ressource existante**

- Le client envoie la nouvelle version complète de la ressource.

Exemple :

```
PUT /users/15
```

→ Met à jour l'utilisateur n°15.

---

## 🔹 DELETE

**Supprimer une ressource**

Exemple :

```
DELETE /users/15
```

→ Supprime l'utilisateur n°15.

---

# 📌 Tableau récapitulatif

| Méthode | Action               | CRUD   |
| ------- | -------------------- | ------ |
| GET     | Lire                 | Read   |
| POST    | Créer                | Create |
| PUT     | Modifier / Remplacer | Update |
| DELETE  | Supprimer            | Delete |

---

# 📌 Codes HTTP les plus courants

| Code                          | Signification                |
| ----------------------------- | ---------------------------- |
| **200 OK**                    | Requête réussie              |
| **201 Created**               | Ressource créée              |
| **204 No Content**            | Succès sans contenu retourné |
| **400 Bad Request**           | Requête invalide             |
| **401 Unauthorized**          | Authentification requise     |
| **403 Forbidden**             | Accès refusé                 |
| **404 Not Found**             | Ressource introuvable        |
| **500 Internal Server Error** | Erreur du serveur            |

---

# 📌 Exemple complet

Le client veut modifier un utilisateur.

```
Client
   │
   │ PUT /users/15
   │ {
   │   "nom":"Ali"
   │ }
   ▼
Serveur
   │
   │ Met à jour la base de données
   ▼
Base de données
   │
   ▼
Serveur
   │
   │ HTTP 200 OK
   │ {
   │   "message":"Utilisateur mis à jour"
   │ }
   ▼
Client
```

---

# ✅ À retenir

- **Client** : envoie des requêtes.
- **Serveur** : traite les requêtes et renvoie des réponses.
- **HTTP** est le protocole de communication.
- **REST** est une architecture utilisant HTTP pour manipuler des ressources.
- Une ressource est identifiée par une **URL**.
- Les méthodes principales sont :
  - **GET** → Lire
  - **POST** → Créer
  - **PUT** → Modifier
  - **DELETE** → Supprimer
- Les réponses HTTP contiennent un **code de statut** et, souvent, des données au format **JSON**.
- Les opérations REST correspondent généralement aux opérations **CRUD** (Create, Read, Update, Delete).
