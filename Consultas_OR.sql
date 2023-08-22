-- Criando Varray para armazenar 
CREATE TYPE NumTelefones AS VARRAY (2) OF VARCHAR2(11);
DROP TYPE NumTelefones;

-- tipo de objeto tp_funcionario
DROP TYPE tp_funcionario;
CREATE OR REPLACE TYPE tp_funcionario AS OBJECT (
    CPF_Funcionario VARCHAR(11),
    Nome VARCHAR(50),
    Sexo VARCHAR(1),
    Idade INT,
    lista_fones NumTelefones,
    FINAL MEMBER PROCEDURE altera_nome(novo_nome VARCHAR)
) NOT FINAL NOT INSTANTIABLE;
CREATE OR REPLACE TYPE BODY tp_funcionario AS
    FINAL MEMBER PROCEDURE altera_nome(novo_nome VARCHAR) IS
    BEGIN
        SELF.Nome := novo_nome;
    END;
END;

-- Defina o subtipo tp_Motorista
DROP TYPE tp_Motorista;
CREATE OR REPLACE TYPE tp_Motorista UNDER tp_funcionario (
    Num_Cnh VARCHAR(20),
    MEMBER PROCEDURE get_informations,
    MEMBER FUNCTION calcularAposentadoria RETURN VARCHAR2
);

CREATE OR REPLACE TYPE BODY tp_Motorista AS
    MEMBER PROCEDURE get_informations AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Nome: ' || Nome);
        DBMS_OUTPUT.PUT_LINE('Sexo: ' || Sexo);
        DBMS_OUTPUT.PUT_LINE('Idade: ' || Idade);
		DBMS_OUTPUT.PUT_LINE('CNH: ' || Num_Cnh);
    END;
    MEMBER FUNCTION calcularAposentadoria RETURN VARCHAR2 IS
    BEGIN
        IF Idade >= 65 THEN
            RETURN 'Próximo da aposentadoria';
        ELSE
            RETURN 'Ainda não próximo da aposentadoria';
        END IF;
    END;
END;

-- teste da member procedure
DECLARE
    f  tp_Motorista; 
BEGIN
    f := tp_Motorista('123456789', 'Dodo', 'M', 50,NumTelefones ('81998598343', '81986991192') ,'CNH123456');
    DBMS_OUTPUT.ENABLE;
    f.get_informations();
END;
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
	Agente tp_Agente('10987654321', 'Maria', 'F', 25, NumTelefones ('81998598343', '81986991192'),'maria@email.com');
BEGIN
	Agente.altera_nome('Santana');
END;
-- Criando Tabelas do Subtipo AGENTE
CREATE TABLE tb_Agente OF tp_Agente;
INSERT INTO tb_Agente (CPF_Funcionario, Nome, Sexo, Idade, lista_fones, Email) VALUES ('10987654321', 'Maria', 'F', 25, NumTelefones ('81998598343', '81986991192'),'maria@email.com');
DROP TABLE tb_Agente;

SELECT t.CPF_Funcionario, t.Nome, t.Sexo, t.Idade, f.COLUMN_VALUE AS Telefone
FROM tb_Agente t, TABLE(t.lista_fones) f;

-- Usando função MAP Para setar o preço como forma de comparação entre duas atrações
DROP TYPE tp_atracao;
CREATE OR REPLACE TYPE tp_atracao AS OBJECT (
    ID_Atracao NUMBER,
    Local VARCHAR(200),
    Preco NUMBER,
    MAP MEMBER FUNCTION GetPreco RETURN NUMBER
);

CREATE OR REPLACE TYPE BODY tp_atracao AS
    MAP MEMBER FUNCTION GetPreco RETURN NUMBER IS
    BEGIN
        RETURN SELF.Preco;
    END;
END;
/

-- Comparando dois objetos do tipo tp_atracao por meio de sua função MAP
DECLARE
    atr1 tp_atracao := tp_atracao(1, 'Local 1', 10);
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


-- Order member function: Comparando a idade de dois objetios do tipo cliente
DROP TYPE tp_cliente;

-- Criando Objeto 
CREATE OR REPLACE TYPE tp_cliente AS OBJECT(
    CPF_Cliente VARCHAR(11),
    CEP VARCHAR(9),
    Idade INT,
    Nome CHAR(50),
    Num_endereco VARCHAR(10),
    ORDER MEMBER FUNCTION ComparaIdade(C tp_cliente) RETURN INTEGER
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
    cliente1 := tp_cliente('12345678901', '12345678', 60, 'João', '10');
    cliente2 := tp_cliente('98765432109', '87654321', 40, 'Maria', '20');
    resultado := cliente1.ComparaIdade(cliente2);
    DBMS_OUTPUT.PUT_LINE('Diferença entre as idades: ' || resultado);
END;
/

ALTER TYPE tp_atracao ADD ATTRIBUTE(capacidade NUMBER) CASCADE;


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

-- Criando a tabela que irá armazenar os objetos tp_hotel
CREATE TABLE tb_hotel OF tp_hotel (
    Id_Hotel PRIMARY KEY
) NESTED TABLE Reservas STORE AS tb_reservas;

-- Exemplo de inserção de dados
INSERT INTO tb_hotel VALUES (
    1, 
    '12345678',
    100,
    '10A',
    tp_reservas(
        tp_reserva(1, '101', TO_DATE('2023-08-22','YYYY-MM-DD'), TO_DATE('2023-08-25','YYYY-MM-DD')),
        tp_reserva(2, '102', TO_DATE('2023-08-23','YYYY-MM-DD'), TO_DATE('2023-08-26','YYYY-MM-DD'))
    )
);

-- Visualizando a neated table
SELECT * 
FROM TABLE (SELECT h.Reservas FROM tb_hotel h WHERE h.Id_Hotel = 1);
