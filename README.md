# 📚 Sistema de Biblioteca

O **Sistema de Gerenciamento de Biblioteca** foi desenvolvido em **SQL**, projetado para gerenciar o cadastro de livros, usuários, autores e o controle de empréstimos.

---

## 🛠️ Funcionalidades

- *Cadastro de Autores:* Armazena informações como nome, país de origem e biografia.
- *Gerenciamento de Livros:* Registra títulos, categorias, status de disponibilidade e o autor associado.
- *Controle de Usuários:* Mantém dados de contato, como nome, endereço, e-mail e telefone.
- *Empréstimos de Livros:* Registra e gerencia o histórico de retirada e devolução de livros.

---

## 📂 Estrutura do Banco de Dados

A estrutura do banco de dados é baseada no seguinte Diagrama Entidade-Relacionamento (E-R):

- *Autores:* Representa os autores dos livros, com atributos como ID_Autor, Nome, País e Biografia.
- *Livros:* Contém informações sobre os livros, incluindo Título, ID_Autor (chave estrangeira), Categoria, Ano_Publicação e Status.
- *Usuários:* Armazena dados dos usuários da biblioteca, como Nome, Endereço, Email e Telefone.
- *Empréstimos:* Relaciona os usuários aos livros emprestados, com informações como Data_Retirada e Data_Devolução.

---

## 📝 Scripts SQL

Os scripts SQL incluem:

- *Criação de Tabelas:* Define a estrutura das tabelas.
- *População com Dados Fictícios:* Scripts para adicionar registros de exemplo.
- *Consultas Úteis:* Exemplos de consultas para gerenciar dados no banco.




