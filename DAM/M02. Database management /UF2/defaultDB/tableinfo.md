club=# \d+ ciutat;
                                           Table "public.ciutat"
  Column   |  Type   | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
-----------+---------+-----------+----------+---------+----------+-------------+--------------+-------------
 ciutat    | text    |           | not null |         | extended |             |              | 
 habitants | integer |           |          |         | plain    |             |              | 
 costanera | boolean |           |          |         | plain    |             |              | 
 comarca   | text    |           |          |         | extended |             |              | 
Indexes:
    "ciutat_pkey" PRIMARY KEY, btree (ciutat)
Foreign-key constraints:
    "ciutat_comarca_fkey" FOREIGN KEY (comarca) REFERENCES comarca(comarca) ON UPDATE CASCADE ON DELETE SET NULL
Referenced by:
    TABLE "persona" CONSTRAINT "persona_ciutat_fkey" FOREIGN KEY (ciutat) REFERENCES ciutat(ciutat) ON UPDATE CASCADE ON DELETE SET NULL
Access method: heap

club=# \d+ comarca
                                        Table "public.comarca"
 Column  | Type | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
---------+------+-----------+----------+---------+----------+-------------+--------------+-------------
 comarca | text |           | not null |         | extended |             |              | 
Indexes:
    "comarca_repetida" PRIMARY KEY, btree (comarca)
Referenced by:
    TABLE "ciutat" CONSTRAINT "ciutat_comarca_fkey" FOREIGN KEY (comarca) REFERENCES comarca(comarca) ON UPDATE CASCADE ON DELETE SET NULL
Access method: heap

club=# \d+ comarca
                                        Table "public.comarca"
 Column  | Type | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
---------+------+-----------+----------+---------+----------+-------------+--------------+-------------
 comarca | text |           | not null |         | extended |             |              | 
Indexes:
    "comarca_repetida" PRIMARY KEY, btree (comarca)
Referenced by:
    TABLE "ciutat" CONSTRAINT "ciutat_comarca_fkey" FOREIGN KEY (comarca) REFERENCES comarca(comarca) ON UPDATE CASCADE ON DELETE SET NULL
Access method: heap

club=# \d+ coneix
                                           Table "public.coneix"
   Column    | Type | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
-------------+------+-----------+----------+---------+----------+-------------+--------------+-------------
 coneix      | text |           | not null |         | extended |             |              | 
 es_coneguda | text |           | not null |         | extended |             |              | 
Indexes:
    "coneix_coneix_es_coneguda_key" UNIQUE CONSTRAINT, btree (coneix, es_coneguda)
Foreign-key constraints:
    "coneix_coneix_fkey" FOREIGN KEY (coneix) REFERENCES persona(passaport)
    "coneix_es_coneguda_fkey" FOREIGN KEY (es_coneguda) REFERENCES persona(passaport)
Access method: heap

club=# \d+ esport
                                             Table "public.esport"
  Column  |     Type     | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
----------+--------------+-----------+----------+---------+----------+-------------+--------------+-------------
 esport   | text         |           | not null |         | extended |             |              | 
 preu     | numeric(5,2) |           |          | 10.0    | main     |             |              | 
 jugadors | integer      |           |          |         | plain    |             |              | 
Indexes:
    "esport_pkey" PRIMARY KEY, btree (esport)
Referenced by:
    TABLE "fa" CONSTRAINT "fa_esport_fkey" FOREIGN KEY (esport) REFERENCES esport(esport)
Access method: heap

club=# \d+ fa
                                                Table "public.fa"
  Column   |     Type     | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
-----------+--------------+-----------+----------+---------+----------+-------------+--------------+-------------
 passaport | text         |           |          |         | extended |             |              | 
 esport    | text         |           |          |         | extended |             |              | 
 quota     | numeric(5,2) |           |          |         | main     |             |              | 
Indexes:
    "fa_passaport_esport_key" UNIQUE CONSTRAINT, btree (passaport, esport)
Foreign-key constraints:
    "fa_esport_fkey" FOREIGN KEY (esport) REFERENCES esport(esport)
    "fa_passaport_fkey" FOREIGN KEY (passaport) REFERENCES soci(passaport)
Access method: heap

club=# \d+ mails
                                              Table "public.mails"
  Column   |    Type     | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
-----------+-------------+-----------+----------+---------+----------+-------------+--------------+-------------
 passaport | text        |           | not null |         | extended |             |              | 
 mail      | domini_mail |           | not null |         | extended |             |              | 
Indexes:
    "mail_ja_assignat" UNIQUE CONSTRAINT, btree (passaport, mail)
Foreign-key constraints:
    "mails_passaport_fkey" FOREIGN KEY (passaport) REFERENCES persona(passaport)
