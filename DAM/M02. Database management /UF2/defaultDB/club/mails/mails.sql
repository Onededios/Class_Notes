\echo ---------- taula mails

CREATE DOMAIN domini_mail TEXT
	CHECK (VALUE LIKE '%_@%_.%__');

CREATE TABLE mails (
	passaport TEXT NOT NULL REFERENCES persona(passaport),
	mail domini_mail NOT NULL,
	CONSTRAINT mail_ja_assignat UNIQUE(passaport,mail)
);