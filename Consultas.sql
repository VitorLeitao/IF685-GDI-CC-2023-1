/* CONSULTAS A VARRAY */
/* Retorna os agentes que tem telegones 81 e email do dominio '@email.com'*/
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

--=======================================================================================================================================================================================================================================
-- CONSULTAS COM DEREF

-- Consulta o Nome do indicador em que tenha 'ia' no nome ou que o numero do endereço seja maior que 2
SELECT C.Nome, DEREF(C.indicador).Nome AS NomeIndicador
FROM tb_cliente C
WHERE DEREF(C.indicador).Nome LIKE '%ia%' OR LENGTH(DEREF(C.indicador).Num_endereco) > 2;

-- Seleciona tudo dos clientes que tenham indicadores com a idade menor doque a média da idade da tabela cliente
SELECT
    C.CPF_Cliente AS CPF_Cliente,
    C.Nome AS Nome_Cliente,
    C.Idade AS Idade_Cliente,
    C.CEP AS CEP_Cliente,
    DEREF(C.indicador).CPF_Cliente AS CPF_Indicador,
    DEREF(C.indicador).Nome AS Nome_Indicador,
    DEREF(C.indicador).Idade AS Idade_Indicador
FROM tb_cliente C
WHERE DEREF(C.indicador).Idade < (
    SELECT AVG(C1.Idade) 
    FROM tb_cliente C1
);

-- Consulta nome e quarto dentro da Nested table Reservas em que o checkin é maior ou igual à data atual e o quarto termina com 01 e são ordenadas pelo check_in
SELECT DEREF(h.CPF_Cli).Nome AS NomeCliente, r.Quarto
FROM tb_hospeda h, TABLE(DEREF(h.ID_Hot).Reservas) r
WHERE r.Check_In >= SYSDATE AND r.Quarto LIKE '%01%'
ORDER BY r.Check_In;
    
-- Consulta para obter informações sobre hóspedes, clientes, hotéis e motorista com algumas condições, agrupados e ordenados e maneira escolhida.
SELECT
    DEREF(H.CPF_Cli).CPF_Cliente AS CPF_Cliente_Hospede,
    DEREF(H.CPF_Cli).Nome AS Nome_Cliente_Hospede,
    DEREF(H.CPF_Cli).Idade AS Idade_Cliente_Hospede,
    DEREF(H.ID_Hot).Id_Hotel AS ID_Hotel,
    DEREF(H.ID_Hot).Num_quartos AS Num_Quartos_Hotel,
    DEREF(H.Motorista).CPF_Funcionario AS CPF_Motorista,
    DEREF(H.Motorista).Nome AS Nome_Motorista,
    H.Ponto_embarque AS Ponto_Embarque,
    H.Ponto_desembarque AS Ponto_Desembarque,
    H.Data_hora AS Data_Hora_Hospedagem
FROM tb_hospeda H
WHERE H.Ponto_embarque LIKE 'Hotel T%'
    AND H.Data_hora <= TO_DATE('2023-09-10', 'YYYY-MM-DD')
    AND DEREF(H.ID_Hot).Num_quartos > 20
    AND DEREF(H.CPF_Cli).Idade > 20
GROUP BY
    DEREF(H.CPF_Cli).CPF_Cliente,
    DEREF(H.CPF_Cli).Nome,
    DEREF(H.CPF_Cli).Idade,
    DEREF(H.ID_Hot).Id_Hotel,
    DEREF(H.ID_Hot).Num_quartos,
    DEREF(H.Motorista).CPF_Funcionario,
    DEREF(H.Motorista).Nome,
    H.Ponto_embarque,
    H.Ponto_desembarque,
    H.Data_hora
ORDER BY
    DEREF(H.CPF_Cli).Nome,
    DEREF(H.ID_Hot).Id_Hotel;

