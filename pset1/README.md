# Pset1
O **Problem set 1** cujo tinhamos que fazer desde o modelo lógico à 
implementação das relações do projeto e inserção dos dados em dois SGBD's: PostgreSQL e MariaDB/MySQL.

# 1. Git e GitHub
 Ele foi utilizado para auxiliar para guardar e atualizar versões do código-fonte na medida que o trabalho foi 
 confeccionado.
 
 # 2. Modelo Lógico
 Um modelo lógico é um esquema que ainda não foi implementado no banco de dados, nele contem
 as tabelas com suas relações, atributos tipos de dados, comentários e restrições e etc.
 O software usado para isso foi o SQL Power Architect para ambos os SGBDs.

Inicialmente criei cada tabela uma por uma e inserimos cada atributo com suas  respectivas restrições(como NOT NULL e 
Primary Key e etc), seu tipo (INTEGER, VARCHAR, DATE...) e o comentário que será mostrado no banco de dados.

Depois de feito isso, comecei a criar as relaçoes entre as tabelas como: 
ligar cada FK a sua respectiva PK e e definir seu tipo de relacionamento, alem de incluir as Chaves unicas( As "AK")
por meio de um index na tabela.

Por fim, é importante fazer uma revisão geral para identificar possíveis problemas no projeto. 
Este modelo gerará os códigos de SQL com todos as formatações.

# 3. PostgreSQL
O projeto foi feito para ser implementado em 2 SGBDs e um deles foi o PostgreSQL. Foi pedido que criassemos 
um script.sql e nele fossem postos todos os codigos e comentarios, para que ao abri-los em outro computador, crie tudo 
proposto com os comentarios.

A primeira coisa  que fiz foi criar um usuário para gerir o nosso banco de dados. Para isso, usa-se o comando *CREATE ROLE*. Eu criei um usuário "andre" com senha '12345'. Depois, criei o banco de dados com o usuário criado (andre), codificação UTF-8, usando o comando *CREATE DATABASE* (nome do BD é uvv, assim como foi pedido no pdf enviado). Assim que criado, conectei no banco uvv com o usuario "andre" e criei um esquema chamado
"elmasri" (CREATE SCHEMA ). Isso evita que todas as tabelas sejam criadas no esquema público para evitar conflitos como se, por exemplo, duas tabelas fossem criadas com o mesmo nome.
Depois de criado o esquema precisamos acessar ele e o tornar padrão usando o comando a baixo:

```sql
create schema elmasri AUTHORIZATION andre;
SET SEARCH_PATH TO elmasri, andre, public;
```
Após isso, é feita a criação das tabelas, com todos os comentarios e relacionamentos feitos no projeto lógico. O próprio Power Architect faz a codificação em SQL do projeto. É preciso apenas acrescentar ou resolver algumas coisas, e adicionar os comandos administrativos próprios de cada SGBD.

Para finalizar, inserimos os dados em cada tabela. É preciso lembrar que:

* O tipo DATE por padrão tem formato YYYY-MM-DD, logo é preciso tomar cuidado ao adicioná-las nesse padrão;

* Na tabela funcionário o primeiro funcionario tem que ser o gerente, pois ele possui cpf_supervisor com NULL, porque um valor de FK não pode ser criado antes que ele já exista como PK.

# 4. MariaDB
Depois de implementar no PostgreSQL, vamos para a ultima implemenação que é no MaraDB ( após a primeira, essa segunda se tornou muito mais facil).
Utilizando novamente o Power Architect, geramos o código do MySQL a partir do modelo lógico (igual feito anteriormente). 

O comando para INSERT dos dados serão exatamente os mesmos usados anteriormente.

Igualmente, a primeira coisa a ser fazer é criar um usuário e senha (andre e '12345'), usando *CREATE USER* e em seguida criar o banco de dados/esquema(que no MariaDB, são a mesma coisa quase) com codificação UTF-8. Pra finalizar este parte, dê as permissões de modificação do banco de dados uvv para o usuário criado.

Após isso é só repetir o processo feito no Tópico 3, e innserir as tabelas pelo arquivo gerado pelo Power Architect.  Um erro vizualissado é que os comandos para adicionar comentários no MariaDB são feitos por meio de um <ALTER TABLE <nome_tabela> MODIFY COLUMN <nome_atributo> COMMENT> mas isso acaba mudando as propriedades das tabelas, entao restrições como NOT NULL tem que ser postas novamente.
















