/* Povoando a tabela LocalCapacidade */
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Museu do Louvre', 500);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Praça da Sé', 300);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Estádio Maracanã', 78000);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Central Park', 4000);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Praça da Liberdade', 700);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Torre Eiffel', 600);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Coliseu', 500);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Time Square', 1500);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Estádio Wembley', 90000);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Parque do Ibirapuera', 3500);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Teatro Municipal de São Paulo', 1500);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Museu de Arte de São Paulo', 800);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Catedral da Sé', 500);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Biblioteca de São Paulo', 400);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Mercado Municipal de São Paulo', 1200);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Museu do Ipiranga', 600);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Avenida Paulista', 2000);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Praça do Pôr do Sol', 350);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Museu da Língua Portuguesa', 700);
INSERT INTO LocalCapacidade (Local, Capacidade) VALUES ('Cataratas do Iguaçu', 2500);
SELECT * FROM LocalCapacidade;

/* Povoando a tabela Atracao */
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Museu do Louvre', 150);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Praça da Sé', 0);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Estádio Maracanã', 300);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Central Park', 0);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Praça da Liberdade', 50);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Torre Eiffel', 250);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Coliseu', 200);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Time Square', 0);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Estádio Wembley', 400);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Parque do Ibirapuera', 0);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Teatro Municipal de São Paulo', 200);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Museu de Arte de São Paulo', 100);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Catedral da Sé', 0);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Biblioteca de São Paulo', 50);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Mercado Municipal de São Paulo', 0);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Museu do Ipiranga', 80);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Avenida Paulista', 0);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Praça do Pôr do Sol', 0);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Museu da Língua Portuguesa', 150);
INSERT INTO Atracao(ID_Atracao, Local, Preco) VALUES (contar_1.nextval, 'Cataratas do Iguaçu', 0);
SELECT * FROM Atracao;


/* Povoando a tabela Endereco */
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('10110-111', 'Avenida Paulista', 'BR');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('20010-202', 'Baker Street', 'UK');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('30020-303', 'Fifth Avenue', 'US');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('40030-404', 'Champs-Élysées', 'FR');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('50040-505', 'Via del Corso', 'IT');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('60050-606', 'Rue de Rivoli', 'FR');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('70060-707', 'Boulevard Saint-Michel', 'FR');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('80070-808', 'Wall Street', 'US');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('90080-909', 'Avenida 9 de Julio', 'AR');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('01090-101', 'Paseo de la Reforma', 'MX');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('12010-212', 'Königsallee', 'DE');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('23020-323', 'Ginza', 'JP');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('34030-434', 'Nevsky Prospect', 'RU');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('45040-545', 'Oxford Street', 'UK');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('56050-656', 'Avenida Libertador', 'AR');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('67060-767', 'Strøget', 'DK');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('78070-878', 'Boulevard Haussmann', 'FR');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('89080-989', 'Gran Vía', 'ES');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('90090-100', 'Unter den Linden', 'DE');
INSERT INTO Endereco(CEP, Rua, Pais) VALUES ('21010-212', 'Orchard Road', 'SG');
SELECT * FROM Endereco;

