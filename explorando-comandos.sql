create database cadastro
default character set utf8mb3
default collate utf8mb3_general_ci;

use cadastro;

CREATE TABLE pessoas (
	id int NOT NULL AUTO_INCREMENT,
	nome varchar(30) NOT NULL,
    nascimento date,
    sexo enum("M", "F"),
    peso decimal(5, 2),
    altura decimal(3, 2),
    nacionalidade varchar(20) DEFAULT "Brasil",
    primary key(id)
) DEFAULT CHARSET = utf8mb3;

INSERT INTO pessoas (nome, nascimento, sexo, peso, altura, nacionalidade) VALUES ("Mauricio", "2001-06-04", "M", "85.2", "1.77", "Brasil");
INSERT INTO pessoas VALUES (DEFAULT, "Heloisa", "2001-03-06", "F", "52.3", "1.52", DEFAULT);
INSERT INTO pessoas VALUES (DEFAULT, "Raimundo", "1967-12-21", "m", "79.3", "1.72", DEFAULT), (DEFAULT, "Maria", "1977-07-07", "F", "62.8", "1.50", DEFAULT);

SELECT * FROM pessoas;

ALTER TABLE pessoas ADD COLUMN profissao varchar(20) NOT NULL DEFAULT "0";
ALTER TABLE pessoas DROP COLUMN profissao;
ALTER TABLE pessoas ADD COLUMN profissao varchar(10) NOT NULL DEFAULT "0" AFTER nome;
ALTER TABLE pessoas ADD COLUMN codigo int NOT NULL DEFAULT "0" FIRST;
ALTER TABLE pessoas MODIFY COLUMN profissao varchar(20);
ALTER TABLE pessoas CHANGE COLUMN profissao prof varchar(20) NOT NULL DEFAULT "0";
ALTER TABLE pessoas CHANGE COLUMN prof profissao varchar(20) NOT NULL DEFAULT "0";
ALTER TABLE pessoas RENAME TO gafanhotos;

SELECT * FROM gafanhotos;

CREATE TABLE IF NOT EXISTS cursos (
	nome varchar(30) NOT NULL UNIQUE,
    descricao text,
    carga int UNSIGNED,
    totalaulas int UNSIGNED,
    ano year DEFAULT "2023"
) DEFAULT CHARSET = utf8mb4;

DESCRIBE cursos;

ALTER TABLE cursos ADD COLUMN idcurso int FIRST;
ALTER TABLE cursos ADD PRIMARY KEY (idcurso);

CREATE TABLE IF NOT EXISTS teste (
	id int,
    nome varchar(20)
);

INSERT INTO teste VALUES (1, "Mauricio");
SELECT * FROM teste;
DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS teste;
DESCRIBE pessoas;

INSERT INTO cursos VALUES
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2','Algoritimos','Logica de Programação','20','8','2014'),
('3','Photoshop','Aulas de Photoshop CC','9','20','2014'),
('4','PGP','PHP para Iniciantes','33','40','2010'),
('5','Jarva','Intro ao Java','22','10','2000'),
('6','MySQL','Curso MySQL','21','15','2016'),
('7','World','Word Completo','40','30','2018'),
('8','Sapateado','Dança Rítimica','14','30','2018'),
('9','Cozinha Árabe','Aprenda a fazer Kibe','40','30','2018'),
('10','YouTuber','Gerar Polêmicas e Ganhar Inscritos','5','2','2010');

SELECT * FROM cursos;
SELECT * FROM pessoas;
SELECT * FROM gafanhotos;

UPDATE cursos SET nome="HTML 5" WHERE idcurso="1";
UPDATE cursos SET nome="Word" WHERE idcurso="7";
UPDATE cursos SET nome="PHP", ano="2015" WHERE idcurso="4";
UPDATE cursos SET nome="Java", carga="40", ano="2015" WHERE idcurso="5" LIMIT 1;
UPDATE cursos SET carga="50" where ano="2018" LIMIT 1;

DELETE FROM cursos WHERE idcurso="8";
DELETE FROM cursos WHERE idcurso>=8 LIMIT 2;
TRUNCATE TABLE cursos;

SELECT * FROM cursos ORDER BY nome;
SELECT * FROM cursos ORDER BY nome DESC;
SELECT nome, carga, ano FROM cursos;
SELECT ano, nome, carga FROM cursos ORDER BY ano, nome;
SELECT * FROM cursos WHERE ano="2016" ORDER BY nome;
SELECT * FROM cursos WHERE ano<"2016" ORDER BY ano, nome;
SELECT * FROM cursos WHERE ano<"2016" AND ano>"2014" ORDER BY ano, nome;
SELECT * FROM cursos WHERE ano BETWEEN 2014 and 2016 ORDER BY ano, nome;
SELECT * FROM cursos WHERE nome="PHP";
SELECT * FROM cursos WHERE nome LIKE 'P%_';
SELECT * FROM cursos WHERE nome LIKE 'a%';
SELECT * FROM cursos WHERE nome LIKE '%a';
SELECT * FROM cursos WHERE nome LIKE '%a%';
SELECT * FROM gafanhotos WHERE nome LIKE '%_silva';
SELECT * FROM gafanhotos WHERE nome LIKE '%silva';
SELECT * FROM gafanhotos WHERE nome LIKE 'silva%';
SELECT DISTINCT profissao FROM gafanhotos ORDER BY profissao;
SELECT COUNT(*) from cursos;
SELECT MAX(carga) FROM cursos;
SELECT MIN(carga) FROM cursos;
SELECT SUM(totaulas) FROM cursos;
SELECT AVG(totaulas) FROM cursos;
SELECT carga FROM cursos GROUP BY carga;
SELECT carga,COUNT(carga) FROM cursos GROUP BY carga;
SELECT carga,COUNT(nome) FROM cursos GROUP BY carga HAVING COUNT(nome) > 3;
SELECT ano,COUNT(*) FROM cursos GROUP BY ano ORDER BY COUNT(*);
SELECT ano,COUNT(*) FROM cursos GROUP BY ano HAVING COUNT(*) >= 5 ORDER BY COUNT(*);