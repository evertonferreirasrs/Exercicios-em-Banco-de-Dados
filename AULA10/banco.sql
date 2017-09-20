--QUAIS OS PRODUTOS (ID, NOME) QUE O CLIENTE DE ID=1 COMPROU?
SELECT p.id, p.nome FROM cliente c, produto p, cliente_produto cp WHERE c.id = cp.cliente_fk AND cp.produto_fk = p.id AND c.id = 1
--ou
SELECT produto.id, produto.nome FROM produto, cliente_produto WHERE cliente_produto.produto_fk = produto.id AND cliente_produto.cliente_fk = 1
--ou
SELECT id, nome FROM produto WHERE id IN (SELECT produto_fk FROM cliente_produto WHERE cliente_fk = 1)
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--QUAIS OS PRODUTOS (ID, NOME) QUE O CLIENTE DE ID=1 NAO COMPROU?
SELECT id, nome FROM produto WHERE id NOT IN (SELECT produto_fk FROM cliente_produto WHERE cliente_fk = 1)
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--QUAIS OS PRODUTOS (ID, NOME) QUE OS CLIENTES DO GENERO MASCULINO NÃO COMPRARAM
SELECT id, nome FROM produto WHERE id NOT IN (SELECT DISTINCT produto_fk FROM cliente_produto, cliente WHERE cliente_fk = id AND genero = 'M')
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--NOME DE TODAS CATEGORIAS E A QUANTIDADE DE PRODUTOS DE CADA UMA.
SELECT c.nome, COUNT(*) FROM categoria c, produto p WHERE c.id = p.categoria_fk GROUP BY c.nome
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--NOME DE TODAS CATEGORIAS EM MAIUSCULO E A QUANTIDADE DE PRODUTOS DE CADA UMA.
SELECT UPPER(c.nome) nome, COUNT(*) FROM categoria c, produto p WHERE c.id = p.categoria_fk GROUP BY c.nome
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--NOME DE TODAS CATEGORIAS EM MINUSCULO E A QUANTIDADE DE PRODUTOS DE CADA UMA.
SELECT LOWER(c.nome) nome, COUNT(*) FROM categoria c, produto p WHERE c.id = p.categoria_fk GROUP BY c.nome
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--NOME DE TODAS CATEGORIAS EM MINUSCULO E A QUANTIDADE DE PRODUTOS DE CADA UMA.
SELECT INITCAP(c.nome) nome, COUNT(*) FROM categoria c, produto p WHERE c.id = p.categoria_fk GROUP BY c.nome
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--NOME DE TODAS CATEGORIAS E A QUANTIDADE > 2 DE PRODUTOS DE CADA UMA.
SELECT UPPER(c.nome) nome, COUNT(*) FROM categoria c, produto p WHERE c.id = p.categoria_fk GROUP BY c.nome HAVING COUNT(*) > 2
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--NOME DA CATEGORIA E QUANTIDADE DE PRODUTOS VENDIDOS
SELECT c.nome, count(*) quantidade_vendida FROM categoria c, cliente_produto cp, produto p WHERE c.id = p.categoria_fk AND p.id = cp.produto_fk GROUP BY c.id
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--NOME DO PRODUTO E QUANTIDADE DE UNIDADES VENDIDAS PARA CLIENTE DE MG
SELECT p.nome, count(*) FROM cliente_produto cp, produto p, cliente c WHERE cp.produto_fk = p.id AND cp.cliente_fk = c.id AND c.uf = 'MG' GROUP BY p.nome

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--CATEGORIA DE PRODUTOS QUE NUNCA FORAM VENDIDAS PARA CLIENTES DE MG
SELECT * FROM categoria WHERE id NOT IN
(SELECT DISTINCT ca.id FROM cliente_produto cp, cliente cl, produto pr, categoria ca WHERE 
cp.produto_fk = pr.id AND cp.cliente_fk = cl.id AND ca.id = pr.categoria_fk AND cl.uf = 'MG')

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--CLIENTES QUE NUNCA COMPRARAM PRODUTOS DA CATEGORIA LIVROS
SELECT * FROM cliente WHERE id NOT IN
(SELECT DISTINCT cliente_fk FROM cliente_produto cp, produto pr, categoria ca WHERE 
cp.produto_fk = pr.id AND ca.id = pr.categoria_fk AND ca.nome = 'Livros')

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--PRODUTOS QUE NUNCA FORAM COMPRADOS
SELECT * FROM

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--CATEGORIAS QUE NAO POSSUEM PRODUTOS
SELECT * FROM



