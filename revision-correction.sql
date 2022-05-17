DROP DATABASE if exists REVISION;

CREATE DATABASE REVISION;

use REVISION;

CREATE TABLE PERSON (
    `id` TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL, 
    `email` VARCHAR(100) NOT NULL
);


CREATE TABLE ARTICLE (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `content` TEXT NOT NULL,
    `author` TINYINT NOT NULL,
    `createdAt` DATETIME
);

CREATE TABLE CATEGORIE (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `label` VARCHAR(100) NOT NULL
);

CREATE TABLE CATEGORIE_ARTICLE (
    `article_id` INT NOT NULL,
    `categorie_id` INT NOT NULL
);


ALTER TABLE PERSON ADD UNIQUE (email);

ALTER TABLE ARTICLE
ADD CONSTRAINT `foreign_key_author` FOREIGN KEY (`author`) REFERENCES PERSON(id) ON DELETE CASCADE;

ALTER TABLE CATEGORIE_ARTICLE
ADD PRIMARY KEY (article_id, categorie_id),
ADD FOREIGN KEY (article_id) REFERENCES ARTICLE(id),
ADD FOREIGN KEY (categorie_id) REFERENCES CATEGORIE(id);



INSERT INTO PERSON (`name`, `email`) VALUES 
("DUPOND" ,"jean@dupond.fr"),
("LEBAIL" ,"alexis@lebail.fr"),
("MELICOURT" ,"julien@melicourt.fr");

INSERT INTO ARTICLE (`title`, `content`, `author`, `createdAt`) VALUES 
("Pomme poire" ,"Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil et
 voluptatem perspiciatis repellendus excepturi officiis aperiam porro voluptates molestiae 
 minus? Natus recusandae labore quas mollitia minus earum facere veritatis ad?", 3, NOW()),

("Tutu à la plage" ,"iatis repellendus excepturi officiis aperiam porro voluptates molestiae 
 minus? Natus recusandae", 1, NOW()),
("Piouf piouf" ,"ndae labore quas mollitia minus earum facere veritat", 2, NOW());


INSERT INTO CATEGORIE (`label`) VALUES 
("Jaune"),
("Bleu"),
("Fruit");


INSERT INTO CATEGORIE_ARTICLE (`article_id`, `categorie_id`) VALUES 
(3, 1),
(2, 3),
(1, 2);


-- 1 Changer le titre de l'article qui a l'id 3 en "C'est toto qui va à la plage"
-- 2 L'email de Monsieur LEBAIL à été changé en a.lebail@alexi.com"
-- 3 "Changer le titre et le contenu de l'article numero 2"

UPDATE ARTICLE 
SET title = "C'est toto qui va à la plage"
WHERE id = 3;

UPDATE PERSON
SET email = "a.lebail@alexi.com"
WHERE `name`= "LEBAIL"
AND `email` = "alexis@lebail.fr";

UPDATE ARTICLE
SET title = "Sula voila n'importe quoi suila voila ...",
content = "Blablabla hahah"
WHERE id = 2;


-- Modifier le titre de l'article ayant le plus grand nombre de catégorie
UPDATE ARTICLE
SET title = "Blablablo"
WHERE ARTICLE.id = (
    SELECT CATEGORIE_ARTICLE.article_id
    FROM CATEGORIE_ARTICLE
    GROUP BY CATEGORIE_ARTICLE.article_id
    ORDER BY COUNT(CATEGORIE_ARTICLE.article_id) DESC
    LIMIT 1
);
    


-- AJOUTER A LA TABLE PERSONNE UNE COLONNE password , après l'attribut name 


ALTER TABLE PERSON
ADD COLUMN `password` VARCHAR(255) AFTER `name`;

-- Modifier le type de l'attibut name dans la Table PERSON en remplaçant le type par VARCHAR(10)

ALTER TABLE PERSON
MODIFY `name` VARCHAR(10);


-- Changer le nom de la Table ARTICLE en POSTS

ALTER TABLE PERSON
RENAME TO `POSTS`;





