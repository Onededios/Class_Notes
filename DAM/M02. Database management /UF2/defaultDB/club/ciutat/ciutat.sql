\echo ---------- taula ciutat

CREATE TABLE ciutat (
	ciutat TEXT PRIMARY KEY,
	habitants INTEGER,
	costanera BOOLEAN,
	comarca TEXT REFERENCES comarca
		ON DELETE SET NULL
		ON UPDATE CASCADE
);