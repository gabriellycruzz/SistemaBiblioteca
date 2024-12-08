-- Criação do Banco de Dados

DROP DATABASE SistemaBiblioteca;
CREATE DATABASE SistemaBiblioteca;
USE SistemaBiblioteca;

-- Apagar as tabelas se já existirem

DROP TABLE IF EXISTS Emprestimos;
DROP TABLE IF EXISTS Livros;
DROP TABLE IF EXISTS Usuarios;
DROP TABLE IF EXISTS Autores;


-- Criação das Tabelas


-- Tabela de Autores
CREATE TABLE Autores (
    ID_Autor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    País VARCHAR(50),
    Biografia TEXT
);

-- Tabela de Livros
CREATE TABLE Livros (
    ID_Livro INT AUTO_INCREMENT PRIMARY KEY,
    Título VARCHAR(150) NOT NULL,
    ID_Autor INT NOT NULL,
    Categoria VARCHAR(50),
    Ano_Publicação YEAR,
    Status ENUM('Disponível', 'Emprestado') DEFAULT 'Disponível',
    FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor)
);

-- Tabela de Usuários
CREATE TABLE Usuarios (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereço VARCHAR(200),
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(15)
);

-- Tabela de Empréstimos
CREATE TABLE Emprestimos (
    ID_Emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    ID_Livro INT NOT NULL,
    Data_Retirada DATE NOT NULL,
    Data_Devolução DATE,
    Status ENUM('Aberto', 'Fechado') DEFAULT 'Aberto',
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Livro) REFERENCES Livros(ID_Livro)
);

-- Inserção de dados ficticios

-- Inserir autores
INSERT INTO Autores (Nome, País) VALUES 
('J.K. Rowling', 'Reino Unido'),
('George R.R. Martin', 'EUA');

-- Inserir livros
INSERT INTO Livros (Título, ID_Autor, Categoria, Ano_Publicação) VALUES 
('Harry Potter e a Pedra Filosofal', 1, 'Fantasia', 1997),
('A Guerra dos Tronos', 2, 'Fantasia', 1996);

-- Inserir usuários
INSERT INTO Usuarios (Nome, Endereço, Email, Telefone) VALUES 
('João Silva', 'Rua da Alegria, 123', 'joao.silva@gmail.com', '88999887766');

-- Inserir empréstimos
INSERT INTO Emprestimos (ID_Usuario, ID_Livro, Data_Retirada, Data_Devolução) VALUES 
(1, 1, '2024-12-01', '2024-12-07');


-- Exemplos de Consultas


-- Consultar livros disponíveis

SELECT * FROM Livros WHERE Status = 'Disponível';

-- Histórico de empréstimos de um usuário

SELECT 
    E.ID_Emprestimo, L.Título, E.Data_Retirada, E.Data_Devolução, E.Status
FROM 
    Emprestimos E
JOIN 
    Livros L ON E.ID_Livro = L.ID_Livro
WHERE 
    E.ID_Usuario = 1;

-- Livros mais emprestados

SELECT 
    L.Título, COUNT(E.ID_Emprestimo) AS Total_Emprestimos
FROM 
    Emprestimos E
JOIN 
    Livros L ON E.ID_Livro = L.ID_Livro
GROUP BY 
    L.Título
ORDER BY 
    Total_Emprestimos DESC;








