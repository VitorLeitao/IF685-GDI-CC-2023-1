-- Criando Varray para armazenar 
CREATE TYPE NumTelefones AS VARRAY (2) OF VARCHAR2(11);
/

-- Tipo de objeto tp_funcionario
DROP TYPE tp_funcionario;
CREATE OR REPLACE TYPE tp_funcionario AS OBJECT(
    CPF_Funcionario VARCHAR(11),
    Nome VARCHAR(50),
    Sexo VARCHAR(10), -- 2
    Idade INT,
    lista_fones NumTelefones,
    MEMBER PROCEDURE altera_sexo
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY tp_funcionario AS
    MEMBER PROCEDURE altera_sexo IS
    BEGIN
        IF SELF.Sexo = 'Masculino' THEN
            SELF.Sexo := 'M';
        ELSIF SELF.Sexo = 'Feminino' THEN
            SELF.Sexo := 'F';
        END IF;
    END;
END;
/

-- Defina o subtipo tp_Motorista
DROP TYPE tp_Motorista;
CREATE OR REPLACE TYPE tp_Motorista UNDER tp_funcionario (
    Num_Cnh VARCHAR(20),
    MEMBER PROCEDURE get_informations,
    FINAL MEMBER FUNCTION calcularAposentadoria RETURN VARCHAR2,
    OVERRIDING MEMBER PROCEDURE altera_sexo
);

CREATE OR REPLACE TYPE BODY tp_Motorista AS
    MEMBER PROCEDURE get_informations AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Nome: ' || Nome);
        DBMS_OUTPUT.PUT_LINE('Sexo: ' || Sexo);
        DBMS_OUTPUT.PUT_LINE('Idade: ' || Idade);
        DBMS_OUTPUT.PUT_LINE('CNH: ' || Num_Cnh);
    END;

    FINAL MEMBER FUNCTION calcularAposentadoria RETURN VARCHAR2 IS
    BEGIN
        IF Idade >= 65 THEN
            RETURN 'Próximo da aposentadoria';
        ELSE
            RETURN 'Ainda não próximo da aposentadoria';
        END IF;
    END;

    OVERRIDING MEMBER PROCEDURE altera_sexo IS
    BEGIN
        IF UPPER(SELF.Sexo) IN ('MASCULINO', 'HOMEM') THEN -- ALterando o altera_sexo pra ser mais abrangente
            SELF.Sexo := 'M';
        ELSIF UPPER(SELF.Sexo) IN ('FEMININO', 'MULHER') THEN
            SELF.Sexo := 'F';
        END IF;
    END;
END;
/

-- Teste de get_informations
DECLARE
    f  tp_Motorista; 
BEGIN
    f := tp_Motorista('123456789', 'Dodo', 'M', 50, NumTelefones ('81998598343', '81986991192') ,'CNH123456');
    DBMS_OUTPUT.ENABLE;
    f.get_informations();
END;

-- Teste de altera_sexo
DECLARE
    p tp_motorista;
BEGIN
    P := tp_Motorista('123456789', 'Dodo', 'HOMEM', 50, NumTelefones ('81998598343', '81986991192') ,'CNH123456');
    p.altera_sexo();
    DBMS_OUTPUT.PUT_LINE('sexo: ' || p.sexo);
END;
/


-- teste da member function
DECLARE
    f tp_Motorista;
    resultado VARCHAR2(50);
BEGIN
    f := tp_Motorista('123456789', 'Dodo', 'M' ,50, NumTelefones ('81998598343', '81986991192'), 'CNH123456');
    resultado := f.calcularAposentadoria();
	DBMS_OUTPUT.ENABLE;
    DBMS_OUTPUT.PUT_LINE(resultado);
END;

-- CRIANDO OBJETO AGENTE
DROP TYPE tp_Agente;
CREATE OR REPLACE TYPE tp_Agente UNDER tp_funcionario(
    Email VARCHAR(50)
);
-- Testando o Final Member
DECLARE
	Agente tp_Agente;
BEGIN
    Agente := tp_Agente('10987654321', 'Maria', 'F', 25, NumTelefones ('81998598343', '81986991192'),'maria@email.com');
	Agente.altera_nome('Santana');
	DBMS_OUTPUT.PUT_LINE('Nome: ' || Agente.Nome);
END;

-- Usando função MAP Para setar o preço como forma de comparação entre duas atrações
DROP TYPE tp_atracao;
CREATE OR REPLACE TYPE tp_atracao AS OBJECT (
    ID_Atracao NUMBER,
    Local VARCHAR(200),
    Preco NUMBER,
    CONSTRUCTOR FUNCTION tp_atracao(SELF IN OUT NOCOPY tp_atracao, ID_Atracao NUMBER, Local VARCHAR, Preco NUMBER) RETURN SELF AS RESULT, -- 07
    MAP MEMBER FUNCTION GetPreco RETURN NUMBER -- 06
);

CREATE OR REPLACE TYPE BODY tp_atracao AS
    
	CONSTRUCTOR FUNCTION tp_atracao(SELF IN OUT NOCOPY tp_atracao, ID_Atracao NUMBER, Local VARCHAR, Preco NUMBER) RETURN SELF AS RESULT IS BEGIN
    	SELF.ID_Atracao := ID_Atracao; SELF.Local := Local; SELF.Preco := Preco;
		RETURN;
  	END;

    MAP MEMBER FUNCTION GetPreco RETURN NUMBER IS
    BEGIN
        RETURN SELF.Preco;
    END;
END;
/

-- Comparando dois objetos do tipo tp_atracao por meio de sua função MAP
DECLARE
    atr1 tp_atracao := tp_atracao(1, 'Local 1', 10); -- Constructor funcionando 
    atr2 tp_atracao := tp_atracao(2, 'Local 2', 20);
BEGIN
    IF atr1 > atr2 THEN
        DBMS_OUTPUT.PUT_LINE('Atração 1 é mais cara que Atração 2');
    ELSIF atr1 < atr2 THEN
        DBMS_OUTPUT.PUT_LINE('Atração 2 é mais cara que Atração 1');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Atrações têm o mesmo preço');
    END IF;
END;
--Alterando tipo atração
ALTER TYPE tp_atracao ADD ATTRIBUTE(capacidade NUMBER) CASCADE; -- 12

-- Order member function: Comparando a idade de dois objetios do tipo cliente
DROP TYPE tp_cliente;

-- Criando Objeto cliente
CREATE OR REPLACE TYPE tp_cliente AS OBJECT(
    CPF_Cliente VARCHAR(11),
    CEP VARCHAR(9),
    Idade INT,
    Nome CHAR(50),
    Num_endereco VARCHAR(10),
    indicador REF tp_cliente, -- 15
    ORDER MEMBER FUNCTION ComparaIdade(C tp_cliente) RETURN INTEGER -- 05
);
/

CREATE OR REPLACE TYPE BODY tp_cliente IS
    ORDER MEMBER FUNCTION ComparaIdade(C tp_cliente) RETURN INTEGER IS
    BEGIN
        RETURN SELF.Idade - C.Idade;
    END;
END;
/

-- Testando Order member
DECLARE
    cliente1 tp_cliente;
    cliente2 tp_cliente;
    resultado INTEGER;
BEGIN
    cliente1 := tp_cliente('12345678901', '12345678', 60, 'João', '10', NULL);
    cliente2 := tp_cliente('98765432109', '87654321', 40, 'Maria', '20', NULL);
    resultado := cliente1.ComparaIdade(cliente2);
    DBMS_OUTPUT.PUT_LINE('Diferença entre as idades: ' || resultado);
END;
/

-- Nested table
-- Criando o tipo de objeto tp_reserva
CREATE OR REPLACE TYPE tp_reserva AS OBJECT (
    Id_Reserva INT,
    Quarto VARCHAR2(10),
    Check_In DATE,
    Check_Out DATE
);
/

-- Criando o tipo para NESTED TABLE de reservas
CREATE OR REPLACE TYPE tp_reservas IS TABLE OF tp_reserva;
/

-- Criando o tipo de objeto tp_hotel que vai ter varias reservas
CREATE OR REPLACE TYPE tp_hotel AS OBJECT (
    Id_Hotel INT,
    CEP VARCHAR2(9),
    Num_quartos INT,
    Num_endereco VARCHAR2(10),
    Reservas tp_reservas
);
/

-- Criando tipo + tabela hospeda
CREATE OR REPLACE TYPE tp_hospeda AS OBJECT(
    CPF_Cli REF tp_cliente,
    ID_Hot REF tp_hotel,
    Ponto_embarque VARCHAR(30),
    Ponto_desembarque VARCHAR(30),
    Data_hora DATE,
    Motorista REF tp_Motorista
);

-- ===============================CRIANDO AS TABELAS BASEADAS NOS TIPOS ============================================

-- criando tabela motorista 
CREATE TABLE tb_Motorista OF tp_Motorista( -- 13
    CPF_Funcionario PRIMARY KEY
);
-- Criando Tabelas AGENTE
CREATE TABLE tb_Agente OF tp_Agente(
    CPF_Funcionario PRIMARY KEY
);
DROP TABLE tb_Agente;

-- Criando tabela atração
CREATE TABLE tb_atracao OF tp_atracao(
    ID_Atracao PRIMARY KEY
);

-- Criando tabela cliente 
CREATE TABLE tb_cliente OF tp_cliente(
    CPF_Cliente PRIMARY KEY,
    indicador SCOPE IS tb_cliente -- 16
);
-- Criando a tabela tb_hotel
CREATE TABLE tb_hotel OF tp_hotel(
    Id_Hotel PRIMARY KEY
) NESTED TABLE Reservas STORE AS tb_reservas -- 20

-- Crirando tabela se_hospeda
CREATE TABLE tb_hospeda OF tp_hospeda(
    CPF_Cli WITH ROWID REFERENCES tb_cliente, -- 14
    ID_Hot WITH ROWID REFERENCES tb_hotel,
    Motorista SCOPE IS tb_Motorista
);

-- Alguns selects que usamos apenas pra testar os codigos(Ignorar)
SELECT t.CPF_Funcionario, t.Nome, t.Sexo, t.Idade, f.COLUMN_VALUE AS Telefone
FROM tb_Agente t, TABLE(t.lista_fones) f;
SELECT C.CPF_Cliente, C.CEP, C.nome, C.idade, DEREF(C.indicador).nome FROM tb_cliente C;
SELECT VALUE(C).nome, VALUE(C).CPF_Cliente FROM tb_cliente C -- 18
SELECT * -- Visualizando a neated table
FROM TABLE (SELECT h.Reservas FROM tb_hotel h WHERE h.Id_Hotel = 1);
SELECT DEREF(h.CPF_Cli).CPF_Cliente,DEREF(h.ID_Hot).Id_Hotel,h.Ponto_embarque,h.Ponto_desembarque,h.Data_hora,DEREF(h.Motorista).CPF_Funcionario
FROM tb_hospeda h WHERE DEREF(h.CPF_Cli).CPF_Cliente = '23423423434';


-- ===========================Povoamento das tabelas=============================================
-- Tabela Cliente
INSERT INTO tb_cliente VALUES (tp_cliente('84869866531', '85731110', 21, 'Pedro', '900', NULL)); 
INSERT INTO tb_cliente VALUES (tp_cliente('23423423434', '54431110', 28, 'João', '92', (SELECT REF(C) FROM tb_cliente C WHERE C.CPF_Cliente = '84869866531')));
INSERT INTO tb_cliente VALUES (tp_cliente('45654645645', '84759963', 67, 'Maria', '79', (SELECT REF(C) FROM tb_cliente C WHERE C.CPF_Cliente = '23423423434')));
INSERT INTO tb_cliente VALUES (tp_cliente('78978978978', '96541236', 45, 'Ana', '34', (SELECT REF(C) FROM tb_cliente C WHERE C.CPF_Cliente = '45654645645')));
INSERT INTO tb_cliente VALUES (tp_cliente('12312312312', '74569821', 32, 'Carlos', '56', (SELECT REF(C) FROM tb_cliente C WHERE C.CPF_Cliente = '78978978978')));
INSERT INTO tb_cliente VALUES (tp_cliente('55555555555', '12345678', 28, 'Mariana', '22', (SELECT REF(C) FROM tb_cliente C WHERE C.CPF_Cliente = '12312312312')));
INSERT INTO tb_cliente VALUES (tp_cliente('77777777777', '98765432', 53, 'Ricardo', '44', (SELECT REF(C) FROM tb_cliente C WHERE C.CPF_Cliente = '55555555555')));
INSERT INTO tb_cliente VALUES (tp_cliente('99999999999', '36985214', 19, 'Julia', '17', (SELECT REF(C) FROM tb_cliente C WHERE C.CPF_Cliente = '77777777777')));
INSERT INTO tb_cliente VALUES (tp_cliente('22222222222', '74185296', 37, 'Fernanda', '63', (SELECT REF(C) FROM tb_cliente C WHERE C.CPF_Cliente = '99999999999')));
INSERT INTO tb_cliente VALUES (tp_cliente('33333333333', '12312312', 25, 'Lucas', '38', (SELECT REF(C) FROM tb_cliente C WHERE C.CPF_Cliente = '22222222222')));


-- Tabel Hotel
INSERT INTO tb_hotel VALUES (
    1,'12345678',100,'10A',
    tp_reservas(
        tp_reserva(1, '101', TO_DATE('2023-08-22','YYYY-MM-DD'), TO_DATE('2023-08-25','YYYY-MM-DD')),
        tp_reserva(2, '102', TO_DATE('2023-08-23','YYYY-MM-DD'), TO_DATE('2023-08-26','YYYY-MM-DD'))));
INSERT INTO tb_hotel VALUES (
    2,'98765432', 50,'5B',
    tp_reservas(
        tp_reserva(3, '201', TO_DATE('2023-09-10','YYYY-MM-DD'), TO_DATE('2023-09-15','YYYY-MM-DD')),
        tp_reserva(4, '202', TO_DATE('2023-09-18','YYYY-MM-DD'), TO_DATE('2023-09-22','YYYY-MM-DD'))));
INSERT INTO tb_hotel VALUES (
    3, '56789012',75,'7C',tp_reservas(
        tp_reserva(5, '301', TO_DATE('2023-10-05','YYYY-MM-DD'), TO_DATE('2023-10-10','YYYY-MM-DD')),
        tp_reserva(6, '302', TO_DATE('2023-10-12','YYYY-MM-DD'), TO_DATE('2023-10-16','YYYY-MM-DD'))));
INSERT INTO tb_hotel VALUES (
    4, '23456789',120,'12B',tp_reservas(
        tp_reserva(7, '401', TO_DATE('2023-11-20','YYYY-MM-DD'), TO_DATE('2023-11-25','YYYY-MM-DD')),
        tp_reserva(8, '402', TO_DATE('2023-11-28','YYYY-MM-DD'), TO_DATE('2023-12-02','YYYY-MM-DD'))));
INSERT INTO tb_hotel VALUES (
    5,'87654321', 90,'8A',tp_reservas(
        tp_reserva(9, '501', TO_DATE('2023-12-15','YYYY-MM-DD'), TO_DATE('2023-12-20','YYYY-MM-DD')),
        tp_reserva(10, '502', TO_DATE('2023-12-22','YYYY-MM-DD'), TO_DATE('2023-12-27','YYYY-MM-DD'))));

-- Se hospeda
INSERT INTO tb_hospeda VALUES (
    (SELECT REF(C) FROM tb_cliente C WHERE CPF_Cliente = '84869866531'),
    (SELECT REF(H) FROM tb_hotel H WHERE id_hotel = 1),
    'Hotel Transilvânia', 'Cristo Redentor', TO_DATE('2023-08-22','YYYY-MM-DD'),
    (SELECT REF(M) FROM tb_motorista M WHERE CPF_Funcionario = '87965433284')
);
INSERT INTO tb_hospeda VALUES (
    (SELECT REF(C) FROM tb_cliente C WHERE CPF_Cliente = '23423423434'),
    (SELECT REF(H) FROM tb_hotel H WHERE id_hotel = 2),
    'Hotel Trivago', 'Praia de Copacabana', TO_DATE('2023-09-10','YYYY-MM-DD'),
    (SELECT REF(M) FROM tb_motorista M WHERE CPF_Funcionario = '87965433284')
);
INSERT INTO tb_hospeda VALUES (
    (SELECT REF(C) FROM tb_cliente C WHERE CPF_Cliente = '45654645645'),
    (SELECT REF(H) FROM tb_hotel H WHERE id_hotel = 3),
    'Hotel Boa Praia', 'Porto de Galinhas', TO_DATE('2023-10-05','YYYY-MM-DD'),
    (SELECT REF(M) FROM tb_motorista M WHERE CPF_Funcionario = '87965433284')
);
INSERT INTO tb_hospeda VALUES (
    (SELECT REF(C) FROM tb_cliente C WHERE CPF_Cliente = '84869866531'),
    (SELECT REF(H) FROM tb_hotel H WHERE id_hotel = 1),
    'Hotel Transilvânia', 'Cristo Redentor', TO_DATE('2023-07-25','YYYY-MM-DD'),
    (SELECT REF(M) FROM tb_motorista M WHERE CPF_Funcionario = '87965433284')
);


-- Tabela atraçaõ
INSERT INTO tb_atracao VALUES (tp_atracao(1, 'Museu de Arte Moderna', 10));
INSERT INTO tb_atracao VALUES (tp_atracao(2, 'Passeio de Barco', 20));
INSERT INTO tb_atracao VALUES (tp_atracao(3, 'Teatro Municipal', 15));
INSERT INTO tb_atracao VALUES (tp_atracao(4, 'Parque Natural', 5));
INSERT INTO tb_atracao VALUES (tp_atracao(5, 'Mirante da Cidade', 8));

-- Povoamento motorista
INSERT INTO tb_Motorista VALUES('87965433284', 'Jonathan', 'M', 34, NULL, 'Categoria D');
INSERT INTO tb_Motorista VALUES('19283746589', 'Marcos', 'M', 23, NULL, 'Categoria D');
INSERT INTO tb_Motorista VALUES('10293718309', 'Milena', 'F', 26, NULL, 'Categoria A');
INSERT INTO tb_Motorista VALUES('14253647589', 'Michael', 'M', 21, NULL, 'Categoria B');
INSERT INTO tb_Motorista VALUES('10293813456', 'Michele', 'F', 50, NULL, 'Categoria B');
INSERT INTO tb_Motorista VALUES('09123564783', 'João', 'M', 53, NULL, 'Categoria C');
INSERT INTO tb_Motorista VALUES('12354676378', 'Luana', 'F', 38, NULL, 'Categoria C');
INSERT INTO tb_Motorista VALUES('12354639846', 'Pedro', 'M', 28, NULL, 'Categoria A');
INSERT INTO tb_Motorista VALUES('98757364789', 'Joana', 'F', 44, NULL, 'Categoria A');
INSERT INTO tb_Motorista VALUES('98756473678', 'Lucas', 'M', 39, NULL, 'Categoria D');
INSERT INTO tb_Motorista VALUES('64534256789', 'Alexandra', 'F', 39, NULL, 'Categoria D');

-- Povoamento Agente
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('10987654321', 'Maria', 'F', 25, NumTelefones ('81998598343', '81986991192'),'maria@email.com');
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('28374647389', 'Marcos', 'M', 37, NumTelefones ('11998598343', '11986981192'),'Marcos@email.com');
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('98374673909', 'Marta', 'F', 33, NumTelefones ('81998598743', '81986791192'),'Marta@email.com');
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('29836478390', 'Claudio', 'M', 48, NumTelefones ('81998898343', '81966991192'),'Claudio@email.com');
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('12354673689', 'Leda', 'F', 66, NumTelefones ('81998594343', '81986951192'),'Leda@email.com');
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('02938462837', 'Francisco', 'M', 43, NumTelefones ('81958598343', '84986991192'),'Francisco@email.com');
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('29836475898', 'Lurdes', 'F', 67, NumTelefones ('81998599343', '81983991192'),'Lurdes@email.com');
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('63746574899', 'Vinicius', 'M', 33, NumTelefones ('81998508343', '81286991192'),'Vinicius@email.com');
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('64736637489', 'Pérola', 'F', 54, NumTelefones ('81938598343', '81987991192'),'Pérola@email.com');
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('25364766788', 'Ricardo', 'M', 53, NumTelefones ('82998598343', '81986991792'),'Ricardo@email.com');
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('26354789899', 'Ester', 'F', 30, NumTelefones ('91998598343', '81986091192'),'Ester@email.com');