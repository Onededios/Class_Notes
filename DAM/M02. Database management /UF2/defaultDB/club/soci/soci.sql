\echo ---------- taula soci

CREATE TABLE soci (
	passaport TEXT PRIMARY KEY REFERENCES persona(passaport),
	alta TIMESTAMP WITH TIME ZONE
);