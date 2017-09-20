--CREATE OR REPLACE FUNCTION somar(v1 bigint, v2 bigint)
--RETURNS bigint AS
--$$
--DECLARE
--	r bigint;
--BEGIN
--	r = v1 + v2;
--	return r;
--END;
--$$
--LANGUAGE plpgsql;

--SELECT somar (1,4);

------------------------------------------------------------------------------------------------------------------------- 
--CREATE OR REPLACE FUNCTION getCategoriaNome(inId integer)
--RETURNS VARCHAR(150) AS
--$$
--DECLARE
--	outNome VARCHAR(150);
--BEGIN
--	SELECT nome INTO outNome FROM categoria WHERE id =  inId;
--	IF outNome IS NULL THEN
--		RAISE EXCEPTION 'Categoria de id: % nao encontrado', inId;
--	END IF;	
--	RETURN outNome;
--END;
--$$
--LANGUAGE plpgsql;

--SELECT getCategoriaNome(3);

--------------------------------------------------------------------------------------------------------------------------
--CREATE OR REPLACE FUNCTION readCategoria()
--RETURNS SETOF categoria AS
--$$
--DECLARE
--	outCategoria categoria%ROWTYPE;
--BEGIN
--	FOR outCategoria IN SELECT * FROM categoria ORDER BY nome
--	LOOP
--		RETURN NEXT outCategoria;
--	END LOOP;
--	RETURN;
--END;
--$$
--LANGUAGE plpgsql;

--SELECT readCategoria();
-------------------------------------------------------------------------------------------------------------------------











