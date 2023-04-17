\echo ---------- taula treballador

CREATE DOMAIN domini_departament TEXT
	CHECK (VALUE IN ('administració','comercial','entrenador'));

CREATE TABLE treballador (
	passaport TEXT PRIMARY KEY REFERENCES persona(passaport),
	departament domini_departament,
	obeeix TEXT REFERENCES treballador(passaport)
);