Access method: heap

club=# \d+ nomines
                                             Table "public.nomines"
  Column   |     Type     | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
-----------+--------------+-----------+----------+---------+----------+-------------+--------------+-------------
 passaport | text         |           | not null |         | extended |             |              | 
 periode   | date         |           | not null |         | plain    |             |              | 
 sou_base  | numeric(6,2) |           |          |         | main     |             |              | 
 retencio  | numeric(4,2) |           |          | 2.0     | main     |             |              | 
Indexes:
    "nomines_pkey" PRIMARY KEY, btree (passaport, periode)
Foreign-key constraints:
    "nomines_passaport_fkey" FOREIGN KEY (passaport) REFERENCES treballador(passaport)
Access method: heap

club=# \d+ pagament_soci 
                          View "public.pagament_soci"
  Column   |  Type   | Collation | Nullable | Default | Storage  | Description 
-----------+---------+-----------+----------+---------+----------+-------------
 passaport | text    |           |          |         | extended | 
 nom       | text    |           |          |         | extended | 
 cognom    | text    |           |          |         | extended | 
 pagament  | numeric |           |          |         | main     | 
View definition:
 SELECT p.passaport,
    p.nom,
    p.cognom,
    sum(f.quota) AS pagament
   FROM persona p,
    fa f
  WHERE p.passaport = f.passaport
  GROUP BY p.passaport, p.nom, p.cognom
  ORDER BY p.cognom;

club=# \d+ persona
                                         Table "public.persona"
  Column   | Type | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
-----------+------+-----------+----------+---------+----------+-------------+--------------+-------------
 passaport | text |           | not null |         | extended |             |              | 
 nom       | text |           | not null |         | extended |             |              | 
 cognom    | text |           | not null |         | extended |             |              | 
 ciutat    | text |           |          |         | extended |             |              | 
Indexes:
    "persona_pkey" PRIMARY KEY, btree (passaport)
Foreign-key constraints:
    "persona_ciutat_fkey" FOREIGN KEY (ciutat) REFERENCES ciutat(ciutat) ON UPDATE CASCADE ON DELETE SET NULL
Referenced by:
    TABLE "coneix" CONSTRAINT "coneix_coneix_fkey" FOREIGN KEY (coneix) REFERENCES persona(passaport)
    TABLE "coneix" CONSTRAINT "coneix_es_coneguda_fkey" FOREIGN KEY (es_coneguda) REFERENCES persona(passaport)
    TABLE "mails" CONSTRAINT "mails_passaport_fkey" FOREIGN KEY (passaport) REFERENCES persona(passaport)
    TABLE "soci" CONSTRAINT "soci_passaport_fkey" FOREIGN KEY (passaport) REFERENCES persona(passaport)
    TABLE "treballador" CONSTRAINT "treballador_passaport_fkey" FOREIGN KEY (passaport) REFERENCES persona(passaport)
Access method: heap

club=# \d+ soci
                                                     Table "public.soci"
  Column   |           Type           | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
-----------+--------------------------+-----------+----------+---------+----------+-------------+--------------+-------------
 passaport | text                     |           | not null |         | extended |             |              | 
 alta      | timestamp with time zone |           |          |         | plain    |             |              | 
Indexes:
    "soci_pkey" PRIMARY KEY, btree (passaport)
Foreign-key constraints:
    "soci_passaport_fkey" FOREIGN KEY (passaport) REFERENCES persona(passaport)
Referenced by:
    TABLE "fa" CONSTRAINT "fa_passaport_fkey" FOREIGN KEY (passaport) REFERENCES soci(passaport)
Access method: heap

club=# \d+ treballador
                                               Table "public.treballador"
   Column    |        Type        | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
-------------+--------------------+-----------+----------+---------+----------+-------------+--------------+-------------
 passaport   | text               |           | not null |         | extended |             |              | 
 departament | domini_departament |           |          |         | extended |             |              | 
 obeeix      | text               |           |          |         | extended |             |              | 
Indexes:
    "treballador_pkey" PRIMARY KEY, btree (passaport)
Foreign-key constraints:
    "treballador_obeeix_fkey" FOREIGN KEY (obeeix) REFERENCES treballador(passaport)
    "treballador_passaport_fkey" FOREIGN KEY (passaport) REFERENCES persona(passaport)
Referenced by:
    TABLE "nomines" CONSTRAINT "nomines_passaport_fkey" FOREIGN KEY (passaport) REFERENCES treballador(passaport)
    TABLE "treballador" CONSTRAINT "treballador_obeeix_fkey" FOREIGN KEY (obeeix) REFERENCES treballador(passaport)
Access method: heap
