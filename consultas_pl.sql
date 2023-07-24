/* 01. Caso queiramos fazer um roteiro com atrações de custo mais acessiveis, poderiamos usar um trigger para limitar o preço delas*/
CREATE OR REPLACE TRIGGER limitador_de_custo BEFORE INSERT OR UPDATE OF Preco ON Atracao
FOR EACH ROW
DECLARE 
	limite_preco NUMBER;
BEGIN
	limite_preco := 2000;
	IF :NEW.Preco >= limite_preco THEN
		RAISE_APPLICATION_ERROR(-20001, 'O preço da atração excede o limite permitido.');
	END IF;
END;

/* 02. Criando um pacote para analisar as idades dos clientes */

DROP PACKAGE idade_analise;

CREATE OR REPLACE PACKAGE idade_analise IS
    TYPE TABELA_ANALISE IS TABLE OF VARCHAR(30) INDEX BY VARCHAR2(11);
	PROCEDURE analisa_situacao(tabela OUT TABELA_ANALISE);
	PROCEDURE print_analise(tabela IN TABELA_ANALISE);
	PROCEDURE Executa;
END idade_analise;


CREATE OR REPLACE PACKAGE BODY idade_analise IS
	PROCEDURE analisa_situacao(tabela OUT TABELA_ANALISE) IS
		CURSOR Cur_Idade IS SELECT CPF_Cliente, IDADE FROM Cliente;
		Media NUMBER;
	BEGIN
        SELECT AVG(Idade) INTO Media FROM Cliente;
		FOR Linha in Cur_Idade LOOP
			IF Linha.Idade < Media THEN
				tabela(Linha.CPF_Cliente) := 'Menor que a média';
			ELSIF Linha.Idade > Media THEN
				tabela(Linha.CPF_Cliente) := 'Maior que a média';
			ELSE 
				tabela(Linha.CPF_Cliente) := 'Na média';
			END IF;
		END LOOP;
    END analisa_situacao;

	PROCEDURE print_analise(tabela IN TABELA_ANALISE) IS
        idx VARCHAR2(11); -- CPF
    BEGIN
        idx := tabela.FIRST;
		WHILE idx IS NOT NULL LOOP
            dbms_output.put_line('CPF: ' || idx || ', Situação: ' || tabela(idx));
            idx := tabela.NEXT(idx);
		END LOOP;
	END print_analise;

	PROCEDURE Executa IS
        tabela TABELA_ANALISE;
	BEGIN 
        analisa_situacao(tabela);
		print_analise(tabela);
	END Executa;

END idade_analise;

BEGIN
    DBMS_OUTPUT.DISABLE;
    DBMS_OUTPUT.ENABLE(10000);
END;
/
BEGIN
    idade_analise.Executa;
END;
/

/* USO DE RECORD: Obter informações do cliente a partir do seu CPF */
DECLARE 
    tipo_cliente Cliente%ROWTYPE;
BEGIN 
    SELECT * INTO tipo_cliente FROM Cliente WHERE CPF_Cliente = '06070809100';
    DBMS_OUTPUT.PUT_LINE('CPF: ' || tipo_cliente.CPF_Cliente || ', Nome: ' || tipo_cliente.Nome);
END;
/

/* CREATE FUNCTION: Calcular a receita total de um hotel específico com base no preço dos quartos e a duração da estadia */
CREATE OR REPLACE FUNCTION calcula_receita_hotel(p_id_hotel Hotel.Id_Hotel%TYPE) RETURN NUMBER IS
    receita_total NUMBER;
BEGIN 
    SELECT SUM(Preco * (Check_Out - Check_In)) 
    INTO receita_total
    FROM Hotel H
    INNER JOIN QuartoPreco QP ON H.Id_Hotel = QP.Id_Hotel
    INNER JOIN Reserva R ON H.Id_Hotel = R.Id_Hotel
    WHERE H.Id_Hotel = p_id_hotel;

    RETURN receita_total;
END calcula_receita_hotel;
/

DECLARE
    v_receita NUMBER;
BEGIN
    v_receita := calcula_receita_hotel(1);
    DBMS_OUTPUT.PUT_LINE('Receita Total: ' || v_receita);
END;
/

/* %ROWTYPE e %TYPE : Obter todas as informações de localidade de um hotel específico baseado em seu ID */
DECLARE 
    Tipo_hotel Hotel%ROWTYPE;
	Rua Endereco.Rua%TYPE;
	Pais Endereco.Pais%TYPE;
BEGIN 
    SELECT * INTO tipo_hotel FROM Hotel WHERE Id_Hotel = 3;
	SELECT Rua, Pais INTO Rua, Pais FROM Endereco WHERE CEP = tipo_hotel.CEP;
    DBMS_OUTPUT.PUT_LINE('ID do Hotel: ' || Tipo_hotel.Id_Hotel || ' Rua: ' || Rua || ' Pais: ' || Pais);
END;
/

/* CASE WHEN: Classificar a clientela do banco de dados com base no número total de clientes */
DECLARE 
    total_clientes NUMBER;
    classificacao VARCHAR2(20);
BEGIN 
    SELECT COUNT(*) INTO total_clientes FROM Cliente;

    classificacao := 
    CASE 
        WHEN total_clientes < 50 THEN 'Baixo'
        WHEN total_clientes BETWEEN 50 AND 100 THEN 'Médio'
        ELSE 'Alto'
    END;

    DBMS_OUTPUT.PUT_LINE('Classificação da clientela: ' || classificacao);
END;
/

/* EXCEPTION WHEN: Tentar recuperar o nome de um cliente com base em um CPF que não existe no banco de dados, manipulando a exceção de nenhuma linha encontrada */
DECLARE 
    nome_cliente VARCHAR2(50);
BEGIN 
    SELECT Nome INTO nome_cliente FROM Cliente WHERE CPF_Cliente = '99999999999';
    DBMS_OUTPUT.PUT_LINE('Nome: ' || nome_cliente);
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('Cliente não encontrado');
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Erro desconhecido');
END;
/

/* LOOP EXIT WHEN: Mostrar os dados de cada quarto e seu preço */
DECLARE 
    CURSOR curr_quarto_preco IS SELECT Quarto, Id_Hotel, Preco FROM QuartoPreco;
    Num_Quarto CHAR(50);
    Id_Hotel INT;
    Preco NUMBER;
BEGIN 
    FOR quarto_info IN curr_quarto_preco LOOP
        Num_Quarto := quarto_info.Quarto;
        Id_Hotel := quarto_info.Id_Hotel;
        Preco := quarto_info.Preco;

        DBMS_OUTPUT.PUT_LINE('Numero do quarto: ' || Num_Quarto || ' ID do hotel: ' || Id_Hotel || ' Preço do quarto: ' || Preco);
    END LOOP;
END;
/