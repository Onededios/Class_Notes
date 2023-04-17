\echo ---------- taula esport

CREATE TABLE esport (
	esport TEXT PRIMARY KEY,
	preu DECIMAL(5,2) DEFAULT 10.0,
	jugadors INTEGER
);