/* Povoando a tabela Cliente */
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('01020304050', '10110-111', 28, 'Ana Paula', '500', NULL);
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('06070809100', '20010-202', 35, 'Marcos Roberto', NULL, '01020304050');
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('11012131415', '30020-303', 42, 'Juliana Ferreira', '1000', NULL);
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('16171819200', '40030-404', 30, 'Pedro Henrique', '750', '06070809100');
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('21222324250', '50040-505', 45, 'Luciana Moraes', NULL, NULL);
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('26272829300', '60050-606', 32, 'Ricardo Souza', '200', '11012131415');
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('31323334350', '70060-707', 29, 'Marcela Martins', '1500', NULL);
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('36373839400', '80070-808', 37, 'Bruno Rocha', NULL, '16171819200');
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('41424344450', '90080-909', 50, 'Patricia Oliveira', '600', NULL);
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('46474849500', '01090-101', 41, 'Gustavo Lima', '250', NULL);
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('51525354550', '12010-212', 39, 'Raquel Cardoso', '350', '36373839400');
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('56575859600', '23020-323', 31, 'Carlos Eduardo', NULL, '41424344450');
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('61626364650', '34030-434', 36, 'Fernanda Costa', '1200', NULL);
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('66676869700', '45040-545', 33, 'Rodrigo Santos', '300', '51525354550');
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('71727374750', '56050-656', 40, 'Julia Castro', NULL, NULL);
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('76777879800', '67060-767', 38, 'Guilherme Teixeira', '700', '56575859600');
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('81828384850', '78070-878', 45, 'Cristina Almeida', '800', NULL);
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('86878889800', '89080-989', 34, 'Alexandre Nascimento', NULL, '66676869700');
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('91929394950', '90090-100', 43, 'Regina Silva', '900', NULL);
INSERT INTO Cliente (CPF_Cliente, CEP, Idade, Nome, Num_endereco, indicador) 
VALUES ('96979899900', '21010-212', 40, 'Leonardo Pereira', '1000', '76777879800');
SELECT * FROM Cliente;


/* Povoando a tabela Hotel */
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '10110-111', 35, '120');
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '20010-202', 45, NULL);
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '30020-303', 55, '140');
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '40030-404', 65, NULL);
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '50040-505', 75, '160');
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '60050-606', 85, NULL);
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '70060-707', 95, '180');
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '80070-808', 105, NULL);
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '90080-909', 115, '200');
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '10110-111', 125, NULL);
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '12010-212', 135, '220');
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '23020-323', 145, NULL);
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '34030-434', 155, '240');
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '45040-545', 165, NULL);
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '56050-656', 175, '260');
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '67060-767', 185, NULL);
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '78070-878', 195, '280');
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '89080-989', 205, NULL);
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '90090-100', 215, '300');
INSERT INTO Hotel (Id_Hotel, CEP, Num_quartos, Num_endereco) VALUES (seq_hotel.nextval, '90090-100', 225, NULL);
SELECT * FROM Hotel;

