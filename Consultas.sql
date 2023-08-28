/* CONSULTAS A VARRAY */


/* Retorna os agentes que term telegones 81 e email do dominio '@email.com'*/
SELECT Nome, Email, COLUMN_VALUE AS Telefone_DDD_81
FROM tb_Agente a, TABLE(a.lista_fones) f
WHERE f.COLUMN_VALUE LIKE '81%' AND Email LIKE '%@email.com';

/* Retorna a media de idade dos agentes e motoristas que possuem pelo mennos um telefone com DDD 81 */
SELECT 'Agente' AS Tipo, AVG(Idade) AS MediaIdade
FROM tb_Agente a
WHERE EXISTS (SELECT 1 FROM TABLE(a.lista_fones) f WHERE f.COLUMN_VALUE LIKE '81%')
UNION
SELECT 'Motorista' AS Tipo, AVG(Idade) AS MediaIdade
FROM tb_Motorista m, TABLE(m.lista_fones) f1
WHERE EXISTS (SELECT 1 FROM TABLE(m.lista_fones) f1 WHERE f1.COLUMN_VALUE LIKE '81%')

/* Obtendo o numero de motorista e agente por sexo que tem pelo menos um telefone com DDD 81*/  
SELECT 'Agente' AS Tipo, Sexo, COUNT(*) AS Total
FROM tb_Agente a
WHERE EXISTS (SELECT 1 FROM TABLE(a.lista_fones) f WHERE f.COLUMN_VALUE LIKE '81%')
GROUP BY Sexo
UNION
SELECT 'Motorista' AS Tipo, Sexo, COUNT(*) AS Total
FROM tb_Motorista m
WHERE EXISTS (SELECT 1 FROM TABLE(m.lista_fones) f WHERE f.COLUMN_VALUE LIKE '81%')
GROUP BY Sexo;

/* Consulta que lista todos os Motoristas que têm mais de um telefone começando com '81' */
SELECT m.Nome
FROM tb_Motorista m
WHERE (
    SELECT COUNT(*)
    FROM TABLE(m.lista_fones) f
    WHERE f.COLUMN_VALUE LIKE '81%'
) > 1;
