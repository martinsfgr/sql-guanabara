/* Uma lista com o nome de todos as pessoas do sexo feminino */
DESC	gafanhotos;
SELECT	nome 
FROM	gafanhotos 
WHERE	sexo='F';

/* Uma lista com os dados de todos aqueles que nasceram entre 01/01/2000 e 31/12/2015 */
SELECT	nome, nascimento 
FROM	gafanhotos 
WHERE	nascimento 
BETWEEN	'2000-01-01' and '2015-12-31' 
ORDER BY nascimento;

/* Uma lista com o nome de todos os homens que trabalham como programadores */
SELECT nome, profissao 
FROM gafanhotos 
WHERE sexo='M' and profissao='Programador' 
ORDER BY nome;

/* Uma lista com os dados de todas as mulheres que nasceram no Brasil e que têm seu nome iniciando com a letra J */
SELECT nome, sexo, nacionalidade 
FROM gafanhotos 
WHERE nome 
LIKE 'j%' and sexo='F' and nacionalidade='Brasil';

/* Uma lista com o nome e nacionalidade de todos os homens que têm Silva no nome, não nasceram no Brasil e pesam menos de 100 kg */
SELECT nome, nacionalidade 
FROM gafanhotos 
WHERE nome 
LIKE '%silva%' and nacionalidade!='Brasil' and peso<100;

/* Qual é a maior altura entre homens que moram no Brasil? */
SELECT MAX(peso) 
FROM gafanhotos 
WHERE sexo='M' and nacionalidade='Brasil';

/* Qual é a media de peso das pessoas cadastradas? */
SELECT AVG(peso) 
FROM gafanhotos;

/* Qual é o menor peso entre as mulheres que nasceram fora do Brasil entre 01/01/1990 e 31/12/2000? */
SELECT MIN(peso) 
FROM gafanhotos 
WHERE sexo='F' and nacionalidade!='Brasil' and nascimento BETWEEN '1990-01-01' and '2000-12-31';

/* Quantas mulheres tem mais de 1.90 de altura? */
SELECT nome, altura 
FROM gafanhotos 
WHERE sexo='F' and altura>=1.90 
ORDER BY altura;

/* Uma lista com as profissões das pessoas e seus respectivos quantitativos */
SELECT profissao, COUNT(profissao) as 'Quantidade' 
FROM gafanhotos
GROUP BY profissao;

/* Quantas homens e mulheres nasceram após 01/01/2005? */
SELECT sexo, COUNT(*) as 'Quantidade'
FROM gafanhotos 
WHERE nascimento>='2005-01-01' 
GROUP BY sexo;

/* Uma lista com pessoas que nasceram fora do Brasil, mostrando o país de origem e o total de pessoas nascidas lá. Só nos interessa os países que tiveram mais de 3 pessoas com essa nacionalidade */
SELECT nacionalidade, COUNT(*) as 'Quantidade'
FROM gafanhotos 
WHERE nacionalidade!='Brasil' 
GROUP BY nacionalidade 
ORDER BY COUNT(*) DESC;

/* Uma lista agrupada pela altura das pessoas, mostrando quantas pessoas pesam mais de 100kg e que estão acima da média de altura de todos os cadastrados */
SELECT altura, COUNT(*) as 'Quantidade'
FROM gafanhotos 
WHERE peso>100 
GROUP BY altura 
HAVING altura > (SELECT AVG(altura) FROM gafanhotos);