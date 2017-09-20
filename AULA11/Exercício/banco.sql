-- 01) O nome de todas as categorias de livros ordenados pelo nome da categoria de forma decrescente.
--SELECT categoria.nome FROM categoria ORDER BY nome DESC 

-- 02) O nome de todos os livros e suas respectivas categorias, ordenado por nome da categoria e nome dos livros (sempre em ordem ascendente).
--SELECT c.nome, l.nome FROM categoria c, livro l WHERE c.id = l.categoria_fk ORDER BY c.nome, l.nome ASC

-- 03) Nome e Matrícula de todos os alunos.
--SELECT u.nome, a.matricula FROM aluno a, usuario u WHERE u.id = a.usuario_fk

-- 04) Nome do Professor, Do Livro e da Categoria de todas as recomendações feitas.
--SELECT u.nome, l.nome, c.nome FROM usuario u, professor p, livro l, categoria c, recomendacao r WHERE r.professor_fk = p.usuario_fk AND p.usuario_fk = u.id AND r.livro_fk = l.id AND c.id = l.categoria_fk
--
--SELECT usuario.nome Professor, categoria.nome Categoria, livro.nome Livro FROM recomendacao, usuario, professor, livro, categoria 
--WHERE recomendacao.professor_fk = professor.usuario_fk AND professor.usuario_fk = usuario.id
--AND recomendacao.livro_fk = livro.id
--AND livro.categoria_fk = categoria.id ORDER BY professor, categoria, livro

-- 05) Nome dos Livros que nunca foram recomendados.
--SELECT nome FROM livro WHERE id NOT IN
--(SELECT l.id FROM livro l, recomendacao r WHERE l.id = r.livro_fk)
--
--SELECT * FROM LIVRO WHERE id NOT IN (SELECT DISTINCT livro_fk FROM recomendacao)

-- 06) Nome do Usuário e quantidade de empréstimos já realizados.
--SELECT ID, u.nome, COUNT(*) FROM emprestimo e, usuario u WHERE e.usuario_fk = u.id GROUP BY id, nome ORDER BY nome 

-- 07) Nome das Categorias de livros que foram emprestadas mais de duas vezes.
--SELECT c.nome FROM categoria c, livro l, emprestimo e WHERE c.id=l.categoria_fk AND e.livro_fk=l.id GROUP BY c. id, c.nome HAVING count(*) > 2

-- 08) Quantidade de livros por categoria.
--SELECT c.nome, count(*) FROM livro l, categoria c WHERE l.categoria_fk=c.id GROUP BY c. id, c.nome

-- 09) Categorias de livros que nunca foram recomendadas.
--SELECT * FROM categoria c WHERE id NOT IN (SELECT DISTINCT categoria_fk FROM recomendacao r, livro l WHERE r.livro_fk=l.id)

-- 10) Alunos e quantidades de empréstimos realizados.
--SELECT u.nome, count(*) quant FROM usuario u, emprestimo e, aluno a WHERE u.id=e.usuario_fk AND u.id=a.usuario_fk GROUP BY u.id, u.nome

--SELECT * FROM usuario WHERE nome ILIKE '%s%'
--SELECT * FROM usuario WHERE lower(nome) LIKE lower('%s%')
--SELECT * FROM usuario WHERE upper(nome) LIKE upper('%s%')  

--SELECT * FROM usuario LIMIT 2
--SELECT * FROM usuario OFFSET 4 LIMIT 2





