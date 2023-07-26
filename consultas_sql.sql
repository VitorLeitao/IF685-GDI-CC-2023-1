/*1. ALTER TABLE */
ALTER TABLE Atracao
ADD CONSTRAINT chk_preco_maximo CHECK (Preco <= 10000);

/*2. CREATE INDEX */
CREATE INDEX idx_cliente_idade
ON Cliente (Idade);

/*3. INSERT INTO: inserindo um elemento na tabela LocalCapacidade e leva*/
INSERT INTO LocalCapacidade(Local, Capacidade) Values('Valorant Masters', 5000);
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(14, '96979899900', '98765432116', TIMESTAMP '2023-10-18 11:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(14, '81828384850', '98765432112', TIMESTAMP '2023-10-28 12:00:00');

/*4. UPDATE: Alterando a capacidade suportada pelo Local 'Praça da Sé' na tabela LocalCapacidade*/
UPDATE LocalCapacidade
SET Capacidade = Capacidade + 150
WHERE Local = 'Praça da Sé';

/*5. DELETE: Deletando a coluna que foi inserida no INSERT INTO */
DELETE FROM LocalCapacidade
WHERE Local = 'Valorant Masters';

/* Calcular a receita total gerada pelas reservas em cada hotel, considerando o preço do quarto e o número de noites de hospedagem*/
SELECT H.Id_Hotel, SUM(QP.Preco * (R.Check_Out - R.Check_In)) AS receita_total
FROM Hotel H
INNER JOIN QuartoPreco QP ON H.Id_Hotel = QP.Id_Hotel
INNER JOIN Reserva R ON H.Id_Hotel = R.Id_Hotel
GROUP BY H.Id_Hotel
ORDER BY receita_total DESC;

/* Consulta que traz ao dono do banco de dados uma descrição dos seus melhores trimestres. Podendo assim fazer um estudo detalhado das abordagens necessárias */

CREATE VIEW VisitaPorTrimestre AS
SELECT
    CASE
        WHEN EXTRACT(MONTH FROM Check_In) BETWEEN 1 AND 3 THEN '1º Trimestre'
        WHEN EXTRACT(MONTH FROM Check_In) BETWEEN 4 AND 6 THEN '2º Trimestre'
        WHEN EXTRACT(MONTH FROM Check_In) BETWEEN 7 AND 9 THEN '3º Trimestre'
        WHEN EXTRACT(MONTH FROM Check_In) BETWEEN 10 AND 12 THEN '4º Trimestre'
    END AS Trimestre,
    COUNT(*) AS Total_Visitas
FROM Reserva
GROUP BY
    CASE
        WHEN EXTRACT(MONTH FROM Check_In) BETWEEN 1 AND 3 THEN '1º Trimestre'
        WHEN EXTRACT(MONTH FROM Check_In) BETWEEN 4 AND 6 THEN '2º Trimestre'
        WHEN EXTRACT(MONTH FROM Check_In) BETWEEN 7 AND 9 THEN '3º Trimestre'
        WHEN EXTRACT(MONTH FROM Check_In) BETWEEN 10 AND 12 THEN '4º Trimestre'
    END
ORDER BY Total_Visitas DESC;
SELECT * FROM VisitaPorTrimestre;

/*Hotel, quarto, check in e out a partir de um CEP dado */
SELECT h.Id_Hotel, r.Quarto as quarto_reservado,  r.Check_In, r.Check_Out
FROM hotel h
INNER JOIN reserva r
ON h.id_hotel = r.id_hotel 
WHERE CEP = '10110-111';

/* Consulta que retorna a media de idades dos clientes que fazem reserva em cada hotel da base de dados */
SELECT h.Id_Hotel, AVG(c.Idade) AS media
FROM Cliente c
INNER JOIN Efetua e ON c.CPF_Cliente = e.CPF_Cliente
INNER JOIN Hotel h ON e.Id_Hotel  = h.Id_Hotel
GROUP BY h.Id_Hotel
ORDER BY media DESC;

/* Para cada categoria de Faixa etaria, retorna a quantidade de clientes para cada categoria*/
SELECT
    Faixa_Etaria,
    COUNT(*) AS Quantidade
FROM (
    SELECT
        c.CPF_Cliente,
        c.Nome,
        CASE
            WHEN c.Idade BETWEEN 18 AND 24 THEN 'Jovem'
            WHEN c.Idade BETWEEN 25 AND 34 THEN 'Jovem adulto'
            WHEN c.Idade BETWEEN 35 AND 59 THEN 'Adulto'
            ELSE 'Idoso'
        END AS Faixa_Etaria
    FROM Cliente c
    WHERE c.CPF_Cliente = ANY (
        SELECT DISTINCT CPF_Cliente
        FROM Reserva
        WHERE Id_Hotel = ANY (
            SELECT Id_Hotel
            FROM QuartoPreco
            GROUP BY Id_Hotel
            HAVING AVG(Preco) > ANY (
                SELECT AVG(Preco)
                FROM QuartoPreco
            )
        )
    )
) ClientesPorFaixaEtaria
GROUP BY Faixa_Etaria
ORDER BY COUNT(*) DESC;

/*Uma consulta que nos possibilita de vermos todos os hotéis que possuem quartos com uma determinada faixa de preço. Nesse caso, preços entre 100/200 reais, e a quantidade de quartos de cada hotel */
SELECT h.Id_Hotel, qp.Quarto, qp.Preco
FROM Hotel h
JOIN QuartoPreco qp ON h.Id_Hotel = qp.Id_Hotel
WHERE h.Id_Hotel IN (
    SELECT DISTINCT qp.Id_Hotel
    FROM QuartoPreco qp
    WHERE qp.Preco BETWEEN 100 AND 200 OR qp.Preco > 300
) AND (qp.Preco BETWEEN 100 AND 200 OR qp.Preco > 300);


/*Consulta que nos possibilita analisar as atrações mais visitadas pelos clientes com idade acima de 30 anos */
SELECT  a.Local, COUNT(*) AS Total_Visitas
FROM Atracao a
WHERE a.ID_Atracao IN (
    SELECT DISTINCT l.ID_Atracao
    FROM Leva l
    WHERE l.CPF_Cliente IN (
        SELECT DISTINCT c.CPF_Cliente
        FROM Cliente c
        WHERE c.Idade > 30
    )
)
GROUP BY a.ID_Atracao, a.Local
ORDER BY Total_Visitas DESC;

/*Consulta que nos possibilita analisar os hotéis com a maior média de preço de quartos */
SELECT h.Id_Hotel, h.Num_quartos, AVG(qp.Preco) AS Media_Preco_Quartos
FROM Hotel h
JOIN QuartoPreco qp ON h.Id_Hotel = qp.Id_Hotel
GROUP BY h.Id_Hotel, h.Num_quartos
HAVING AVG(qp.Preco) > (
    SELECT AVG(Preco) AS Media_Preco_Geral FROM QuartoPreco
);


/*Retorna os nomes dos clientes que foram à atração mais cara da base de dados*/
SELECT c.nome
FROM atracao a
INNER JOIN leva l ON a.ID_ATRACAO = l.ID_ATRACAO
INNER JOIN cliente c ON c.CPF_CLIENTE = l.CPF_CLIENTE
WHERE a.preco = (
    SELECT MAX(preco)
    FROM atracao a2
    INNER JOIN leva l2 ON a2.ID_ATRACAO = l2.ID_ATRACAO
    INNER JOIN cliente c2 ON c2.CPF_CLIENTE = l2.CPF_CLIENTE
);

/* Nomes dos clientes que visitaram algum museu */
SELECT c.Nome
FROM Cliente c
WHERE c.Nome IN(
    SELECT c2.Nome
    FROM Cliente c2
    INNER JOIN Leva l ON c2.CPF_Cliente  = l.CPF_Cliente 
    INNER JOIN Atracao a ON l.Id_Atracao = a.ID_Atracao 
    WHERE a.Local LIKE '%Museu%'
);
/* */
SELECT
    Faixa_Etaria,
    COUNT(*) AS Quantidade_Viajantes
FROM (
    SELECT
        c.CPF_Cliente,
        c.Nome,
        CASE
            WHEN c.Idade BETWEEN 18 AND 24 THEN 'Jovem'
            WHEN c.Idade BETWEEN 25 AND 34 THEN 'Jovem adulto'
            WHEN c.Idade BETWEEN 35 AND 59 THEN 'Adulto'
            ELSE 'Idoso'
        END AS Faixa_Etaria
    FROM Cliente c
    WHERE c.CPF_Cliente = ANY (
        SELECT DISTINCT CPF_Cliente
        FROM Reserva
    )
) ClientesPorFaixaEtaria
GROUP BY Faixa_Etaria
ORDER BY COUNT(*) DESC;


/* Com o objetivo de comparar as idades dos clientes que visitaram Alguma praça ou maracana, consultaremos quais são os clientes que visitaram o praça que são mais velhos que todos que foram ao maracana */
SELECT c.Nome, c.Idade
FROM Cliente c
WHERE c.Nome IN (
    SELECT c2.Nome
    FROM Cliente c2
    INNER JOIN Leva l ON c2.CPF_Cliente = l.CPF_Cliente
    INNER JOIN Atracao a ON l.ID_Atracao = a.ID_Atracao
    WHERE a.Local LIKE '%Praça%'
)
AND c.Idade > ALL (
    SELECT c3.Idade
    FROM Cliente c3
    INNER JOIN Leva l2 ON c3.CPF_Cliente = l2.CPF_Cliente
    INNER JOIN Atracao a2 ON l2.ID_Atracao = a2.ID_Atracao
    WHERE a2.Local LIKE '%Maracanã%'
);

/*Com o objetivo de fazer uma analise dos clientes que visitaram atrações mais "culturais", consultaremos a uniao dos clientes que visitaram  museus e/ou bibliotecas*/

SELECT c.Nome, c.Idade, a.Local  
FROM Cliente c
INNER JOIN Leva l ON c.CPF_Cliente = l.CPF_Cliente
INNER JOIN Atracao a ON l.ID_Atracao = a.ID_Atracao
WHERE a.Local LIKE '%Museu%'
UNION
SELECT c.Nome, c.Idade, a.Local
FROM Cliente c
INNER JOIN Leva l ON c.CPF_Cliente = l.CPF_Cliente
INNER JOIN Atracao a ON l.ID_Atracao = a.ID_Atracao
WHERE a.Local LIKE '%Biblioteca%';


/*Consuta que retorna as atrações e os clientes que a visitaram, mesmo aquelas atrações que não tiveram visitas, para anlises futuras*/
SELECT A.ID_Atracao, A.Local, C.Nome, C.Idade
FROM Atracao A
LEFT JOIN Leva L ON A.ID_Atracao = L.ID_Atracao
LEFT JOIN Cliente C ON L.CPF_Cliente = C.CPF_Cliente;

/*Agrupando por país, mostraremos a menor idade dos clientes*/
SELECT e.Pais, MIN(c.Idade) as Menor_Idade
FROM Cliente c
INNER JOIN Endereco e ON e.CEP = c.CEP
GROUP BY e.Pais
ORDER BY Menor_Idade ASC;
