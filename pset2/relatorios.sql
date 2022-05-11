-- Pset 2

--QUESTÃO 01: 

SELECT d.nome_departamento, AVG(salario) AS media_salarial
FROM funcionario AS f, departamento AS d
WHERE (d.numero_departamento = f.numero_departamento)
GROUP BY d.nome_departamento;

-- QUESTÃO 02:

SELECT f.sexo, AVG(salario) AS media_salarial
FROM funcionario AS f
WHERE (sexo = 'M')
GROUP BY f.sexo
UNION 
SELECT f.sexo, AVG(salario) 
FROM funcionario AS f
WHERE (sexo = 'F')
GROUP BY f.sexo;

-- QUESTÃO 03: 

SELECT d.nome_departamento, (f.primeiro_nome||' '|| f.nome_meio||' '|| f.ultimo_nome) AS nome_completo, f.data_nascimento, DATE_PART('year', current_date) - DATE_PART('year', f.data_nascimento) AS idade, f.salario
FROM funcionario AS f
INNER JOIN departamento AS d ON (f.numero_departamento = d.numero_departamento)
ORDER BY d.nome_departamento;

--QUESTÃO 04:

SELECT (primeiro_nome||' '|| nome_meio||' '|| ultimo_nome) AS nome_completo, DATE_PART('year', AGE(f.data_nascimento)) AS idade, salario * 1.2 AS salario_reajustado
FROM funcionario AS f
WHERE (salario < 3500)
UNION
SELECT DISTINCT (primeiro_nome||' '|| nome_meio||' '|| ultimo_nome) AS nome_completo, DATE_PART('year', AGE(f.data_nascimento)) AS idade, salario * 1.15 AS salario_reajustado
FROM funcionario AS f
WHERE (salario >= 3500);

-- QUESTÃO 05:

SELECT d.nome_departamento, (f.primeiro_nome||' '|| f.nome_meio||' '|| f.ultimo_nome) AS nome_completo, f.salario
FROM funcionario AS f, departamento AS d
WHERE (f.numero_departamento = d.numero_departamento)
ORDER BY d.nome_departamento ASC, f.salario DESC;

-- QUESTÃO 06:

SELECT (f.primeiro_nome||' '|| f.nome_meio||' '|| f.ultimo_nome) AS nome_completo_funcionario,d.nome_departamento, dpt.nome_dependente, DATE_PART('year', AGE(dpt.data_nascimento)) AS idade,
(case when(dpt.sexo = 'M')then 'Masculino' when(dpt.sexo = 'F')then 'Feminino'end) as sexo
FROM funcionario AS f
INNER JOIN dependente AS dpt ON (dpt.cpf_funcionario = f.cpf)
INNER JOIN departamento AS d ON (d.numero_departamento = f.numero_departamento);

-- QUESTÃO 07: 

SELECT (f.primeiro_nome||' '|| f.nome_meio||' '|| f.ultimo_nome) AS nome_funcionario, f.numero_departamento, f.salario
FROM funcionario AS f
WHERE f.cpf NOT IN (SELECT d.cpf_funcionario FROM dependente AS d);

-- QUESTÃO 08:

SELECT d.nome_departamento, pr.nome_projeto, (f.primeiro_nome||' '|| f.nome_meio||' '|| f.ultimo_nome) AS nome_completo, te.horas
FROM funcionario AS f
INNER JOIN trabalha_em AS te ON (f.cpf = te.cpf_funcionario)
INNER JOIN projeto AS pr ON (te.numero_projeto = pr.numero_projeto)
INNER JOIN departamento AS d ON (f.numero_departamento = d.numero_departamento)
ORDER BY d.nome_departamento ASC;

-- QUESTÃO 09:

SELECT d.nome_departamento, pr.nome_projeto, SUM(te.horas) AS total_horas
FROM funcionario AS f
INNER JOIN trabalha_em AS te ON (f.cpf = te.cpf_funcionario)
INNER JOIN projeto AS pr ON (te.numero_projeto = pr.numero_projeto)
INNER JOIN departamento AS d ON (f.numero_departamento = d.numero_departamento)
GROUP BY d.nome_departamento, pr.nome_projeto;

-- QUESTÃO 10:

SELECT d.nome_departamento, AVG(salario) AS media_salarial
FROM funcionario AS f, departamento AS d
WHERE (d.numero_departamento = f.numero_departamento)
GROUP BY d.nome_departamento;

-- QUESTÃO 11:

SELECT (f.primeiro_nome||' '|| f.nome_meio||' '|| f.ultimo_nome) AS nome_completo, pr.nome_projeto, te.horas * 50  AS valor_total_horas
FROM funcionario AS f
INNER JOIN trabalha_em AS te ON (f.cpf = te.cpf_funcionario)
INNER JOIN projeto AS pr ON (te.numero_projeto = pr.numero_projeto)
ORDER BY f.salario;

-- QUESTÃO 12:

SELECT d.nome_departamento, pr.nome_projeto, (f.primeiro_nome||' '|| f.nome_meio||' '|| f.ultimo_nome) AS nome_completo
FROM funcionario AS f
INNER JOIN departamento AS d ON (f.numero_departamento = d.numero_departamento)
INNER JOIN trabalha_em AS te ON (f.cpf = te.cpf_funcionario)
INNER JOIN projeto AS pr ON (te.numero_projeto = pr.numero_projeto)
WHERE te.horas IS NULL; 

-- QUESTÃO 13:

SELECT (f.primeiro_nome||' '|| f.nome_meio||' '|| f.ultimo_nome) AS nome, f.sexo, DATE_PART('year', AGE(f.data_nascimento)) AS idade
FROM funcionario AS f
UNION
SELECT (d.nome_dependente) AS nome, d.sexo, DATE_PART('year', AGE(d.data_nascimento)) AS idade
FROM dependente AS d
ORDER BY idade DESC;

-- QUESTÃO 14:

SELECT D.nome_departamento, COUNT(f.cpf) AS quantidade_funcionarios
FROM funcionario AS f
INNER JOIN departamento AS d ON f.numero_departamento = d.numero_departamento
GROUP BY d.nome_departamento;

-- QUESTÃO 15:

SELECT (f.primeiro_nome||' '|| f.nome_meio||' '|| f.ultimo_nome) AS nome_completo, d.nome_departamento, pr.nome_projeto
FROM funcionario AS f
INNER JOIN trabalha_em AS te ON (f.cpf = te.cpf_funcionario)
INNER JOIN projeto AS pr ON (te.numero_projeto = pr.numero_projeto)
INNER JOIN departamento AS d ON (f.numero_departamento = d.numero_departamento);
