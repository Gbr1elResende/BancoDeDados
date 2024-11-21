-- Criando as tabelas
CREATE DATABASE EstudoSQL;
USE EstudoSQL;

CREATE TABLE cursos (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL
);

CREATE TABLE alunos (
    aluno_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    idade INT,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES cursos(curso_id)
);

-- Inserindo dados
INSERT INTO cursos (nome_curso) VALUES ('Matemática'), ('Física'), ('Química'), ('Biologia');
INSERT INTO alunos (nome_aluno, idade, curso_id) VALUES
('Alice', 22, 1),
('Bruno', 24, 2),
('Carlos', 19, 1),
('Daniel', 26, 3),
('Eva', 20, NULL);

-- =====================================================================
-- 1. Operadores Lógicos (AND, OR, NOT)
-- =====================================================================

-- Exemplo 1: Usando AND para filtrar alunos por idade e curso
SELECT nome_aluno, idade, curso_id
FROM alunos
WHERE idade > 20 AND curso_id = 1;

-- Exemplo 2: Usando OR para alunos de Matemática ou Física
SELECT nome_aluno, idade, curso_id
FROM alunos
WHERE curso_id = 1 OR curso_id = 2;

-- Exemplo 3: Usando NOT para excluir alunos sem curso
SELECT nome_aluno, idade, curso_id
FROM alunos
WHERE NOT curso_id IS NULL;

-- =====================================================================
-- 2. Operadores de Comparação (=, <, >, >=, <=, !=, <>)
-- =====================================================================

-- Exemplo 1: Selecionando alunos com idade maior que 20
SELECT nome_aluno, idade
FROM alunos
WHERE idade > 20;

-- Exemplo 2: Selecionando alunos que não estão matriculados (curso_id IS NULL)
SELECT nome_aluno, curso_id
FROM alunos
WHERE curso_id IS NULL;

-- Exemplo 3: Selecionando alunos com idade entre 19 e 25
SELECT nome_aluno, idade
FROM alunos
WHERE idade >= 19 AND idade <= 25;

-- =====================================================================
-- 3. Inner Join, Left Join e Right Join
-- =====================================================================

-- Exemplo 1: Inner Join para obter alunos e seus cursos
SELECT a.nome_aluno, c.nome_curso
FROM alunos a
INNER JOIN cursos c ON a.curso_id = c.curso_id;

-- Exemplo 2: Left Join para incluir alunos sem curso
SELECT a.nome_aluno, c.nome_curso
FROM alunos a
LEFT JOIN cursos c ON a.curso_id = c.curso_id;

-- Exemplo 3: Right Join para incluir cursos sem alunos
SELECT a.nome_aluno, c.nome_curso
FROM alunos a
RIGHT JOIN cursos c ON a.curso_id = c.curso_id;

-- =====================================================================
-- 4. COUNT e SUM
-- =====================================================================

-- Exemplo 1: Contar o número total de alunos
SELECT COUNT(*) AS total_alunos
FROM alunos;

-- Exemplo 2: Somar as idades de todos os alunos
SELECT SUM(idade) AS soma_idades
FROM alunos;

-- =====================================================================
-- 5. Cláusula WHERE e ON
-- =====================================================================

-- Exemplo 1: WHERE para filtrar alunos maiores de 20 anos
SELECT nome_aluno, idade
FROM alunos
WHERE idade > 20;

-- Exemplo 2: ON para especificar a relação no JOIN
SELECT a.nome_aluno, c.nome_curso
FROM alunos a
INNER JOIN cursos c ON a.curso_id = c.curso_id
WHERE c.nome_curso = 'Matemática';

-- =====================================================================
-- 6. IN e BETWEEN
-- =====================================================================

-- Exemplo 1: IN para verificar múltiplos valores
SELECT nome_aluno, curso_id
FROM alunos
WHERE curso_id IN (1, 3);

-- Exemplo 2: BETWEEN para selecionar idades em um intervalo
SELECT nome_aluno, idade
FROM alunos
WHERE idade BETWEEN 20 AND 25;

-- =====================================================================
-- 7. ORDER BY ASC e DESC
-- =====================================================================

-- Exemplo 1: Ordenar alunos por idade (ASC)
SELECT nome_aluno, idade
FROM alunos
ORDER BY idade ASC;

-- Exemplo 2: Ordenar alunos por idade em ordem decrescente (DESC)
SELECT nome_aluno, idade
FROM alunos
ORDER BY idade DESC;

-- =====================================================================
-- 8. GROUP BY e HAVING
-- =====================================================================

-- Exemplo 1: Contar alunos por curso
SELECT curso_id, COUNT(*) AS total_alunos
FROM alunos
GROUP BY curso_id;

-- Exemplo 2: Mostrar cursos com mais de 1 aluno usando HAVING
SELECT curso_id, COUNT(*) AS total_alunos
FROM alunos
GROUP BY curso_id
HAVING COUNT(*) > 1;