-- Consulta nome do indicador e quantidade de vezes que o cliente foi para o mesmo hotel, utilizando deref(deref()) e em ordem decrescente
SELECT
    DEREF(H.CPF_Cli).Nome AS NomeCliente,
    DEREF(DEREF(h.CPF_Cli).indicador).Nome AS NomeIndicador,
    DEREF(H.ID_Hot).CEP AS CEP_Hotel,
    COUNT(*) AS VezesNoHotel
FROM tb_hospeda h
GROUP BY DEREF(DEREF(h.CPF_Cli).indicador).Nome,  DEREF(H.ID_Hot).CEP, DEREF(H.CPF_Cli).Nome
ORDER BY VezesNoHotel DESC;

-- Consultando a quantidade de indicados e o nome do indicador
SELECT
    DEREF(C.Indicador).Nome AS NomeIndicador,
    COUNT(*) AS QuantidadeIndicados
FROM tb_cliente C
WHERE C.Indicador IS NOT NULL
GROUP BY DEREF(C.Indicador).Nome;

-- Consulta o motorista que levou mais vezes (o FETCH FIRST ROW ONLY retorna apenas uma linha da consulta, logo como ta agrupado em ordem decrescente vai retornar o com o maior numero de hospedagens)
SELECT
    DEREF(H.Motorista).Nome AS Nome_Motorista,
    COUNT(*) AS Total_Hospedagens
FROM tb_hospeda H
GROUP BY DEREF(H.Motorista).Nome
ORDER BY Total_Hospedagens DESC
FETCH FIRST ROW ONLY;


--=====================================================================================================================================================
-- CONSULTAS A NESTED TABLE

-- Listar todos os hotéis que possuem pelo menos 1 reservas no mês de setembro de 2023:
SELECT h.Id_Hotel, h.CEP, h.Num_quartos, h.Num_endereco
FROM tb_hotel h
WHERE (SELECT COUNT(*) 
       FROM TABLE(h.Reservas) r 
       WHERE EXTRACT(MONTH FROM r.Check_In) = 9 
       AND EXTRACT(YEAR FROM r.Check_In) = 2023) >= 1;

-- Encontrar todos os hotéis que possuem reservas no dia '10-SEP-2023':
SELECT h.Id_Hotel, h.CEP, h.Num_quartos, h.Num_endereco
FROM tb_hotel h
WHERE EXISTS (
    SELECT 1 
    FROM TABLE(h.Reservas) r 
    WHERE r.Check_In <= TO_DATE('10-SEP-2023') 
    AND r.Check_Out > TO_DATE('10-SEP-2023')
);


-- Encontrar o hotel com o maior número de reservas:
SELECT h.Id_Hotel, h.CEP, h.Num_quartos, h.Num_endereco, COUNT(*) as total_reservas
FROM tb_hotel h, TABLE(h.Reservas) r
GROUP BY h.Id_Hotel, h.CEP, h.Num_quartos, h.Num_endereco
ORDER BY total_reservas DESC
FETCH FIRST 1 ROW ONLY;

-- Listar todos os hotéis e a quantidade total de dias de reservas para eles:
SELECT h.Id_Hotel, h.CEP, h.Num_quartos, h.Num_endereco, 
       SUM(r.Check_Out - r.Check_In) as total_days_reserved
FROM tb_hotel h, TABLE(h.Reservas) r
GROUP BY h.Id_Hotel, h.CEP, h.Num_quartos, h.Num_endereco;

-- Encontrar todos os hotéis em que o cliente 'João' fez uma reserva:
SELECT DISTINCT H.Id_Hotel, H.CEP, H.Num_quartos, H.Num_endereco
FROM tb_hotel H
JOIN tb_hospeda HP ON DEREF(HP.ID_Hot).Id_Hotel = H.Id_Hotel
JOIN tb_cliente C ON DEREF(HP.CPF_Cli).CPF_Cliente = C.CPF_Cliente
WHERE C.Nome = 'João';
