﻿--CREATE TABLE cliente(
--	id BIGSERIAL NOT NULL,
--	nome VARCHAR (255) NOT NULL,
--	telefone VARCHAR(20)NOT NULL,
--	PRIMARY KEY (id)
--);

--CREATE OR REPLACE FUNCTION atualizar_telefone() RETURNS trigger AS $$
--	DECLARE
--		ddd VARCHAR(3);
--	BEGIN
--		ddd = '035';
--		UPDATE cliente SET telefone = ddd || ' ' || NEW.telefone 
--		WHERE id = NEW.id;
--		RETURN NEW;
--	END;
--$$ LANGUAGE plpgsql;
--
--CREATE TRIGGER trigger_atualizar_telefone AFTER INSERT ON cliente
--FOR EACH ROW EXECUTE PROCEDURE atualizar_telefone();