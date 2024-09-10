CREATE DATABASE BibliotecaIFBA;
USE BibliotecaIFBA;

CREATE TABLE Bibliotecario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    matriculasiape VARCHAR(50) UNIQUE,
    nome VARCHAR(100),
    cpf VARCHAR(11) UNIQUE,
    email VARCHAR(100),
    login VARCHAR(50),
    senha VARCHAR(50)
);

CREATE TABLE Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(50) UNIQUE,
    nome VARCHAR(100),
    rg VARCHAR(10),
    cpf VARCHAR(11) UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco VARCHAR(150)
);

CREATE TABLE Exemplar (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150),
    autor_id INT,
    editora_id INT,
    classificacao VARCHAR(50),
    categoria VARCHAR(50),
    anoDePublicacao YEAR,
    FOREIGN KEY (autor_id) REFERENCES Autor(id),
    FOREIGN KEY (editora_id) REFERENCES Editora(id)
);

CREATE TABLE Autor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE Editora (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    cidade VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Reserva (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dataReserva DATE,
    situacao VARCHAR(20),
    id_usuario INT,
    id_exemplar INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_exemplar) REFERENCES Exemplar(id)
);

CREATE TABLE Locacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    dataLocacao DATE,
    dataDevolucao DATE,
    observacaoDevolucao VARCHAR(150),
    id_exemplar INT,
    id_bibliotecario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_exemplar) REFERENCES Exemplar(id),
    FOREIGN KEY (id_bibliotecario) REFERENCES Bibliotecario(id)
);

INSERT INTO Autor (nome) VALUES ('J.K. Rowling'), ('George R.R. Martin');

INSERT INTO Editora (nome, telefone, cidade, email) 
VALUES ('Editora A', '234567890', 'Salvador', 'contato@editoraa.com'),
       ('Editora B', '876543210', 'Feira de Santana', 'contato@editorab.com');

INSERT INTO Exemplar (titulo, autor_id, editora_id, classificacao, categoria, anoDePublicacao) 
VALUES ('Harry Potter', 1, 1, 'Fantasia', 'Livro', 1997),
       ('A Game of Thrones', 2, 2, 'Fantasia Épica', 'Livro', 1996);

INSERT INTO Usuario (matricula, nome, rg, cpf, telefone, email, endereco) 
VALUES ('2024003', 'Pedro Lima', '2345678', '44444444444', '71966666666', 'pedro@ifba.edu.br', 'Rua C, Salvador'),
       ('2024004', 'Ana Costa', '8765432', '55555555555', '71955555555', 'ana@ifba.edu.br', 'Rua D, Feira de Santana');

INSERT INTO Bibliotecario (matriculasiape, nome, cpf, email, login, senha) 
VALUES ('002', 'Paulo Pereira', '66666666666', 'paulo@ifba.edu.br', 'paulo', 'senha456');

UPDATE Usuario SET telefone = '71944444444' WHERE id = 1;

UPDATE Exemplar SET titulo = 'Harry Potter e a Pedra Filosofal' WHERE id = 1;

DELETE FROM Reserva WHERE id = 1;

DELETE FROM Autor WHERE id = 2;

SELECT * FROM Usuario;

SELECT * FROM Exemplar;

SELECT * FROM Locacao;
