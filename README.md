# factureo
## Description

Application mobile développée avec Flutter permettant de créer une facture personnalisée de manière dynamique. L’utilisateur peut ajouter ou supprimer des articles, saisir les informations du client, et obtenir un aperçu structuré de la facture avec calculs automatiques des montants HT, TVA et TTC.

## Fonctionnalités
### 1. Écran de création de facture

- [x] Formulaire avec :
    - [x] Nom du client
    - [x] Email du client
    - [x] Date de facture (sélection manuelle ou automatique)
    - [x] Liste d’articles dynamique
- [x] Calcul automatique des totaux :
    - [x] Total HT
    - [x] TVA (20 %)
    - [x] Total TTC

### 2. Gestion dynamique des articles

- [x] Ajout d’un nouvel article
- [x] Suppression d’un article
- [x] Mise à jour en temps réel des totaux

### 3. Aperçu de la facture

- [x] Affichage structuré reprenant :
    - [x] Les informations du client
    - [x] La date
    - [x] Un tableau détaillé des articles
    - [x] Les totaux HT, TVA et TTC
- [x] Design inspiré d’une facture réelle

## Choix techniques
- State Management : utilisation de `setState` pour la gestion simple de l’état local.
- Gestion du thème clair/sombre : implémentée via un `InheritedWidget` personnalisé, permettant de propager efficacement les changements de thème dans l’arborescence des widgets sans recourir à des packages externes. Cette approche offre une solution légère et performante pour le **theme switching**, facilitant la réactivité et la maintenabilité du code.
- Utilisation de `TextEditingController` pour la gestion des champs de saisie.

## Captures d’écran

### Thème sombre

#### 1. Aucun article ajouté
<img src="assets/images/empty_article.jpg" alt="Aucun article - sombre" style="max-width: 100%; width: 500px;" />

#### 2. Ajout d’un article
<img src="assets/images/add_article.jpg" alt="Ajout d’article - sombre" style="max-width: 100%; width: 500px;" />

#### 3. Facture avec articles
<img src="assets/images/invoice.jpg" alt="Facture avec articles - sombre" style="max-width: 100%; width: 500px;" />

#### 4. Aperçu de la facture
<img src="assets/images/preview_dark.jpg" alt="Aperçu facture - sombre" style="max-width: 100%; width: 500px;" />

---

### Thème clair

#### 1. Aucun article ajouté
<img src="assets/images/empty_article_light.jpg" alt="Aucun article - clair" style="max-width: 100%; width: 500px;" />

#### 2. Ajout d’un article
<img src="assets/images/add_article_light.jpg" alt="Ajout d’article - clair" style="max-width: 100%; width: 500px;" />

#### 3. Facture avec articles
<img src="assets/images/invoice_with_articles.jpg" alt="Facture avec articles - clair" style="max-width: 100%; width: 500px;" />

#### 4. Aperçu de la facture
<img src="assets/images/preview_light.jpg" alt="Aperçu facture - clair" style="max-width: 100%; width: 500px;" />


## Licence

Ce projet est open-source sous licence MIT.



