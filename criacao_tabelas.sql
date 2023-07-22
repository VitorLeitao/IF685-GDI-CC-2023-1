/* TABELA LocalCapacidade */
CREATE TABLE LocalCapacidade (
    Local VARCHAR(200) CONSTRAINT pk_lc PRIMARY KEY,
    Capacidade INT NOT NULL CHECK (Capacidade >= 0)
);

/* TABELA Atração */
CREATE SEQUENCE contar_1
START WITH 1
INCREMENT BY 1;

CREATE TABLE Atracao(
    ID_Atracao INT CONSTRAINT pk_emp PRIMARY KEY,
    Local VARCHAR(200) NOT NULL,
    Preco NUMBER(10, 2) CHECK (Preco >= 0),
    CONSTRAINT fk_lc FOREIGN KEY (Local) REFERENCES LocalCapacidade (Local) ON DELETE CASCADE
);

/* TABELA ENDEREÇO */
CREATE TABLE Endereco(
    CEP VARCHAR(9) CONSTRAINT pk_end PRIMARY KEY,
    Rua VARCHAR(100) NOT NULL,
    Pais VARCHAR(50) NOT NULL
);

/* TABELA CLIENTE */
CREATE TABLE Cliente(
    CPF_Cliente VARCHAR(11) CONSTRAINT pk_cli PRIMARY KEY,
    CEP VARCHAR(9) NOT NULL,
    Idade INT CHECK (Idade >= 0),
    Nome CHAR(50) NOT NULL,
    Num_endereco VARCHAR(10),
    indicador VARCHAR(11),
    CONSTRAINT fk_cepC FOREIGN KEY (CEP) REFERENCES Endereco(CEP) ON DELETE CASCADE,
    CONSTRAINT fk_auto FOREIGN KEY (indicador) REFERENCES Cliente(CPF_Cliente)
);

/* TABELA HOTEL */
CREATE SEQUENCE seq_hotel
START WITH 1
INCREMENT BY 1;

CREATE TABLE Hotel(
    Id_Hotel INT CONSTRAINT pk_hot PRIMARY KEY,
    CEP VARCHAR(9) NOT NULL,
    Num_quartos INT CHECK (Num_quartos > 0),
    Num_endereco VARCHAR(10),
    CONSTRAINT fk_cepH FOREIGN KEY (CEP) REFERENCES Endereco(CEP) ON DELETE CASCADE
);


/* TABELA QUARTOPRECO */
CREATE TABLE QuartoPreco(
    Quarto VARCHAR(10),
    Id_Hotel INT,
    Preco NUMBER NOT NULL CHECK (Preco > 0),
    CONSTRAINT fk_qp FOREIGN KEY (Id_Hotel) REFERENCES Hotel(Id_Hotel) ON DELETE CASCADE,
    CONSTRAINT pk_qp PRIMARY KEY(Quarto, Id_Hotel)
);

/* TABELA RESERVA */
CREATE SEQUENCE seq_reserva
START WITH 1
INCREMENT BY 1;

CREATE TABLE Reserva(
    Id_Hotel INT,
    Id_Reserva INT,
    Quarto VARCHAR(10) NOT NULL,
    Check_In DATE NOT NULL,
    Check_Out DATE NOT NULL,
    CONSTRAINT fk_rsv1 FOREIGN KEY (Quarto, Id_Hotel) REFERENCES QuartoPreco(Quarto, Id_Hotel) ON DELETE CASCADE,
    CONSTRAINT fk_rsv2 FOREIGN KEY (Id_Hotel) REFERENCES Hotel(Id_Hotel) ON DELETE CASCADE,
    CONSTRAINT pk_rsv PRIMARY KEY(Id_Hotel, Id_Reserva)
);

/* TABELA FUNCIONARIOS */
CREATE TABLE Funcionarios(
    CPF_Funcionario VARCHAR(11) CONSTRAINT pk_func PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sexo VARCHAR(1) NOT NULL,
    Idade INT NOT NULL CHECK (Idade > 0)
);

