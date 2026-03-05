# 📊 Projet RH Analytics – SQL (PostgreSQL)

## 👤 Contexte du projet
Ce projet simule une mission réelle de Data Analyst SQL au sein de l’entreprise fictive **DataLendo**, pour le service **Ressources Humaines (RH)**.  
L’objectif est d’exploiter des données RH afin de fournir des indicateurs clés, des analyses de performance et des insights décisionnels utiles à la direction.

Ce projet démontre des compétences en :
- SQL avancé (PostgreSQL)
- Analyse de données RH
- Structuration d’un projet data
- Traduction de besoins business en requêtes analytiques

---

## 🎯 Objectifs business
Le service RH souhaite :
- Comprendre l’évolution des effectifs  
- Identifier les départements à risque (turnover)  
- Évaluer la performance des employés  
- Analyser la rétention par cohorte d’embauche  
- Disposer d’un tableau de bord RH exploitable  

15 questions business ont été posées et résolues exclusivement avec SQL.

---

## 🗂️ Données utilisées

### 1️⃣ employes  
Informations individuelles des employés :  
`id_employe`, `nom`, `prenom`, `poste`, `departement_id`, `date_embauche`, `date_depart`, `salaire`

### 2️⃣ departements  
Référentiel des départements :  
`id_departement`, `nom_departement`, `manager`, `budget`

### 3️⃣ performances  
Évaluations trimestrielles :  
`id_performance`, `id_employe`, `date_evaluation`, `score`, `objectifs_atteints`

### 4️⃣ turnover  
Historique des départs :  
`id_depart`, `id_employe`, `date_depart`, `type_depart`, `anciennete`

---

## 🔧 Transformations & enrichissement des données

### Colonnes calculées
- **anciennete** : durée entre la date d’embauche et la date de départ (ou aujourd’hui)  
- **cohorte_embauche** : année d’entrée  
- **score_moyen** : moyenne des scores de performance  
- **categorie_performance** :  
  - Faible (< 60)  
  - Moyenne (60–80)  
  - Élevée (> 80)

Ces enrichissements permettent une analyse temporelle, comparative et stratégique.

---

## 📊 Analyses réalisées (questions business)

Les analyses couvrent notamment :
- Effectif actuel  
- Turnover global et par département  
- Départs volontaires vs involontaires  
- Salaire moyen par département  
- Employés à forte ancienneté  
- Performance moyenne par département  
- Top 10 des employés les plus performants  
- Employés les moins performants  
- Rétention par cohorte  
- Départements qui recrutent le plus  
- Employés sans feedback récent  
- Segmentation des performances  
- Tableau KPI RH (département × cohorte)

Toutes les analyses sont réalisées via des requêtes SQL documentées.

---

## 📈 Exemples de KPIs produits
- Effectif par département  
- Salaire moyen  
- Score de performance moyen  
- Ancienneté moyenne  
- Turnover par type  
- Rétention par cohorte  

---

## 🧠 Insights & recommandations RH
- Mettre en place des plans de rétention pour les employés à forte ancienneté  
- Auditer les départements à turnover élevé  
- Renforcer les processus de feedback  
- Adapter les politiques salariales selon la performance  
- Améliorer l’onboarding des nouvelles cohortes  

---

## 👨‍💻 Auteur
**Moussa Mara**  
Data Analyst — SQL | Power BI | Excel

---

## ✔ Pourquoi ce projet est pertinent pour un recruteur ?
- Cas métier réaliste  
- SQL avancé et structuré  
- Démarche analytique claire  
- Capacité à générer des insights business  
- Projet directement exploitable en entreprise  