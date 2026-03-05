
-- création de la table departements
CREATE TABLE departements (
    id_departement INT PRIMARY KEY,
    nom_departement VARCHAR(100),
    manager VARCHAR(100),
    budget NUMERIC (10,2)

);

-- création de la table employes
 
CREATE TABLE employes (
    id_employe INT PRIMARY KEY,
    nom VARCHAR (50),
    prenom VARCHAR (50),
    poste VARCHAR (50),
    departement_id INT,
    date_embauche DATE,
    date_depart DATE,
    salaire NUMERIC (10,2),
    Foreign Key (departement_id) REFERENCES departements(id_departement)
);

-- création de la table performances

CREATE TABLE performances (
    id_performance INT PRIMARY KEY,
    id_employe INT,
    date_evaluation DATE,
    score INT check( score>0 or score <100),
    objectifs_atteints BOOLEAN,
    Foreign Key (id_employe) REFERENCES employes(id_employe)
);

CREATE TABLE turnover (
    id_depart INT PRIMARY KEY,
    id_employe INT,
    date_depart DATE,
    type_depart TEXT,
    anciennete TEXT,
    FOREIGN KEY (id_employe) REFERENCES employes(id_employe)


);

