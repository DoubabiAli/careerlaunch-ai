# Les API & Postman — Résumé

## 📌 Qu'est-ce qu'une API ?

**API (Application Programming Interface)** = une interface qui permet à deux logiciels de communiquer entre eux, sans que l'un ait besoin de connaître le fonctionnement interne de l'autre.

Une API définit :

- les **requêtes** qu'on peut envoyer ;
- les **données** qu'on peut recevoir ;
- les **règles** à respecter pour communiquer.

### Analogie simple

Une API, c'est comme un **serveur dans un restaurant** :

- Le client (toi) ne va pas en cuisine.
- Tu passes commande au serveur (l'API).
- Le serveur transmet ta commande à la cuisine (le système interne).
- Il te ramène le plat (la réponse).

---

# 🌍 API Web (REST)

La majorité des API modernes sont des **API REST**, accessibles via **HTTP**.

Elles fonctionnent avec :

- une **URL** (l'adresse de la ressource) ;
- une **méthode HTTP** (GET, POST, PUT, DELETE...) ;
- parfois un **body** (données envoyées, souvent en JSON) ;
- des **headers** (métadonnées : authentification, type de contenu...).

Exemple :

```
GET https://api.exemple.com/users/15
```

→ Retourne les infos de l'utilisateur n°15.

---

# 🔑 Pourquoi utiliser une API ?

- Récupérer des données depuis un service externe (météo, paiement, cartes...).
- Connecter un frontend à un backend.
- Permettre à plusieurs applications de partager des données.
- Automatiser des tâches (bots, intégrations...).

---

# 🧰 Qu'est-ce que Postman ?

**Postman** est un **outil** (logiciel/extension) qui permet de **tester, envoyer et déboguer des requêtes API** sans avoir besoin d'écrire de code ou d'utiliser une interface graphique existante.

Il sert à :

- envoyer des requêtes HTTP (GET, POST, PUT, DELETE...) ;
- vérifier la réponse du serveur (status code, headers, body) ;
- tester une API avant de l'intégrer dans un vrai projet ;
- documenter et partager des collections de requêtes avec une équipe.

> Postman est l'outil de référence pour les développeurs qui construisent ou consomment des API.

---

# 🖥️ Interface de Postman (les bases)

| Élément          | Rôle                                                             |
| ---------------- | ---------------------------------------------------------------- |
| **Méthode HTTP** | Choix du verbe (GET, POST, PUT, DELETE...)                       |
| **URL**          | Adresse de l'endpoint à appeler                                  |
| **Params**       | Paramètres ajoutés dans l'URL (`?key=value`)                     |
| **Headers**      | Métadonnées (ex: `Content-Type`, `Authorization`)                |
| **Body**         | Données envoyées (souvent en JSON, pour POST/PUT)                |
| **Send**         | Bouton pour envoyer la requête                                   |
| **Response**     | Zone qui affiche le code de statut, les headers et le body reçus |

---

# 💡 Exemple pratique dans Postman

### 1. Créer un utilisateur (POST)

```
Méthode : POST
URL     : https://api.exemple.com/users
Body    : (raw → JSON)
{
   "nom": "Ali",
   "email": "ali@exemple.com"
}
```

→ Réponse attendue :

```
201 Created
{
   "id": 15,
   "nom": "Ali",
   "email": "ali@exemple.com"
}
```

### 2. Lire cet utilisateur (GET)

```
Méthode : GET
URL     : https://api.exemple.com/users/15
```

→ Réponse attendue :

```
200 OK
```

---

# 📦 Les Collections Postman

Une **Collection** regroupe plusieurs requêtes liées (ex : toutes les routes d'un projet).

Avantages :

- Organiser ses requêtes par projet ou par module.
- Réutiliser des variables (ex : `{{base_url}}`, `{{token}}`).
- Partager facilement avec une équipe.
- Automatiser des tests (via l'onglet **Tests**).

---

# 🔐 Authentification dans Postman

Postman permet de tester des API protégées via :

- **API Key** (clé insérée dans les headers ou params)
- **Bearer Token** (souvent un JWT, envoyé dans le header `Authorization`)
- **Basic Auth** (login/mot de passe encodés)
- **OAuth 2.0** (flux d'authentification plus complexe)

Exemple de header :

```
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

---

# 🧪 Vérifier une réponse

Dans Postman, après avoir envoyé une requête, on regarde :

- **Status** : le code retourné (200, 201, 404, 500...) ;
- **Time** : le temps de réponse du serveur ;
- **Body** : les données renvoyées (souvent en JSON) ;
- **Headers** : infos supplémentaires sur la réponse.

---

# 🧠 À retenir

- Une **API** permet à deux applications de communiquer sans connaître les détails internes l'une de l'autre.
- La majorité des API web sont des **API REST**, basées sur HTTP.
- **Postman** est un outil qui permet de tester des API facilement, sans écrire de code.
- Dans Postman, on choisit une **méthode HTTP**, une **URL**, et éventuellement des **headers** et un **body**.
- Les **Collections** permettent d'organiser et partager des groupes de requêtes.
- Postman permet aussi de tester l'**authentification** (API Key, Bearer Token, OAuth...).
- Toujours vérifier le **code de statut** et le **body** de la réponse pour valider un test.
