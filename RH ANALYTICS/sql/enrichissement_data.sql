-- création d'une colonne enciennété des employés
ALTER Table employes
ADD COLUMN anciennete INT;

UPDATE employes
SET anciennete = EXTRACT(
    YEAR FROM AGE(
        COALESCE(date_depart, CURRENT_DATE),
        date_embauche
    )
);

-- création d'une colonne cohorte

ALTER Table employes
ADD COLUMN cohorte_embauche INT

UPDATE employes 
SET cohorte_embauche = 
    EXTRACT (
        YEAR FROM date_embauche
    );


-- performance moyennee par employé

CREATE VIEW performance_moyenne AS
SELECT
    id_employe,
    AVG(ROUND(score,2)) AS score_moyen
FROM performances
GROUP BY id_employe;


-- score de performance par catégorie
CREATE VIEW categorie_performance AS
SELECT 
    p.id_employe,
    p.score_moyen,

    CASE 
        WHEN p.score_performance < 60 THEN 'Faible' 
        WHEN p.score_moyen BETWEEN 60 AND 80 THEN 'Moyenne'
        ELSE 'Elévé'
    END AS categorie_performance
FROM performance_moyenne p
