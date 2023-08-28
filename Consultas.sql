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

-- CONSULTAS COM DEREF
-- Consulta nome do cliente e cep do hotel na tabela hospeda
SELECT DEREF(h.CPF_Cli).Nome AS NomeCliente, DEREF(h.ID_Hot).CEP AS CEPHotel
FROM tb_hospeda h;

-- Consulta nome e quarto dentro da Nested table Reservas
SELECT DEREF(h.CPF_Cli).Nome AS NomeCliente, r.Quarto
FROM tb_hospeda h, TABLE(DEREF(h.ID_Hot).Reservas) r;

-- Consulta nome e quarto dentro da Nested table Reservas em que o checkin é maior ou igual ao SYSDATE
SELECT DEREF(h.CPF_Cli).Nome AS NomeCliente, r.Quarto
FROM tb_hospeda h, TABLE(DEREF(h.ID_Hot).Reservas) r
WHERE r.Check_In >= SYSDATE;

-- Consultas ordenadas pelo checkin
SELECT DEREF(h.CPF_Cli).Nome AS NomeCliente, r.Quarto
FROM tb_hospeda h, TABLE(DEREF(h.ID_Hot).Reservas) r
ORDER BY r.Check_In;

-- Consulta para obter informações sobre os clientes e seus indicadores, incluindo os nomes dos clientes e dos indicadores
SELECT
    C.CPF_Cliente AS CPF_Cliente,
    C.Nome AS Nome_Cliente,
    C.Idade AS Idade_Cliente,
    C.CEP AS CEP_Cliente,
    DEREF(C.indicador).CPF_Cliente AS CPF_Indicador,
    DEREF(C.indicador).Nome AS Nome_Indicador,
    DEREF(C.indicador).Idade AS Idade_Indicador
FROM tb_cliente C;

-- Consulta para obter informações sobre hóspedes, clientes, hotéis e motoristas
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
FROM tb_hospeda H;

-- Consultando o nome do cliente, o nome do agente (indicador) do cliente e a quantidade de vezes que o cliente foi para o hotel:
SELECT
    DEREF(C.CPF_Cli).Nome AS NomeCliente,
    DEREF(H.Motorista).Nome AS NomeAgente,
    DEREF(DEREF(H.Motorista).supervisor).Nome AS NomeSupervisor
FROM tb_hospeda H
JOIN tb_cliente C ON DEREF(H.CPF_Cli) = C;


-- Consultando nome e cep de cliente e hotel e quantas vezes o cliente foi nesse mesmo hotel
SELECT
    DEREF(H.CPF_Cli).Nome AS NomeCliente,
    DEREF(H.ID_Hot).CEP AS CEP_Hotel,
    COUNT(*) AS QuantidadeVisitas
FROM tb_hospeda H
GROUP BY DEREF(H.CPF_Cli).Nome, DEREF(H.ID_Hot).CEP
ORDER BY QuantidadeVisitas DESC;

-- Consulta nome do indicador e quantidade de vezes que o cliente foi para o mesmo hotel(dessa vez utilizando deref(deref()))
SELECT
    DEREF(DEREF(h.CPF_Cli).indicador).Nome AS NomeIndicador,
    COUNT(*) AS VezesNoHotel
FROM tb_hospeda h
GROUP BY DEREF(DEREF(h.CPF_Cli).indicador).Nome;

-- Consultando a quantidade de indicados e o nome do indicador
SELECT
    DEREF(C.Indicador).Nome AS NomeIndicador,
    COUNT(*) AS QuantidadeIndicados
FROM tb_cliente C
WHERE C.Indicador IS NOT NULL
GROUP BY DEREF(C.Indicador).Nome;