/* TABELA TELEFONE */
CREATE TABLE Telefone (
    CPF_Funcionario VARCHAR(11),
    Num_Telefone VARCHAR(20),
    PRIMARY KEY (CPF_Funcionario, Num_Telefone),
    CONSTRAINT fk_cpfF FOREIGN KEY (CPF_Funcionario) REFERENCES Funcionarios (CPF_Funcionario) ON DELETE CASCADE
);

/* TABELA MOTORISTA */
CREATE TABLE Motorista (
    CPF_Funcionario VARCHAR(11) PRIMARY KEY,
    Num_Cnh VARCHAR(20) NOT NULL,
    CONSTRAINT fk_cpfMoto FOREIGN KEY (CPF_Funcionario) REFERENCES Funcionarios (CPF_Funcionario) ON DELETE CASCADE
);

/* TABELA AGENTE */
CREATE TABLE Agente(
    CPF_Funcionario VARCHAR(11) PRIMARY KEY,
    Email VARCHAR(50),
    CONSTRAINT fk_cpfAG FOREIGN KEY (CPF_Funcionario) REFERENCES Funcionarios (CPF_Funcionario) ON DELETE CASCADE
);

/* TABELA SE HOSPEDA */
CREATE TABLE Se_Hospeda(
    CPF_Cliente VARCHAR(11),
    Id_Hotel INT,
    CONSTRAINT pk_hsp PRIMARY KEY(CPF_Cliente, Id_Hotel),
    CONSTRAINT fk_hsp1 FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF_Cliente) ON DELETE CASCADE,
    CONSTRAINT fk_hsp2 FOREIGN KEY (Id_Hotel) REFERENCES Hotel(Id_Hotel) ON DELETE CASCADE
);

/* TABELA SE CONDUZ */
CREATE TABLE Conduz(
    CPF_Cliente VARCHAR(11),
    Id_Hotel INT,
    Data_Hora TIMESTAMP,
    Ponto_Embarque VARCHAR(100),
    Ponto_Desembarque VARCHAR(100),
    CPF_Funcionario VARCHAR(11),
    CONSTRAINT pk_c PRIMARY KEY(CPF_Cliente, Data_Hora),
    CONSTRAINT fk_c1 FOREIGN KEY (CPF_Cliente, Id_Hotel) REFERENCES Se_Hospeda(CPF_Cliente, Id_Hotel) ON DELETE CASCADE,
    CONSTRAINT fk_c2 FOREIGN KEY (CPF_Funcionario) REFERENCES Motorista(CPF_Funcionario) ON DELETE CASCADE
);

/* TABELA SE Leva */
CREATE TABLE Leva(
    ID_Atracao INT,
    CPF_Cliente VARCHAR(11),
    Data_Hora TIMESTAMP,
    CPF_Funcionario VARCHAR(11),
    CONSTRAINT pk_l PRIMARY KEY(CPF_Cliente, Data_Hora),
    CONSTRAINT fk_l1 FOREIGN KEY (ID_Atracao) REFERENCES Atracao(ID_Atracao) ON DELETE CASCADE,
    CONSTRAINT fk_l2 FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF_Cliente) ON DELETE CASCADE,
    CONSTRAINT fk_l3 FOREIGN KEY (CPF_Funcionario) REFERENCES Motorista(CPF_Funcionario) ON DELETE CASCADE
);

/* TABELA SE EFETUA */
CREATE TABLE Efetua(
    CPF_Cliente VARCHAR(11),
    Id_Hotel INT,
    Id_Reserva INT,
    CPF_Funcionario VARCHAR(11),
    CONSTRAINT pk_ef PRIMARY KEY(CPF_Cliente, Id_Hotel, Id_Reserva),
    CONSTRAINT fk_ef1 FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF_Cliente) ON DELETE CASCADE,
    CONSTRAINT fk_ef2 FOREIGN KEY (Id_Hotel, Id_Reserva) REFERENCES Reserva(Id_Hotel, Id_Reserva) ON DELETE CASCADE,
    CONSTRAINT fk_ef3 FOREIGN KEY (CPF_Funcionario) REFERENCES Agente(CPF_Funcionario) ON DELETE CASCADE
);
