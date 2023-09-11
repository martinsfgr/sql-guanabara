USE cadastro;
DESCRIBE gafanhotos;
DESCRIBE cursos;

ALTER TABLE gafanhotos
ADD COLUMN cursopreferido int;

ALTER TABLE gafanhotos
ADD FOREIGN KEY (cursopreferido)
REFERENCES cursos(idcurso);

SELECT * FROM gafanhotos;
SELECT * FROM cursos;

UPDATE gafanhotos
SET cursopreferido = '6'
WHERE id = '1';

SELECT nome, cursopreferido FROM gafanhotos;

SELECT gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano 
FROM gafanhotos 
JOIN cursos;

SELECT gafanhotos.nome, cursos.nome, cursos.ano
FROM gafanhotos
INNER JOIN cursos
ON gafanhotos.cursopreferido = cursos.idcurso
ORDER BY gafanhotos.nome;

SELECT gafanhotos.nome, cursos.nome, cursos.ano
FROM gafanhotos
LEFT OUTER JOIN cursos
ON gafanhotos.cursopreferido = cursos.idcurso
ORDER BY gafanhotos.nome;

SELECT gafanhotos.nome, cursos.nome, cursos.ano
FROM gafanhotos
RIGHT OUTER JOIN cursos
ON gafanhotos.cursopreferido = cursos.idcurso
ORDER BY gafanhotos.nome;
