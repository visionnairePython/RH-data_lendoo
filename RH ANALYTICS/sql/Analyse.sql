--1) combien d'employés sont actuellement actifs ?

SELECT count(id_employe) as employes_actif
FROM employes
WHERE date_depart ISNULL;

--2)Combien de départs avons-nous eu sur les 12 derniers mois ?
SELECT COUNT(*) as departs_12_mois
FROM turnover
WHERe date_depart >= CURRENT_DATE-INTERVAL'12 months';

--3)Quels départements ont le turnover le plus élevé ?SELECT 
SELECT d.nom_departement, 
    COUNT(t.id_depart) AS nbre_turnover
FROM turnover t
JOIN employes e 
    ON e.id_employe = t.id_employe
JOIN departements d 
    ON d.id_departement = e.departement_id
GROUP BY d.nom_departement
ORDER BY nbre_turnover DESC;

-- 4)Quel est le salaire moyen par département ?

SELECT d.nom_departement, ROUND(AVG (e.salaire),2) as salaire_moyen_departement
FROM departements d
JOIN employes e ON d.id_departement = e.id_employe
GROUP BY d.nom_departement
ORDER BY salaire_moyen_departement DESC;

--5)Quels employés ont plus de 5 ans d’ancienneté ?

SELECT  nom, prenom, salaire, anciennete
FROM employes
WHERE anciennete > 5
ORDER BY anciennete DESC

--Classez les départements par performance moyenne trimestrielle.

SELECT d.nom_departement, ROUND(avg((p.score)),2) as performance_moyenne
FROM performances p
JOIN employes e ON e.id_employe = p.id_employe
JOIN departements d ON d.id_departement = e.departement_id
GROUP BY d.nom_departement
ORDER BY performance_moyenne DESC;

SELECT
   p.id_employe,
   e.nom,
   e.prenom,
   ROUND(AVG(p.score), 2) AS score_moyen,
   COUNT(*) AS nb_trimestres
FROM performances p JOIN employes e ON p.id_employe = e.id_employe
GROUP BY p.id_employe, e.nom, e.prenom
HAVING COUNT(*) >= 3
ORDER BY score_moyen DESC 
LIMIT 10;

-- Question 8 : Identifier les employés les moins performants et leur département

SELECT
    e.id_employe,
    e.nom,
    e.prenom,
    d.nom_departement,
    ROUND(AVG(p.score), 2) AS score_moyen
FROM performances p
JOIN employes e ON p.id_employe = e.id_employe
JOIN departements d ON e.departement_id = d.id_departement
GROUP BY e.id_employe, e.nom, e.prenom, d.nom_departement
HAVING AVG(p.score) < 60
ORDER BY score_moyen ASC;


-- Question 9 : Calculer la rétention moyenne par cohorte d'embeauche 

SELECT
    cohorte_embauche,
    ROUND(AVG(anciennete), 2) AS anciennete_moyenne
FROM employes
GROUP BY cohorte_embauche
ORDER BY cohorte_embauche;

-- Question 10 : Quels départements recrutent le plus souvent?
SELECT
    d.nom_departement,
    COUNT(e.id_employe) AS recrutements
FROM employes e
JOIN departements d ON e.departement_id = d.id_departement
GROUP BY d.nom_departement
ORDER BY recrutements DESC;

-- Question 11 : Proportion des départs : Volontaires vs Involontaires
SELECT
    type_depart,
    COUNT(*) AS nombre_departs,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS pourcentage
FROM turnover
GROUP BY type_depart;

-- Question 12 : Distribution des postes par ancienneté
SELECT
    poste,
    CASE
        WHEN anciennete < 2 THEN '0–2 ans'
        WHEN anciennete BETWEEN 2 AND 5 THEN '2–5 ans'
        ELSE '5+ ans'
    END AS tranche_anciennete,
    COUNT(*) AS nombre_employes
FROM employes
GROUP BY poste, tranche_anciennete
ORDER BY poste, tranche_anciennete;

-- Question 13 : Quels employés n'ont pas reçu de feedback cette année?
SELECT
    e.id_employe,
    e.nom,
    e.prenom
FROM employes e
LEFT JOIN performances p
    ON e.id_employe = p.id_employe
    AND EXTRACT(YEAR FROM p.date_evaluation) = EXTRACT(YEAR FROM CURRENT_DATE)
WHERE p.id_employe IS NULL
AND e.date_depart IS NULL;

-- Question 14 : Segementation des employés par niveau de performanche
SELECT
    categorie_performance,
    COUNT(*) AS nombre_employes
FROM categorie_performance
GROUP BY categorie_performance
ORDER BY nombre_employes DESC;


-- Question 15 : Tableau KPI par département et par cohorte
SELECT
    d.nom_departement,
    e.cohorte_embauche,
    COUNT(e.id_employe) AS effectif,
    ROUND(AVG(e.salaire), 2) AS salaire_moyen,
    ROUND(AVG(pm.score_moyen), 2) AS score_moyen,
    ROUND(AVG(e.anciennete), 2) AS anciennete_moyenne
FROM employes e
JOIN departements d ON e.departement_id = d.id_departement
LEFT JOIN performance_moyenne pm ON e.id_employe = pm.id_employe
GROUP BY d.nom_departement, e.cohorte_embauche
ORDER BY d.nom_departement, e.cohorte_embauche;
