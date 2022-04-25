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
Primary Key e etc), seu tipo (VARCHAR, CHAR, INTEGER...) e o comentário que será mostrado no banco de dados.

Uma vez completado esta parte, é o momento de fazer as relações entre cada tabela: 
ligar cada FK a sua respectiva PK e e definir seu tipo de relacionamento (1:N, 1:1 ...). 
Além disso, é preciso categorizar o relacionamento em indentificado, caso a PK seja também uma FK, ou 
não identificado (não que essa parte faça muita diferença, mas é bom saber e deixar explícito). 
Também é necessário incluir as chaves únicas (ou chaves alternativas) por meio de um index na tabela.

Por fim, é importante fazer uma revisão geral para identificar possíveis problemas no projeto. 
Este modelo gerará os códigos de SQL com todos as formatações (com alguns poucos desajustes que serão corrigidos posteriormente).
