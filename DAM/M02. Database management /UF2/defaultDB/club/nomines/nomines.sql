\echo ---------- taula nomines

CREATE TABLE nomines (
	passaport TEXT REFERENCES treballador,
	periode TEXT,
	sou_base DECIMAL(6,2),
	retencio DECIMAL (4,2) DEFAULT 2.0,
	PRIMARY KEY(passaport,periode)
);