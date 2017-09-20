--1 adicionar telefone e nome na tabela cliente
ALTER TABLE cliente ADD telefone INT;
ALTER TABLE cliente ADD nome VARCHAR(50);

--2 inserir um cliente pessoa fisica
INSERT INTO cliente (id, email, senha, telefone, nome) VALUES (1,'evertonferreira_srs@hotmail.com', '123456', 999203483, 'Everton');
INSERT INTO pessoa_fisica(cliente_fk, cpf) VALUES (1,'123.456.789-98');
RETURNING id; -- insere e retorna id do cliente

--3 inserir um cliente pessoa juridica
INSERT INTO cliente (id, email, senha, telefone, nome) VALUES (2,'everton-tom@hotmail.com', '123456', 999203483, 'Everton');
INSERT INTO pessoa_juridica(cliente_fk, cnpj) VALUES (2, '123456789/0001-32');
RETURNING id; -- insere e retorna id do cliente

--4 adicionar um valor default true para o campo ativo da tebela produto
ALTER TABLE produto ALTER COLUMN ativo SET DEFAULT true;

--5 altere o status de todos os produtos para true
UPDATE produto SET ativo = true;

--6 adicione 2 dias de prazo de entrega dos produtos com preço maior que 40
UPDATE produto SET prazo_entrega = prazo_entrega + 2 WHERE preco > 40;

--7 exclua todos os status
DELETE FROM status;

--8 adicionar a data e hora atual como valor default do camp data_hora da tabela pedido
ALTER TABLE pedido ALTER COLUMN data_hora SET DEFAULT now(); -- ao invez de now CURRENT_DATE

--9 mude o campo telefone da tabela cliente para multivalorado, sem perder os telefones que ja foram cadastrados
CREATE TABLE telefone (
	cliente_fk BIGINT NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	PRIMARY KEY (cliente_fk, telefone)
);

ALTER TABLE telefone ADD CONSTRAINT telefone_cliente_fk FOREIGN KEY (cliente_fk) REFERENCES cliente(id) ON UPDATE CASCADE ON DELETE CASCADE;

INSERT INTO telefone(cliente_fk, telefone) SELECT id, telefone FROM cliente;

ALTER TABLE cliente DROP COLUMN telefone;