/* Povoando a tabela QuartoPreco */
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('1', 1, 75.50);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('2', 1, 85.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('3', 1, 95.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('1', 2, 70.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('2', 2, 80.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('1', 3, 95.50);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('2', 3, 100.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('3', 3, 110.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('1', 4, 90.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('2', 4, 100.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('1', 5, 85.50);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('2', 5, 95.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('1', 6, 100.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('2', 6, 105.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('3', 6, 120.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('1', 7, 115.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('2', 7, 125.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('1', 8, 130.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('2', 8, 140.00);
INSERT INTO QuartoPreco(Quarto, Id_Hotel, Preco) VALUES ('3', 8, 150.00);
SELECT * FROM QuartoPreco;


/* Povoando a tabela Reserva */
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (1, seq_reserva.nextval, '1', TO_DATE('2023-10-10', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (1, seq_reserva.nextval, '2', TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (2, seq_reserva.nextval, '1', TO_DATE('2023-10-20', 'YYYY-MM-DD'), TO_DATE('2023-10-25', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (2, seq_reserva.nextval, '2', TO_DATE('2023-10-25', 'YYYY-MM-DD'), TO_DATE('2023-10-30', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (3, seq_reserva.nextval, '1', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-06', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (3, seq_reserva.nextval, '2', TO_DATE('2023-11-06', 'YYYY-MM-DD'), TO_DATE('2023-11-11', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (3, seq_reserva.nextval, '3', TO_DATE('2023-11-11', 'YYYY-MM-DD'), TO_DATE('2023-11-16', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (4, seq_reserva.nextval, '1', TO_DATE('2023-11-16', 'YYYY-MM-DD'), TO_DATE('2023-11-21', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (4, seq_reserva.nextval, '2', TO_DATE('2023-11-21', 'YYYY-MM-DD'), TO_DATE('2023-11-26', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (5, seq_reserva.nextval, '1', TO_DATE('2023-11-26', 'YYYY-MM-DD'), TO_DATE('2023-12-01', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (5, seq_reserva.nextval, '2', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-06', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (6, seq_reserva.nextval, '1', TO_DATE('2023-12-06', 'YYYY-MM-DD'), TO_DATE('2023-12-11', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (6, seq_reserva.nextval, '2', TO_DATE('2023-12-11', 'YYYY-MM-DD'), TO_DATE('2023-12-16', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (6, seq_reserva.nextval, '3', TO_DATE('2023-12-16', 'YYYY-MM-DD'), TO_DATE('2023-12-21', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (7, seq_reserva.nextval, '1', TO_DATE('2023-12-21', 'YYYY-MM-DD'), TO_DATE('2023-12-26', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (7, seq_reserva.nextval, '2', TO_DATE('2023-12-26', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (8, seq_reserva.nextval, '1', TO_DATE('2023-12-31', 'YYYY-MM-DD'), TO_DATE('2024-01-05', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (8, seq_reserva.nextval, '2', TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_DATE('2024-01-10', 'YYYY-MM-DD'));
INSERT INTO Reserva(Id_Hotel, Id_Reserva, Quarto, Check_In, Check_Out) 
VALUES (8, seq_reserva.nextval, '3', TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'));
SELECT * FROM Reserva;

/* Povoando a tabela Funcionarios */
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('52963214578', 'Roberto', 'M', 42);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('78524163590', 'Fernanda', 'F', 30);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('64578219032', 'Guilherme', 'M', 36);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('59861243750', 'Mariana', 'F', 32);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('68259413057', 'Ricardo', 'M', 45);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('12358976400', 'Patricia', 'F', 39);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('36987412500', 'Carlos', 'M', 40);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('25874136900', 'Amanda', 'F', 28);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('96385274100', 'Diogo', 'M', 35);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('15935748620', 'Luisa', 'F', 33);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('75315986240', 'Andre', 'M', 37);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('25896314700', 'Camila', 'F', 31);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('15975348620', 'Leonardo', 'M', 41);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('75395185240', 'Bianca', 'F', 29);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('98765432110', 'Felipe', 'M', 34);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('98765432112', 'Daniela', 'F', 38);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('98765432113', 'Lucas', 'M', 43);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('98765432114', 'Alice', 'F', 33);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('98765432115', 'Marcos', 'M', 36);
INSERT INTO Funcionarios(CPF_Funcionario, Nome, Sexo, Idade) VALUES ('98765432116', 'Julia', 'F', 40);
SELECT * FROM Funcionarios;

/* Povoando a tabela Telefone */
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('52963214578', '(11) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('78524163590', '(21) 99452-5876');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('64578219032', '(31) 98425-9631');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('59861243750', '(41) 98741-2569');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('68259413057', '(51) 98742-6931');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('12358976400', '(61) 98452-7963');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('36987412500', '(71) 98741-2569');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('25874136900', '(81) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('96385274100', '(91) 98741-2569');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('15935748620', '(11) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('75315986240', '(21) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('25896314700', '(31) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('15975348620', '(41) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('75395185240', '(51) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('98765432110', '(61) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('98765432112', '(71) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('98765432113', '(81) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('98765432114', '(91) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('98765432115', '(11) 98652-1473');
INSERT INTO Telefone(CPF_Funcionario, Num_Telefone) VALUES ('98765432116', '(21) 98652-1473');
SELECT * FROM Telefone;

/* Povoando a tabela Motorista */
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('52963214578', '8542637410');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('78524163590', '5748632109');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('64578219032', '6325897410');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('59861243750', '8542613907');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('68259413057', '7456238190');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('12358976400', '8564932107');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('36987412500', '7465289310');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('25874136900', '7546213890');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('96385274100', '7458326190');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('15935748620', '7541986230');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('75315986240', '9546328170');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('25896314700', '7452836910');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('15975348620', '8543967210');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('75395185240', '7459283610');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('98765432110', '8549632107');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('98765432112', '7549386210');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('98765432113', '7435829610');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('98765432114', '8542936170');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('98765432115', '7548213690');
INSERT INTO Motorista(CPF_Funcionario, Num_Cnh) VALUES ('98765432116', '7549328160');
SELECT * FROM Motorista;

/* Povoando a tabela Agente */
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('52963214578', 'roberto@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('78524163590', 'fernanda@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('64578219032', 'guilherme@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('59861243750', 'mariana@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('68259413057', 'ricardo@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('12358976400', 'patricia@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('36987412500', 'carlos@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('25874136900', 'amanda@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('96385274100', 'diogo@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('15935748620', 'luisa@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('75315986240', 'andre@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('25896314700', 'camila@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('15975348620', 'leonardo@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('75395185240', 'bianca@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('98765432110', 'felipe@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('98765432112', 'daniela@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('98765432113', 'lucas@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('98765432114', 'alice@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('98765432115', 'marcos@example.com');
INSERT INTO Agente(CPF_Funcionario, Email) VALUES ('98765432116', 'julia@example.com');
SELECT * FROM Agente;

/* Povoando a tabela Se_Hospeda */
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('01020304050', 1);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('06070809100', 2);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('11012131415', 3);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('16171819200', 4);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('21222324250', 5);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('26272829300', 1);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('31323334350', 2);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('36373839400', 3);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('41424344450', 4);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('46474849500', 5);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('51525354550', 1);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('56575859600', 2);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('61626364650', 3);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('66676869700', 4);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('71727374750', 5);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('76777879800', 1);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('81828384850', 2);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('86878889800', 3);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('91929394950', 4);
INSERT INTO Se_Hospeda(CPF_Cliente, Id_Hotel) VALUES ('96979899900', 5);
SELECT * FROM Se_Hospeda;


/* Povoando a tabela Conduz */
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('01020304050', 1, '52963214578', 'Aeroporto Internacional de Guarulhos', 'Hotel Paulista Plaza', TIMESTAMP '2023-10-08 08:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('06070809100', 2, '78524163590', 'Aeroporto Internacional do Rio de Janeiro', 'Hotel Copacabana Palace', TIMESTAMP '2023-10-09 09:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('11012131415', 3, '64578219032', 'Aeroporto Internacional de Brasília', 'Hotel Nacional', TIMESTAMP '2023-10-10 10:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('16171819200', 4, '59861243750', 'Aeroporto Internacional de Confins', 'Hotel Ouro Minas', TIMESTAMP '2023-10-11 11:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('21222324250', 5, '68259413057', 'Aeroporto Internacional de Porto Alegre', 'Hotel Sheraton', TIMESTAMP '2023-10-12 12:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('26272829300', 1, '12358976400', 'Aeroporto Internacional de Florianópolis', 'Hotel Majestic Palace', TIMESTAMP '2023-10-13 13:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('31323334350', 2, '36987412500', 'Aeroporto Internacional de Salvador', 'Hotel Pestana', TIMESTAMP '2023-10-14 14:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('36373839400', 3, '25874136900', 'Aeroporto Internacional de Fortaleza', 'Hotel Gran Marquise', TIMESTAMP '2023-10-15 15:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('41424344450', 4, '96385274100', 'Aeroporto Internacional de Manaus', 'Hotel Tropical', TIMESTAMP '2023-10-16 16:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('46474849500', 5, '15935748620', 'Aeroporto Internacional de Recife', 'Hotel Atlante Plaza', TIMESTAMP '2023-10-17 17:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('51525354550', 1, '75315986240', 'Aeroporto Internacional de Curitiba', 'Hotel Pestana', TIMESTAMP '2023-10-18 18:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('56575859600', 2, '25896314700', 'Aeroporto Internacional de Goiânia', 'Hotel Castro', TIMESTAMP '2023-10-19 19:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('61626364650', 3, '15975348620', 'Aeroporto Internacional de Vitória', 'Hotel Senac Ilha do Boi', TIMESTAMP '2023-10-20 20:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('66676869700', 4, '75395185240', 'Aeroporto Internacional de Natal', 'Hotel Serhs', TIMESTAMP '2023-10-21 21:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('71727374750', 5, '98765432110', 'Aeroporto Internacional de Belém', 'Hotel Hilton', TIMESTAMP '2023-10-22 22:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('76777879800', 1, '98765432112', 'Aeroporto Internacional de Campo Grande', 'Hotel Bahia', TIMESTAMP '2023-10-23 08:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('81828384850', 2, '98765432113', 'Aeroporto Internacional de Maceió', 'Hotel Jatiúca', TIMESTAMP '2023-10-24 09:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('86878889800', 3, '98765432114', 'Aeroporto Internacional de Teresina', 'Hotel Blue Tree Towers', TIMESTAMP '2023-10-25 10:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('91929394950', 4, '98765432115', 'Aeroporto Internacional de São Luis', 'Hotel Luzeiros', TIMESTAMP '2023-10-26 11:00:00');
INSERT INTO Conduz(CPF_Cliente, Id_Hotel, CPF_Funcionario, Ponto_Embarque, Ponto_Desembarque, Data_Hora) VALUES
('96979899900', 5, '98765432116', 'Aeroporto Internacional de João Pessoa', 'Hotel Tambaú', TIMESTAMP '2023-10-27 12:00:00');
SELECT * FROM Conduz;


/* Povoando a tabela Leva */
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(1, '01020304050', '52963214578', TIMESTAMP '2023-10-08 10:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(2, '06070809100', '78524163590', TIMESTAMP '2023-10-09 11:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(3, '11012131415', '64578219032', TIMESTAMP '2023-10-10 12:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(4, '16171819200', '59861243750', TIMESTAMP '2023-10-11 13:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(5, '21222324250', '68259413057', TIMESTAMP '2023-10-12 14:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(1, '26272829300', '12358976400', TIMESTAMP '2023-10-13 15:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(2, '31323334350', '36987412500', TIMESTAMP '2023-10-14 16:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(3, '36373839400', '25874136900', TIMESTAMP '2023-10-15 17:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(4, '41424344450', '96385274100', TIMESTAMP '2023-10-16 18:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(5, '46474849500', '15935748620', TIMESTAMP '2023-10-17 19:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(1, '51525354550', '75315986240', TIMESTAMP '2023-10-18 20:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(2, '56575859600', '25896314700', TIMESTAMP '2023-10-19 21:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(3, '61626364650', '15975348620', TIMESTAMP '2023-10-20 22:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(4, '66676869700', '75395185240', TIMESTAMP '2023-10-21 10:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(5, '71727374750', '98765432110', TIMESTAMP '2023-10-22 11:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(1, '76777879800', '98765432112', TIMESTAMP '2023-10-23 12:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(2, '81828384850', '98765432113', TIMESTAMP '2023-10-24 13:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(3, '86878889800', '98765432114', TIMESTAMP '2023-10-25 14:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(4, '91929394950', '98765432115', TIMESTAMP '2023-10-26 15:00:00');
INSERT INTO Leva(ID_Atracao, CPF_Cliente, CPF_Funcionario, Data_Hora) VALUES
(5, '96979899900', '98765432116', TIMESTAMP '2023-10-27 16:00:00');
SELECT * FROM Leva;

/* Povoando a tabela Efetua */
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('01020304050', 1, 1, '52963214578');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('06070809100', 1, 2, '78524163590');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('11012131415', 2, 3, '64578219032');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('16171819200', 2, 4, '59861243750');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('21222324250', 3, 5, '68259413057');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('26272829300', 3, 6, '12358976400');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('31323334350', 3, 7, '36987412500');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('36373839400', 4, 8, '25874136900');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('41424344450', 4, 9, '96385274100');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('46474849500', 5, 10, '15935748620');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('51525354550',5, 11, '75315986240');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('56575859600', 6, 12, '25896314700');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('61626364650', 6, 13, '15975348620');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('66676869700', 6, 14, '75395185240');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('71727374750', 7, 15, '98765432110');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('76777879800', 7, 16, '98765432112');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('81828384850', 8, 17, '98765432113');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('86878889800', 8, 18, '98765432114');
INSERT INTO Efetua(CPF_Cliente, Id_Hotel, Id_Reserva, CPF_Funcionario) VALUES
('91929394950', 8, 19, '98765432115');
SELECT * FROM Efetua;
