# Architecture MVC (Model - View - Controller)

## 📌 Définition

L'architecture **MVC (Model-View-Controller)** est un **patron de conception (design pattern)** qui sépare une application en trois composants afin de faciliter :

- la maintenance ;
- l'évolution ;
- la réutilisation du code ;
- le travail en équipe.

Chaque composant possède une responsabilité bien définie.

---

# 🧩 Les 3 composants

## 📦 Model (Modèle)

Le **Model** représente les **données** et la **logique métier** de l'application.

Il est responsable de :

- stocker les données ;
- effectuer les traitements ;
- communiquer avec la base de données ;
- appliquer les règles métier.

### Exemples

- Classe `User`
- Classe `Product`
- Connexion à la base de données
- Calcul d'un prix TTC

> Le Model **ne connaît ni l'interface utilisateur, ni le contrôleur**.

---

## 🖥️ View (Vue)

La **View** est l'interface utilisateur.

Elle est responsable de :

- afficher les données ;
- récupérer les actions de l'utilisateur ;
- présenter les informations de manière lisible.

Elle **ne contient pas la logique métier**.

### Exemples

- Page HTML
- Interface graphique (Qt, JavaFX, React...)
- Tableau des utilisateurs
- Formulaire de connexion

---

## 🎮 Controller (Contrôleur)

Le **Controller** fait le lien entre le Model et la View.

Il est responsable de :

- recevoir les actions de l'utilisateur ;
- appeler le Model ;
- récupérer les résultats ;
- choisir la View à afficher.

Il coordonne toute l'application.

---

# 🔄 Fonctionnement du MVC

```
Utilisateur
      │
      ▼
    View
      │
(action utilisateur)
      ▼
 Controller
      │
      ▼
    Model
      │
(traitement + BDD)
      ▼
 Controller
      │
      ▼
    View
      │
      ▼
Utilisateur
```

---

# 📌 Rôle de chaque composant

| Composant      | Rôle                                            |
| -------------- | ----------------------------------------------- |
| **Model**      | Gérer les données et la logique métier          |
| **View**       | Afficher les informations à l'utilisateur       |
| **Controller** | Recevoir les actions et coordonner Model ↔ View |

---

# 💡 Exemple concret : Connexion

### 1. L'utilisateur saisit :

```
Email
Mot de passe
```

↓

### 2. La View envoie les données au Controller.

↓

### 3. Le Controller demande au Model :

> "Cet utilisateur existe-t-il ?"

↓

### 4. Le Model vérifie dans la base de données.

↓

### 5. Le résultat est renvoyé au Controller.

↓

### 6. Le Controller choisit la View :

- ✅ Connexion réussie → Page d'accueil.
- ❌ Échec → Message d'erreur.

---

# 💡 Exemple : Boutique en ligne

### L'utilisateur clique sur :

```
Afficher les produits
```

Le déroulement est :

```
View
   ↓
Controller
   ↓
Model
   ↓
Base de données
   ↓
Model
   ↓
Controller
   ↓
View
```

La View affiche ensuite la liste des produits.

---

# 🎯 Avantages du MVC

- ✔ Séparation claire des responsabilités.
- ✔ Code plus propre et organisé.
- ✔ Maintenance facilitée.
- ✔ Tests plus simples.
- ✔ Réutilisation des composants.
- ✔ Développement en équipe plus efficace.

---

# ⚠️ Inconvénients

- Architecture plus complexe pour de petits projets.
- Plus de fichiers et de classes à gérer.
- Demande une bonne organisation du code.

---

# 📌 Schéma simplifié à mémoriser

```
    Utilisateur
         │
         ▼
     +-------+
     | View  |
     +-------+
         │
         ▼
   +-------------+
   | Controller  |
   +-------------+
         │
         ▼
    +----------+
    |  Model   |
    +----------+
         │
         ▼
Base de données
```

---

# 🧠 À retenir

- **MVC = Model + View + Controller**.
- **Model** : gère les données, les traitements et la base de données.
- **View** : affiche les données à l'utilisateur.
- **Controller** : reçoit les actions de l'utilisateur et fait communiquer le Model et la View.
- Les composants sont **séparés**, ce qui rend le code plus **modulaire**, **maintenable** et **évolutif**.
- Le flux principal est :

```
Utilisateur
→ View
→ Controller
→ Model
→ Base de données
→ Model
→ Controller
→ View
→ Utilisateur
```

> **Astuce mnémotechnique :**
>
> - **Model = Métier (données et logique)**
> - **View = Visuel (interface)**
> - **Controller = Chef d'orchestre (coordonne les échanges)**
