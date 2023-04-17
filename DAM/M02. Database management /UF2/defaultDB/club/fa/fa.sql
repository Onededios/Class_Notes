\echo ---------- taula fa

CREATE TABLE fa (
	passaport TEXT REFERENCES soci(passaport),
	esport TEXT REFERENCES esport(esport),
	quota DECIMAL(5,2),
	UNIQUE(passaport,esport)
);