CREATE TABLE funcionarios(
    fun_id INT PRIMARY KEY,
    primeiro_nome VARCHAR(30),
    sobrenome VARCHAR(30),
    data_nascimento DATE,
    sexo VARCHAR(1),
    salary INT,
    super_id INT,
    sede_id INT
);

CREATE TABLE sede(
    sede_id INT PRIMARY KEY,
    sede_nome VARCHAR(40),
    gerente_id INT,
    ger_data_inicio DATE,
    FOREIGN KEY(gerente_id) REFERENCES funcionarios(fun_id) ON DELETE SET NULL
    );

CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    cliente_nome VARCHAR(30),
    sede_id INT,
    FOREIGN KEY(sede_id) REFERENCES sede(sede_id) ON DELETE SET NULL
);

CREATE TABLE receita(
    fun_id INT,
    cliente_id INT,
    vendas_totais INT,
    PRIMARY KEY(fun_id, cliente_id),
    FOREIGN KEY(fun_id) REFERENCES funcionarios(fun_id) ON DELETE CASCADE,
    FOREIGN KEY(cliente_id) REFERENCES clientes(cliente_id) ON DELETE CASCADE
);

CREATE TABLE fornecedor(
    sede_id INT,
    fornecedor_nome VARCHAR(40),
    tipo_suprimento VARCHAR(30),
    PRIMARY KEY(sede_id, fornecedor_nome),
    FOREIGN KEY(sede_id) REFERENCES sede(sede_id) ON DELETE CASCADE
);

DROP TABLE employee;
DROP TABLE branch;
DROP TABLE clients;
DROP TABLE works_with;
DROP TABLE branch_supplier;

CREATE TABLE sede(
    sede_id INT PRIMARY KEY,
    sede_nome VARCHAR(40),
    gerente_id INT,
    ger_data_inicio DATE,
    FOREIGN KEY(gerente_id) REFERENCES funcionarios(fun_id) ON DELETE SET NULL
    );

ALTER TABLE funcionarios
ADD FOREIGN KEY(sede_id)
REFERENCES sede(sede_id)
ON DELETE SET NULL;


ALTER TABLE funcionarios
ADD FOREIGN KEy(super_id)
REFERENCES funcionarios(fun_id)
ON DELETE SET NULL;

CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    cliente_nome VARCHAR(30),
    sede_id INT,
    FOREIGN KEY(sede_id) REFERENCES sede(sede_id) ON DELETE SET NULL
);

CREATE TABLE receita(
    fun_id INT,
    cliente_id INT,
    vendas_totais INT,
    PRIMARY KEY(fun_id, cliente_id),
    FOREIGN KEY(fun_id) REFERENCES funcionarios(fun_id) ON DELETE CASCADE,
    FOREIGN KEY(cliente_id) REFERENCES clientes(cliente_id) ON DELETE CASCADE
);

DROP TABLE client;

CREATE TABLE fornecedor(
    sede_id INT,
    fornecedor_nome VARCHAR(40),
    tipo_suprimento VARCHAR(30),
    PRIMARY KEY(sede_id, fornecedor_nome),
    FOREIGN KEY(sede_id) REFERENCES sede(sede_id) ON DELETE CASCADE
);


INSERT INTO funcionarios VALUES(100, "David", "Wallace", "1967-11-17", "M", 250.000, NULL, NULL);

INSERT INTO sede VALUES(1, "Corporate", 100, "2006-02-09");

UPDATE funcionarios
SET sede_id = 1
WHERE fun_id = 100;

INSERT INTO funcionarios VALUES(101, "Jan", "Levinson", "1961-05-11", "F", 110.000, 100, 1);

INSERT INTO funcionarios VALUES(102, "Michael", "Scott", "1963-03-15", "M", 75000, 100, NULL);

INSERT INTO sede VALUES(2, "Scranton", 102, "1992-04-06");

UPDATE funcionarios 
set sede_id = 2
WHERE fun_id = 102;

INSERT INTO funcionarios VALUES(103, "Angela", "Martin", "1971-06-26", "F", 63000, 102, 2);
INSERT INTO funcionarios VALUES(104, "Kelly", "Kapoor", "1980-02-05", "M", 55000, 102, 2);
INSERT INTO funcionarios VALUES(105, "Dwight", "schrute", "1958-02-19", "M", 69000, 102, 2);


INSERT INTO funcionarios VALUES(106, "Josh", "Porter", "1969-09-05", "M", 78000, 100, NULL);

INSERT INTO sede VALUES(3, "Stamford", 103, "1996-02-13");

UPDATE sede 
set gerente_id = 106
WHERE gerente_id = 103;

UPDATE funcionarios 
set sede_id = 3
WHERE fun_id = 106;

INSERT INTO funcionarios VALUES(107, "Andy", "Bernard", "1973-07-22", "M", 65000, 106, 3);
INSERT INTO funcionarios VALUES(108, "Jim", "Halpert", "1978-10-01", "M", 71000, 106, 3);

INSERT INTO fornecedor VALUES(2, "Hammel Mill", "Paper");
INSERT INTO fornecedor VALUES(2, "Uni-ball", "Writing Utensils");
INSERT INTO fornecedor VALUES(3, "Patriot Paper", "Paper");
INSERT INTO fornecedor VALUES(2, "J.T Forms & Labels", "Custom Forms");
INSERT INTO fornecedor VALUES(3, "Uni-ball", "Writing Utensils");
INSERT INTO fornecedor VALUES(3, "Hammel Mill", "Paper");
INSERT INTO fornecedor VALUES(3, "Stamford Labels", "Custom Forms");

INSERT INTO clientes VALUES(400, "Dunmore Highschool", 2);
INSERT INTO clientes VALUES(401, "Lackawana Country", 2);
INSERT INTO clientes VALUES(402, "Fedex", 3);
INSERT INTO clientes VALUES(403, "Jhon Daily Law", 3);
INSERT INTO clientes VALUES(404, "Scranton whitepages", 2);
INSERT INTO clientes VALUES(405, "Times Newspaper", 3);
INSERT INTO clientes VALUES(406, "Fedex", 2);

INSERT INTO receita VALUES(105, 400, 55000);
INSERT INTO receita VALUES(102, 401, 267000);
INSERT INTO receita VALUES(108, 402, 22500);
INSERT INTO receita VALUES(107, 403, 5000);
INSERT INTO receita VALUES(108, 403, 12000);
INSERT INTO receita VALUES(105, 404, 33000);
INSERT INTO receita VALUES(107, 405, 26000);
INSERT INTO receita VALUES(102, 406, 000);
INSERT INTO receita VALUES(105, 406, 55000);


SELECT * FROM funcionarios;
SELECT * FROM receita;
SELECT * FROM sede;
SELECT * FROM clientes;
SELECT * FROM fornecedor;