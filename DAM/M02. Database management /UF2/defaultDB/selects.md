Irina Shidou# Consultas SQL

## Mostra totes les dades de totes les persones

```sql
select * from persona;
```

## Fer la llista de les ciutats de les persones de la base de dades, SENSE REPETITS

```sql
select distinct on (ciutat)ciutat from persona;
select distinct ciutat from persona;
select ciutat from persona group by ciutat order by ciutat;
```

## 3. Experiment amb FROM. Una mica de 'teoria'

### 3.a) Crear una taula t, amb un sol atribut que es digui n i sigui un enter

```sql
CREATE TABLE t(n INTEGER); 
```

### 3.b) Inserir un nombre qualsevol a la taula t

```sql
INSERT INTO t VALUES(314);
```

### 3.c) Mostrar el nom de totes les comarques afegint innecessàriament la taula t en la clàusula FROM

```sql
SELECT comarca FROM comarca, t; 
```

### 3.d) Quants resultats treus?

```sql
club=# select comarca from comarca, t;
comarca

Barcelonès
Alt Empordà
Baix Llobregat
Val d'Aran
Osona
Garraf
Segrià
Montsià
Maresme
Tarragonès
(10 rows)
```

### 3.e) Inserir un nou nombre a la taula t, com en el pas 3.b)

```sql
insert into t values(123);
```

### 3.f) Mostrar de nou el nom de totes les comarques afegint innecessàriament la taula t en la clàusula FROM

```sql
club=# select comarca from comarca, t;
comarca

Barcelonès
Alt Empordà
Baix Llobregat
Val d'Aran
Osona
Garraf
Segrià
Montsià
Maresme
Tarragonès
Barcelonès
Alt Empordà
Baix Llobregat
Val d'Aran
Osona
Garraf
Segrià
Montsià
Maresme
Tarragonès
(20 rows)
```

### 3.g) Explica el resultat que obtens

Obtenemos el doble de resultados, ya que pivota 2 veces sobre la tabla t para acceder a los valores de comarca. (como t tiene 2 valores, saca 20 valores de la tabla comarca)

### 3.h) Eliminar la taula t de la teva base de dades (DROP)

```sql
drop table t;
```

## 4) Obtenir totes les combinacions possibles de ciutats i comarques

```sql
select * from ciutat, comarca;
```

## 5) RENOMENAMENT: De vegades, un mateix nom a un atribut de dues taules diferents ens pot portar problemes

### 5.a) Prova de fer aquesta consulta

```sql
SELECT comarca from ciutat, comarca;
```

### 5.b) Quin error et dona? Per què?

```sql
ERROR: column reference "comarca" is ambiguous LINE 1: select comarca from ciutat, comarca;
```

Porque las dos tablas tienen el mismo nombre de atributo y es ambiguo.

### 5.c) Els sistemes gestors porten mecanismes per renombrar camps o taules, tant per la sortida de la consulta com per especificar la taula que ens proveeix les dades

Per exemple ciutat.comarca faria referencia explícita a l'atribut 'comarca' de la taula 'ciutat'

```sql
club=# select ciutat.comarca from ciutat;
comarca

Alt Empordà
Barcelonès

Baix Llobregat

Segrià

Garraf
Osona
Maresme
Maresme
Baix Llobregat

Val d'Aran
Barcelonès
Baix Llobregat

Alt Empordà
Montsià
(21 rows)
```

Si fem select ciutat.comarca AS comarques, estaríem renombrant la sortida del SELECT a 'comarques'

```sql
club=# select ciutat.comarca as comarques; ERROR: missing FROM-clause entry for table "ciutat" LINE 1: select ciutat.comarca as comarques;
```

Ara sí, prova de fer la consulta 5.a amb renombrant i esquivant l'error ;)

```sql
club=# select ciutat.comarca as comarques from ciutat;
comarques

Alt Empordà
Barcelonès

Baix Llobregat

Segrià

Garraf
Osona
Maresme
Maresme
Baix Llobregat

Val d'Aran
Barcelonès
Baix Llobregat

Alt Empordà
Montsià
(21 rows)
```

## 6) RENOMBRAMENTS II: Executa aquesta consulta i explica què estàs fent

SELECT c.pepito FROM ciutat c(x,x,x,pepito), comarca

```sql
club=# select c.pepito from ciutat c(x,x,x,pepito), comarca;
pepito

Alt Empordà
Barcelonès

Baix Llobregat

Segrià

Garraf
Osona
Maresme
Maresme
Baix Llobregat

Val d'Aran
Barcelonès
Baix Llobregat
```

## 7) Noms del les persones de Cadaqués

```sql
club=# select nom from persona where ciutat='Cadaqués';
nom

Carme
(1 row)
```

## 8) Nom de les persones de la comarca del Barcelonès (OJO! amb la clau forana!)

```sql
club=# select nom from persona,ciutat where comarca='Barcelonès' and persona.ciutat=ciutat.ciutat;
nom

Carles
Anna
Sònia
Pere
Pere
Maria
Jordi
Mireia
(8 rows)
```

## 9) A qui coneix la Carme Peralta?

\[Resposta: Carles, Anna, Klauss\]

```sql
club=# select nom, cognom from persona where passaport in (select es_coneguda from coneix where coneix in (select passaport from persona where nom='Carme' and cognom='Peralta'));
  nom   |  cognom  
--------+----------
 Klauss | Stallman
 Anna   | Sanàbria
 Carles | Sanàbria
(3 rows)
```

---

### INTRODUÏM FUNCIONS D'AGREGACIÓ

\[COUNT(), MIN(), MAX(), SUM(), AVG(),GROUP BY, HAVING\]

## 10) Quantes persones hi ha a la base de dades?

```sql
club=# select count(passaport) as TotalPersones from persona;
 totalpersones 
---------------
            31
(1 row)
```

## 11) De quantes comarques hi ha persones a la base de dades?

```sql
club=# select count(distinct comarca) as totalcomarques from ciutat, persona where persona.ciutat=ciutat.ciutat;
 totalcomarques 
----------------
              8
(1 row)
```

## 12) Quina és la primera ciutat d'aquelles en què hi viu alguna persona de la base de dades, per ordre alfabètic?

```sql
club=# select MIN(ciutat) as primeraciutat from persona;
 primeraciutat 
---------------
 Amposta
(1 row)
```

o

```sql
club=# select ciutat from persona ORDER BY ciutat LIMIT 1;
 ciutat  
---------
 Amposta
(1 row)
```

### 12.a) Las 3 últimas

```sql
club=# select ciutat from persona where ciutat is not null order by ciutat desc limit 3;
   ciutat   
------------
 Viladecans
 Tredòs
 Tona
(3 rows)
```

## 13) Quants habitants hi ha entre totes les ciutats de la base de dades?

```sql
club=# select sum(habitants) from ciutat;
   sum    
----------
 37469270
(1 row)
```

### 13.1) Quants habitants hi ha entre totes les ciutats de menys de 10.000 habitants

```sql
club=# select sum(habitants) from ciutat where habitants < 10000;
  sum  
-------
 19409
(1 row)
```

### 13.2) Quants habitants hi ha entre totes les ciutats que comencin per "B"

```sql
club=# select sum(habitants) from ciutat where ciutat like 'B%';
   sum   
---------
 5331409
(1 row)
```

### 13.3) Quants habitants hi ha entre totes les ciutats que comencin per "A" i siguin costeres

```sql
club=# select sum(habitants) from ciutat where ciutat like 'A%' and costanera='t';
  sum   
--------
 685557
(1 row)
```

## 14) Quin és el sou mitjà dels treballadors del club esportiu el mes de desembre del 2014? (Pots fer servir BETWEEN)

```sql
club=# select avg(sou_base) from nomines where periode like '%/12/2014';
          avg          
-----------------------
 1283.3009090909090909
(1 row)
```

O

```sql
club=# select avg(sou_base) from nomines where periode between '2014-12-01' and '2014-12-31';
          avg          
-----------------------
 1283.3009090909090909
(1 row)
```

UPDATE QUOTES ABANS DE CONTINUAR! Revisa l'estructura de la taula FA  (\d fa)

### 14.1) Afegir l'esport 'tennis-dobles' i incloure-hi a dos jugadors a la taula fa

```sql
club=# update fa set quota=18.35 where esport='natació';
club=# insert into esport (esport,preu) values ('tennis dobles',21.5);
club=# insert into fa values ('27673812M','tennis dobles', 21.5);
INSERT 0 1
club=# insert into fa values ('47548338K','tennis dobles', 21.5);
INSERT 0 1
```

### 14.2) Actualitza els habitants de montgat

```sql
club=# update ciutat set habitants=12277 where ciutat='Montgat';
UPDATE 1
```

### 14.3) Actualitza el tipus de dades de nomines/periode de text a date

```sql
club=# alter table nomines alter periode type date using periode::date;
ALTER TABLE
```

## 15 ) Quin guany mensual es té en el club esportiu? (Total d'ingressos de quotes)

```sql
club=# select sum(quota) from fa;
  sum   
--------
 637.45
(1 row)
```

## 16) Quin guany mensual es té en el club esportiu per cada esport?

```sql
club=# select sum(quota),esport from fa group by esport;
  sum   |    esport     
--------+---------------
  72.50 | voleibol
  43.00 | bàsquet
  67.80 | vela
  43.00 | tennis dobles
  92.40 | futbol
  86.00 | tennis
  24.15 | golf
 146.80 | natació
  61.80 | ping-pong
(9 rows)
```

## 17) Quines comarques tenen més de 100000 habitants?

```sql
club=# select comarca, sum(habitants) from ciutat where comarca is not null group by comarca having sum(habitants)>100000;
    comarca     |   sum   
----------------+---------
 Baix Llobregat |  176188
 Barcelonès     | 1832530
 Segrià         |  139809
(3 rows)
```

## 18) Entre totes les ciutats de la BD, hi ha més d'un milió d'habitants? [Fer la consulta amb HAVING: si retorna 0 rows es FALSE i 1 o + és TRUE]

```sql
club=# select sum(habitants) from ciutat having sum(habitants) > 1000000;
   sum    
----------
 37481536
(1 row)
```

## 19) Nom de les ciutats ordenades pel nombre d'habitants

```sql
club=# select comarca,sum(habitants) from ciutat where comarca is not null group by comarca order by sum(habitants);
    comarca     |   sum   
----------------+---------
 martelones     |       2
 Val d'Aran     |     154
 Maresme        |   20498
 Montsià        |   21511
 Alt Empordà    |   22829
 Garraf         |   29140
 Segrià         |  139809
 Baix Llobregat |  176188
 Barcelonès     | 1832530
(9 rows)
```

## 20) Nom de les 5 primeres ciutats ordenades pel nombre d'habitants (fes servir la clàusula LIMIT)

```sql
club=# select comarca,sum(habitants) from ciutat group by comarca order by sum limit 5;
   comarca   |  sum  
-------------+-------
 Val d'Aran  |   154
 Osona       |  8085
 Maresme     | 20498
 Montsià     | 21511
 Alt Empordà | 22829
(5 rows)
```

Consulta amb totes les clàusules: COUNT, GROUP BY, HAVING COUNT i ORDER BY.

## 21) Nom dels esports i la quantitat de socis  que els practiquen, per als esports que practiquin més de 3 socis i que es juguin en solitari, ordenats per nombre de socis

```sql
club=# select fa.esport,count(fa.passaport) as socis from fa,esport where fa.esport=esport.esport and esport.jugadors=1 group by fa.esport having count(fa.passaport)>3 order by socis;
  esport   | socis 
-----------+-------
 tennis    |     4
 ping-pong |     6
 natació   |     8
(3 rows)
```

o

```sql
club=# select fa.esport,count(fa.passaport) as socis from fa natural join esport where esport.jugadors=1 group by fa.esport having count(fa.passaport)>3 order by socis;
  esport   | socis 
-----------+-------
 tennis    |     4
 ping-pong |     6
 natació   |     8
(3 rows)
```

Fent servir SELECTS per dates i hores

## 22) Quant sumen 2+3 i quant multipliquen?

```sql
club=# select 2+3 as suma, 2*3 as mult;
 suma | mult 
------+------
    5 |    6
(1 row)
```

## 23) Lo mateix que 22) però renombrant la primera columna com 'suma' i la segona com 'producte'

```sql
club=# select 2+3 as suma, 2*3 as producte;
 suma | producte 
------+----------
    5 |        6
(1 row)
```

## 24) Quina hora es?

```sql
club=# select current_time;
    current_time    
--------------------
 18:28:23.216015+00
(1 row)
```

o

```sql
club=# select now();
              now              
-------------------------------
 2023-01-27 18:29:09.592032+00
(1 row)
```

## 25) Quants dies has viscut?

```sql
club=# select current_date - '25.10.2001' as diasVivo;
 diasvivo 
----------
     7764
(1 row)
```

CONSULTES D'ACTUALITZACIÓ

## 26) Inserir un nou esport:'Atletisme', amb un jugador per equip

```sql
club=# insert into esport (esport,preu,jugadors) values ('atletisme',10.00,1);
INSERT 0 1
```

### 26.1) Com poder crear una vista?

```sql
club=# CREATE VIEW pagament_soci AS SELECT p.passaport, p.nom,p.cognom, SUM(f.quota) AS pagament FROM persona p, fa f WHERE p.passaport = f.passaport GROUP BY p.passaport,p.nom,p.cognom ORDER BY p.cognom;
CREATE VIEW
```

### 26.2) Com podem esbrinar si una BD conté vistes?  [Cerca a la documentació de Postgresql]

```sql
club-# \dv
            List of relations
 Schema |     Name      | Type |  Owner   
--------+---------------+------+----------
 public | pagament_soci | view | postgres
(1 row)
```

## 27) Explica què estàs fent amb aquesta consulta

INSERT INTO fa ( SELECT passaport,'atletisme',0.0 FROM pagaments_soci ORDER BY pagaments_soci DESC LIMIT 5);

```sql
club=# select * from fa LIMIT 5;
 passaport | esport  | quota 
-----------+---------+-------
 27673812M | natació | 18.35
 X3478937A | natació | 18.35
 39238229E | natació | 18.35
 46372382N | natació | 18.35
 59119283Z | natació | 18.35
(5 rows)
```

```sql
club=# INSERT INTO fa ( SELECT passaport,'atletisme',0.0 FROM pagament_soci ORDER BY pagament_soci DESC LIMIT 5);
INSERT 0 5
```

```sql
club=# select * from fa;
 passaport |    esport     | quota 
-----------+---------------+-------
 X3478937A | atletisme     |   0.00
 C01X01TN  | atletisme     |   0.00
 C00001549 | atletisme     |   0.00
 59119283Z | atletisme     |   0.00
 47548338K | atletisme     |   0.00
```

A los 5 primeros socios que más paguen de cuota, le regalamos una quota de atletismo.

## 28) Augmentar un 10% la quota del tennis als socis (x1.10)

```sql
club=# select * from fa where esport='tennis';
 passaport | esport | quota 
-----------+--------+-------
 47548338K | tennis | 23.65
 38474483Z | tennis | 23.65
 19891898A | tennis | 23.65
 42065765F | tennis | 23.65
(4 rows)
club=# select * from esport;
    esport     | preu  | jugadors 
---------------+-------+----------
 natació       | 18.35 |        1
 tennis        | 25.50 |        1
 voleibol      | 21.50 |        6
 ping-pong     | 12.50 |        1
 bàsquet       | 10.15 |        5
 futbol        |  8.60 |       11
 handbol       | 12.55 |        7
 golf          | 27.90 |        1
 vela          | 30.85 |        2
 tennis dobles | 21.50 |        2
 atletisme     | 10.00 |        1
(11 rows)

club=# update esport set preu=preu*1.1 where esport='tennis';
UPDATE 1
club=# select * from esport where esport='tennis';
 esport | preu  | jugadors 
--------+-------+----------
 tennis | 28.05 |        1
(1 row)
```

## 29) Nomenar nova cap d'entrenadors a Helena Pérez

```sql
club=# update treballador set obeeix=(select passaport from persona where nom='Helena' AND cognom='Pérez') where departament='entrenador';
UPDATE 3
club=# select * from treballador;
 passaport |  departament  |  obeeix   
-----------+---------------+-----------
 Y4394950D | administració | 
 37228901C | administració | Y4394950D
 29874567M | administració | Y4394950D
 05CK02337 | administració | Y4394950D
 C00021549 | administració | 05CK02337
 36940559Y | comercial     | 
 38223890Y | comercial     | 36940559Y
 51234329N | comercial     | 36940559Y
 45847558W | administració | 05CK02337
 48377283A | administració | 37228901C
 37866969E | comercial     | 36940559Y
 27827228B | entrenador    | Y4394950D
 X4534332C | entrenador    | Y4394950D
 Y3439185D | entrenador    | Y4394950D
(14 rows)
```

## 30) Esborreu les comarques que comencin amb la lletra O

```sql
club=# delete from comarca where comarca like 'O%';
DELETE 1
```

## 31) Donar de baixa la ciutat d'en Klauss Stallman

```sql
club=# select * from persona where nom='Klauss' and cognom='Stallman';
 passaport |  nom   |  cognom  | ciutat 
-----------+--------+----------+--------
 294394950 | Klauss | Stallman | Berlín
(1 row)

club=# delete from ciutat where ciutat=(select ciutat from persona where nom='Klauss' and cognom='Stallman');
DELETE 1

club=# select * from persona where nom='Klauss' and cognom='Stallman';
 passaport |  nom   |  cognom  | ciutat 
-----------+--------+----------+--------
 294394950 | Klauss | Stallman | 
(1 row)
```

### 31.1) Mostra passaport, nom i cognom dels empleats amb sou més alt dels departaments de comercial o entrenadors

```sql
club=# select passaport,nom,cognom from persona where passaport in (select passaport from nomines where sou_base in (select max(sou_base) from nomines where passaport in (select passaport from treballador where departament='comercial' or departament='entrenador')));
 passaport |  nom  | cognom 
-----------+-------+--------
 Y3439185D | Boris | Santos
(1 row)
```

### 31.2) Mostra el passaport, nom i cognom de les persones que estiguin apuntades a futból i básquet

```sql
club=# select * from persona where passaport in (select passaport from fa where esport='futbol') and passaport in (select passaport from fa where esport='bàsquet');
 passaport |  nom   |  cognom  | ciutat 
-----------+--------+----------+--------
 294394950 | Klauss | Stallman | 
 187448338 | Rita   | Derbeken | 
(2 rows)
```

o

```sql
club=# select fa.passaport,nom,cognom from fa,persona where persona.passaport=fa.passaport and esport='futbol' and fa.passaport in (select passaport from fa where esport='bàsquet');
 passaport |  nom   |  cognom  
-----------+--------+----------
 294394950 | Klauss | Stallman
 187448338 | Rita   | Derbeken
(2 rows)
```

o

```sql
club=# select fa.passaport,nom,cognom from persona,fa where persona.passaport=fa.passaport and esport='futbol' intersect select fa.passaport,nom,cognom from persona,fa where persona.passaport=fa.passaport and esport='bàsquet';
 passaport |  nom   |  cognom  
-----------+--------+----------
 294394950 | Klauss | Stallman
 187448338 | Rita   | Derbeken
(2 rows)
```

Unions, diferències i interseccions de conjunts. Potser és un bon moment per recuperar els apunts de fa un mes ;)

Sintaxi UNION:

SELECT A1,A2 ... FROM r WHERE p UNION SELECT B1,B2.. FROM s WHERE q;

Sent els esquems A1, A2... i B1,B2.. COMPATIBLES

Anem a practicar el UNION!

### 31.1) Mostra el nom y cognom de totes les persones que viuen a Amposta o Cadaqués

```sql
club=# select nom,cognom from persona where ciutat='Amposta' union select nom,cognom from persona where ciutat='Cadaqués';
  nom  | cognom  
-------+---------
 Carme | Ferrer
 Carme | Peralta
(2 rows)
```

### 31.2) Mostra el nom de totes les persones que viuen a Amposta o Cadaqués

Las union juntan los datos que son iguales, por lo que es mejor usar union all cuando pueda haber varios resultados iguales

```sql
club=# select nom from persona where ciutat='Amposta' union all select nom from persona where ciutat='Cadaqués';
  nom  
-------
 Carme
 Carme
(2 rows)
```

## 32) Quins ingressos o despeses (soci - treballador) ha suposat pel club cada persona el novembre del 2014?

```sql
club=# select *,'soci' as vincle from pagament_soci union select nomines.passaport,persona.nom,persona.cognom,sou_base*(-1),'treballador' from nomines,persona where persona.passaport=nomines.passaport and periode between '2014-11-01' and '2014-12-01';
 passaport |    nom    |  cognom  | pagament |   vincle    
-----------+-----------+----------+----------+-------------
 45847558W | José      | González |  -708.10 | treballador
 38223890Y | Jordi     | Parmalat | -1102.43 | treballador
 27673812M | Carme     | Peralta  |    65.55 | soci
 38474483Z | Miquel    | Vila     |    54.85 | soci
 37866969E | Carme     | Ferrer   | -1094.07 | treballador
 27961020N | Pere      | Garcia   |    32.85 | soci
 47548338K | Anna      | Sanàbria |    77.90 | soci
 59119283Z | Pere      | Camprubí |    32.85 | soci
 C00021549 | Mick      | Brown    |  -915.35 | treballador
 C01X01TN  | Roberto   | Rietto   |    28.65 | soci
 46372382N | Roser     | Puente   |    33.75 | soci
 39238229E | Sònia     | Aragall  |    33.75 | soci
 42065765F | Camila    | Noriega  |    38.15 | soci
 294394950 | Klauss    | Stallman |    24.00 | soci
 36940559Y | Magdalena | Pinós    | -1090.23 | treballador
 C00001549 | Mick      | Brown    |    31.20 | soci
 Y3439185D | Boris     | Santos   | -3752.00 | treballador
 45493393Z | Jesús     | Hortesa  |    37.10 | soci
 19891898A | Maria     | Martín   |    33.95 | soci
 29874567M | Leonardo  | Soler    | -1213.93 | treballador
 37228901C | Sebastià  | Fonollà  | -1523.42 | treballador
 187448338 | Rita      | Derbeken |    24.00 | soci
 32234958K | José      | Sanlúcar |    24.80 | soci
 38433548L | Anna      | Margalef |    28.65 | soci
 X3478937A | Carles    | Sanàbria |    44.05 | soci
 X4534332C | Gabriel   | Cobos    | -1050.30 | treballador
(26 rows)
```

## 33) Multiconjunts vs conjunts

Anem a veure un exemple pas a pas per tal d'aclarir aquesta part, veurem l'ús de UNION i UNION ALL:

### 33.1) Selecciona nom i cognom de les persones que viuen a 'Amposta' [Carme Ferrer]

```sql
club=# select nom, cognom from persona where ciutat='Amposta';
  nom  | cognom 
-------+--------
 Carme | Ferrer
(1 row)
```

### 33.2) Selecciona nom i cognom de les persones que viuen a 'Cadaqués' [ Carme Peralta]

```sql
club=# select nom, cognom from persona where ciutat='Cadaqués';
  nom  | cognom  
-------+---------
 Carme | Peralta
(1 row)
```

### 33.3) Nom i cognom de les persones que viuen a Amposta i de les persones que viuen a Cadaqués [Carme Ferrer i Carme Peralta]

```sql
club=# select nom, cognom from persona where ciutat='Amposta' union select nom, cognom from persona where ciutat='Cadaqués';
  nom  | cognom  
-------+---------
 Carme | Ferrer
 Carme | Peralta
(2 rows)
```

### 33.4) Nom de les persones que viuen a Amposta i de les persones que viuen a Cadaqués [Carme] -->només 1 resultat¿?¿?

```sql
club=# select nom from persona where ciutat='Amposta' union select nom from persona where ciutat='Cadaqués';
  nom  
-------
 Carme
(1 row)
```

### 33.5) Fent servir UNION ALL, nom de totes les persones d'Amposta i de Cadaqués [Carme, Carme] --> 2 resultats, ok

```sql
club=# select nom from persona where ciutat='Amposta' union all select nom from persona where ciutat='Cadaqués';
  nom  
-------
 Carme
 Carme
(2 rows)
```

## 34) Clàusula EXCEPT

EXCEPT = Diferència de relacions, sintaxi igual a UNION però posant EXCEPT. ojo! RETORNEM ELS ELEMENTS DEL PRIMER OPERAND (DEL PRIMER SELECT, PER ENTENDREN'S).

Exercici: Obtenir els noms i cognoms dels treballadors que no són caps de ningú, ordenats per cognom.

```sql
club=# select nom, cognom from persona where passaport in (select passaport from treballador except select passaport from treballador where obeeix is null) order by cognom;
    nom    |  cognom  
-----------+----------
 Mick      | Brown
 Gabriel   | Cobos
 Sonia     | Colmena
 Carme     | Ferrer
 Sebastià  | Fonollà
 JeanMarie | Godard
 José      | González
 Daniel    | González
 Mireia    | Matasy
 Jordi     | Parmalat
 Boris     | Santos
 Leonardo  | Soler
(12 rows)
```

## 35) Clàusula INTERSECT: Sintaxi igual a UNION i a EXCEPT. Resultat: Registres de la primera consulta que també hi són a la segona

Exercici: Quins socis practiquen futbol i bàsquet?

Aclariment: OJO! No estem preguntant quins socis practiquen futbol i quins bàsquet, el que demanem és qui practica fútbol + bàsquet, els dos alhora, ok?

```sql
club=# select nom, cognom from persona where passaport in (select passaport from fa where esport='futbol' intersect select passaport from fa where esport='bàsquet');
  nom   |  cognom  
--------+----------
 Klauss | Stallman
 Rita   | Derbeken
(2 rows)
```

Operadors de REUNIÓ (JOINS): NATURAL JOIN, NATURAL LEFT OUTER JOIN, NATURAL RIGHT OUTER JOIN, NATURAL FULL OUTER JOIN

JOIN USING, INNER JOIN ON

El Natural JOIN és la reunió interna (ara es veu l'utilitat que es diguin igual les claus primàries i les foranes entre les taules)

SELECT X1,X2,....,Xn FROM r NATURAL JOIN s WHERE p;

I la resta de sintaxis són semblants (consulta la documentació de Postgres per + info)

Exercici: Resol les següents consultes fent servir JOINS del tipus anteriors:

### 36.1) Donar totes les dades de les persones amb les ciutats on viuen

```sql
club=# select * from persona natural join ciutat;
    ciutat     | passaport |    nom    |  cognom  | habitants | costanera |    comarca     
---------------+-----------+-----------+----------+-----------+-----------+----------------
 Cadaqués      | 27673812M | Carme     | Peralta  |      2938 | t         | Alt Empordà
 Badalona      | X3478937A | Carles    | Sanàbria |    219708 | t         | Barcelonès
 Badalona      | 47548338K | Anna      | Sanàbria |    219708 | t         | Barcelonès
 Castelldefels | 45493393Z | Jesús     | Hortesa  |     63077 | t         | Baix Llobregat
 San Francisco | C00001549 | Mick      | Brown    |    805235 | t         | 
 Barcelona     | 39238229E | Sònia     | Aragall  |   1611822 | t         | Barcelonès
 Tiana         | 46372382N | Roser     | Puente   |      8221 | f         | Maresme
 Roma          | C01X01TN  | Roberto   | Rietto   |   2796102 | t         | 
 Tiana         | 38433548L | Anna      | Margalef |      8221 | f         | Maresme
 Castelldefels | 32234958K | José      | Sanlúcar |     63077 | t         | Baix Llobregat
 Tredòs        | 38474483Z | Miquel    | Vila     |       154 | f         | Val d'Aran
 Castelldefels | 42065765F | Camila    | Noriega  |     63077 | t         | Baix Llobregat
 Barcelona     | 59119283Z | Pere      | Camprubí |   1611822 | t         | Barcelonès
 Barcelona     | 27961020N | Pere      | Garcia   |   1611822 | t         | Barcelonès
 Barcelona     | 19891898A | Maria     | Martín   |   1611822 | t         | Barcelonès
 Tona          | Y4394950D | Helena    | Pérez    |      8085 | f         | 
 Sitges        | 37228901C | Sebastià  | Fonollà  |     29140 | t         | Garraf
 Lleida        | 29874567M | Leonardo  | Soler    |    139809 | f         | Segrià
 París         | 05CK02337 | JeanMarie | Godard   |   2249975 | f         | 
 New York      | C00021549 | Mick      | Brown    |  18897109 | t         | 
 Sitges        | 36940559Y | Magdalena | Pinós    |     29140 | t         | Garraf
 Badalona      | 38223890Y | Jordi     | Parmalat |    219708 | t         | Barcelonès
 Barcelona     | 51234329N | Mireia    | Matas    |   1611822 | t         | Barcelonès
 Montgat       | 45847558W | José      | González |     12277 | t         | Maresme
 Montgat       | 48377283A | Daniel    | González |     12277 | t         | Maresme
 Amposta       | 37866969E | Carme     | Ferrer   |     21511 | t         | Montsià
 Roses         | 27827228B | Sonia     | Colmena  |     19891 | t         | Alt Empordà
 Roses         | X4534332C | Gabriel   | Cobos    |     19891 | t         | Alt Empordà
 Viladecans    | Y3439185D | Boris     | Santos   |     65444 | t         | Baix Llobregat
(29 rows)
```

### 36.2) Donar les dades de totes les persones i, si se sap, de les ciutats on viuen

```sql
club=# select * from persona left join ciutat on persona.ciutat = ciutat.ciutat;
 passaport |    nom    |  cognom  |    ciutat     |    ciutat     | habitants | costanera |    comarca     
-----------+-----------+----------+---------------+---------------+-----------+-----------+----------------
 27673812M | Carme     | Peralta  | Cadaqués      | Cadaqués      |      2938 | t         | Alt Empordà
 X3478937A | Carles    | Sanàbria | Badalona      | Badalona      |    219708 | t         | Barcelonès
 47548338K | Anna      | Sanàbria | Badalona      | Badalona      |    219708 | t         | Barcelonès
 45493393Z | Jesús     | Hortesa  | Castelldefels | Castelldefels |     63077 | t         | Baix Llobregat
 C00001549 | Mick      | Brown    | San Francisco | San Francisco |    805235 | t         | 
 39238229E | Sònia     | Aragall  | Barcelona     | Barcelona     |   1611822 | t         | Barcelonès
 46372382N | Roser     | Puente   | Tiana         | Tiana         |      8221 | f         | Maresme
 C01X01TN  | Roberto   | Rietto   | Roma          | Roma          |   2796102 | t         | 
 38433548L | Anna      | Margalef | Tiana         | Tiana         |      8221 | f         | Maresme
 32234958K | José      | Sanlúcar | Castelldefels | Castelldefels |     63077 | t         | Baix Llobregat
 38474483Z | Miquel    | Vila     | Tredòs        | Tredòs        |       154 | f         | Val d'Aran
 42065765F | Camila    | Noriega  | Castelldefels | Castelldefels |     63077 | t         | Baix Llobregat
 59119283Z | Pere      | Camprubí | Barcelona     | Barcelona     |   1611822 | t         | Barcelonès
 27961020N | Pere      | Garcia   | Barcelona     | Barcelona     |   1611822 | t         | Barcelonès
 19891898A | Maria     | Martín   | Barcelona     | Barcelona     |   1611822 | t         | Barcelonès
 Y4394950D | Helena    | Pérez    | Tona          | Tona          |      8085 | f         | 
 37228901C | Sebastià  | Fonollà  | Sitges        | Sitges        |     29140 | t         | Garraf
 29874567M | Leonardo  | Soler    | Lleida        | Lleida        |    139809 | f         | Segrià
 05CK02337 | JeanMarie | Godard   | París         | París         |   2249975 | f         | 
 C00021549 | Mick      | Brown    | New York      | New York      |  18897109 | t         | 
 36940559Y | Magdalena | Pinós    | Sitges        | Sitges        |     29140 | t         | Garraf
 38223890Y | Jordi     | Parmalat | Badalona      | Badalona      |    219708 | t         | Barcelonès
 51234329N | Mireia    | Matas    | Barcelona     | Barcelona     |   1611822 | t         | Barcelonès
 45847558W | José      | González | Montgat       | Montgat       |     12277 | t         | Maresme
 48377283A | Daniel    | González | Montgat       | Montgat       |     12277 | t         | Maresme
 37866969E | Carme     | Ferrer   | Amposta       | Amposta       |     21511 | t         | Montsià
 27827228B | Sonia     | Colmena  | Roses         | Roses         |     19891 | t         | Alt Empordà
 X4534332C | Gabriel   | Cobos    | Roses         | Roses         |     19891 | t         | Alt Empordà
 Y3439185D | Boris     | Santos   | Viladecans    | Viladecans    |     65444 | t         | Baix Llobregat
 294394950 | Klauss    | Stallman |               |               |           |           | 
 187448338 | Rita      | Derbeken |               |               |           |           | 
(31 rows)
```

### 36.3) Donar les dades de totes les ciutats i les persones que hi viuen si se sap

```sql
club=# select * from persona right join ciutat on persona.ciutat = ciutat.ciutat;
 passaport |    nom    |  cognom  |    ciutat     |     ciutat     | habitants | costanera |    comarca     
-----------+-----------+----------+---------------+----------------+-----------+-----------+----------------
 27673812M | Carme     | Peralta  | Cadaqués      | Cadaqués       |      2938 | t         | Alt Empordà
 X3478937A | Carles    | Sanàbria | Badalona      | Badalona       |    219708 | t         | Barcelonès
 47548338K | Anna      | Sanàbria | Badalona      | Badalona       |    219708 | t         | Barcelonès
 45493393Z | Jesús     | Hortesa  | Castelldefels | Castelldefels  |     63077 | t         | Baix Llobregat
 C00001549 | Mick      | Brown    | San Francisco | San Francisco  |    805235 | t         | 
 39238229E | Sònia     | Aragall  | Barcelona     | Barcelona      |   1611822 | t         | Barcelonès
 46372382N | Roser     | Puente   | Tiana         | Tiana          |      8221 | f         | Maresme
 C01X01TN  | Roberto   | Rietto   | Roma          | Roma           |   2796102 | t         | 
 38433548L | Anna      | Margalef | Tiana         | Tiana          |      8221 | f         | Maresme
 32234958K | José      | Sanlúcar | Castelldefels | Castelldefels  |     63077 | t         | Baix Llobregat
 38474483Z | Miquel    | Vila     | Tredòs        | Tredòs         |       154 | f         | Val d'Aran
 42065765F | Camila    | Noriega  | Castelldefels | Castelldefels  |     63077 | t         | Baix Llobregat
 59119283Z | Pere      | Camprubí | Barcelona     | Barcelona      |   1611822 | t         | Barcelonès
 27961020N | Pere      | Garcia   | Barcelona     | Barcelona      |   1611822 | t         | Barcelonès
 19891898A | Maria     | Martín   | Barcelona     | Barcelona      |   1611822 | t         | Barcelonès
 Y4394950D | Helena    | Pérez    | Tona          | Tona           |      8085 | f         | 
 37228901C | Sebastià  | Fonollà  | Sitges        | Sitges         |     29140 | t         | Garraf
 29874567M | Leonardo  | Soler    | Lleida        | Lleida         |    139809 | f         | Segrià
 05CK02337 | JeanMarie | Godard   | París         | París          |   2249975 | f         | 
 C00021549 | Mick      | Brown    | New York      | New York       |  18897109 | t         | 
 36940559Y | Magdalena | Pinós    | Sitges        | Sitges         |     29140 | t         | Garraf
 38223890Y | Jordi     | Parmalat | Badalona      | Badalona       |    219708 | t         | Barcelonès
 51234329N | Mireia    | Matas    | Barcelona     | Barcelona      |   1611822 | t         | Barcelonès
 45847558W | José      | González | Montgat       | Montgat        |     12277 | t         | Maresme
 48377283A | Daniel    | González | Montgat       | Montgat        |     12277 | t         | Maresme
 37866969E | Carme     | Ferrer   | Amposta       | Amposta        |     21511 | t         | Montsià
 27827228B | Sonia     | Colmena  | Roses         | Roses          |     19891 | t         | Alt Empordà
 X4534332C | Gabriel   | Cobos    | Roses         | Roses          |     19891 | t         | Alt Empordà
 Y3439185D | Boris     | Santos   | Viladecans    | Viladecans     |     65444 | t         | Baix Llobregat
           |           |          |               | Rio de Janeiro |   6320446 | t         | 
           |           |          |               | Esplugues      |     46667 | f         | Baix Llobregat
           |           |          |               | Atenes         |    664046 | t         | 
(32 rows)
```

### 36.4) Obtenir totes les dades de les persones i les ciutats en una sola relació

```sql
club=# select * from persona full join ciutat on persona.ciutat = ciutat.ciutat;
 passaport |    nom    |  cognom  |    ciutat     |     ciutat     | habitants | costanera |    comarca     
-----------+-----------+----------+---------------+----------------+-----------+-----------+----------------
 27673812M | Carme     | Peralta  | Cadaqués      | Cadaqués       |      2938 | t         | Alt Empordà
 X3478937A | Carles    | Sanàbria | Badalona      | Badalona       |    219708 | t         | Barcelonès
 47548338K | Anna      | Sanàbria | Badalona      | Badalona       |    219708 | t         | Barcelonès
 45493393Z | Jesús     | Hortesa  | Castelldefels | Castelldefels  |     63077 | t         | Baix Llobregat
 C00001549 | Mick      | Brown    | San Francisco | San Francisco  |    805235 | t         | 
 39238229E | Sònia     | Aragall  | Barcelona     | Barcelona      |   1611822 | t         | Barcelonès
 46372382N | Roser     | Puente   | Tiana         | Tiana          |      8221 | f         | Maresme
 C01X01TN  | Roberto   | Rietto   | Roma          | Roma           |   2796102 | t         | 
 38433548L | Anna      | Margalef | Tiana         | Tiana          |      8221 | f         | Maresme
 32234958K | José      | Sanlúcar | Castelldefels | Castelldefels  |     63077 | t         | Baix Llobregat
 38474483Z | Miquel    | Vila     | Tredòs        | Tredòs         |       154 | f         | Val d'Aran
 42065765F | Camila    | Noriega  | Castelldefels | Castelldefels  |     63077 | t         | Baix Llobregat
 59119283Z | Pere      | Camprubí | Barcelona     | Barcelona      |   1611822 | t         | Barcelonès
 27961020N | Pere      | Garcia   | Barcelona     | Barcelona      |   1611822 | t         | Barcelonès
 19891898A | Maria     | Martín   | Barcelona     | Barcelona      |   1611822 | t         | Barcelonès
 Y4394950D | Helena    | Pérez    | Tona          | Tona           |      8085 | f         | 
 37228901C | Sebastià  | Fonollà  | Sitges        | Sitges         |     29140 | t         | Garraf
 29874567M | Leonardo  | Soler    | Lleida        | Lleida         |    139809 | f         | Segrià
 05CK02337 | JeanMarie | Godard   | París         | París          |   2249975 | f         | 
 C00021549 | Mick      | Brown    | New York      | New York       |  18897109 | t         | 
 36940559Y | Magdalena | Pinós    | Sitges        | Sitges         |     29140 | t         | Garraf
 38223890Y | Jordi     | Parmalat | Badalona      | Badalona       |    219708 | t         | Barcelonès
 51234329N | Mireia    | Matas    | Barcelona     | Barcelona      |   1611822 | t         | Barcelonès
 45847558W | José      | González | Montgat       | Montgat        |     12277 | t         | Maresme
 48377283A | Daniel    | González | Montgat       | Montgat        |     12277 | t         | Maresme
 37866969E | Carme     | Ferrer   | Amposta       | Amposta        |     21511 | t         | Montsià
 27827228B | Sonia     | Colmena  | Roses         | Roses          |     19891 | t         | Alt Empordà
 X4534332C | Gabriel   | Cobos    | Roses         | Roses          |     19891 | t         | Alt Empordà
 Y3439185D | Boris     | Santos   | Viladecans    | Viladecans     |     65444 | t         | Baix Llobregat
 294394950 | Klauss    | Stallman |               |                |           |           | 
 187448338 | Rita      | Derbeken |               |                |           |           | 
           |           |          |               | Rio de Janeiro |   6320446 | t         | 
           |           |          |               | Esplugues      |     46667 | f         | Baix Llobregat
           |           |          |               | Atenes         |    664046 | t         | 
(34 rows)
```

### 36.5) Què obté aquesta consulta?

SELECT * FROM persona JOIN ciutat USING(ciutat);

```sql
club=# SELECT * FROM persona JOIN ciutat USING(ciutat);
    ciutat     | passaport |    nom    |  cognom  | habitants | costanera |    comarca     
---------------+-----------+-----------+----------+-----------+-----------+----------------
 Cadaqués      | 27673812M | Carme     | Peralta  |      2938 | t         | Alt Empordà
 Badalona      | X3478937A | Carles    | Sanàbria |    219708 | t         | Barcelonès
 Badalona      | 47548338K | Anna      | Sanàbria |    219708 | t         | Barcelonès
 Castelldefels | 45493393Z | Jesús     | Hortesa  |     63077 | t         | Baix Llobregat
 San Francisco | C00001549 | Mick      | Brown    |    805235 | t         | 
 Barcelona     | 39238229E | Sònia     | Aragall  |   1611822 | t         | Barcelonès
 Tiana         | 46372382N | Roser     | Puente   |      8221 | f         | Maresme
 Roma          | C01X01TN  | Roberto   | Rietto   |   2796102 | t         | 
 Tiana         | 38433548L | Anna      | Margalef |      8221 | f         | Maresme
 Castelldefels | 32234958K | José      | Sanlúcar |     63077 | t         | Baix Llobregat
 Tredòs        | 38474483Z | Miquel    | Vila     |       154 | f         | Val d'Aran
 Castelldefels | 42065765F | Camila    | Noriega  |     63077 | t         | Baix Llobregat
 Barcelona     | 59119283Z | Pere      | Camprubí |   1611822 | t         | Barcelonès
 Barcelona     | 27961020N | Pere      | Garcia   |   1611822 | t         | Barcelonès
 Barcelona     | 19891898A | Maria     | Martín   |   1611822 | t         | Barcelonès
 Tona          | Y4394950D | Helena    | Pérez    |      8085 | f         | 
 Sitges        | 37228901C | Sebastià  | Fonollà  |     29140 | t         | Garraf
 Lleida        | 29874567M | Leonardo  | Soler    |    139809 | f         | Segrià
 París         | 05CK02337 | JeanMarie | Godard   |   2249975 | f         | 
 New York      | C00021549 | Mick      | Brown    |  18897109 | t         | 
 Sitges        | 36940559Y | Magdalena | Pinós    |     29140 | t         | Garraf
 Badalona      | 38223890Y | Jordi     | Parmalat |    219708 | t         | Barcelonès
 Barcelona     | 51234329N | Mireia    | Matas    |   1611822 | t         | Barcelonès
 Montgat       | 45847558W | José      | González |     12277 | t         | Maresme
 Montgat       | 48377283A | Daniel    | González |     12277 | t         | Maresme
 Amposta       | 37866969E | Carme     | Ferrer   |     21511 | t         | Montsià
 Roses         | 27827228B | Sonia     | Colmena  |     19891 | t         | Alt Empordà
 Roses         | X4534332C | Gabriel   | Cobos    |     19891 | t         | Alt Empordà
 Viladecans    | Y3439185D | Boris     | Santos   |     65444 | t         | Baix Llobregat
(29 rows)
```

### 36.6) Què obté aquesta consulta?

SELECT * FROM persona JOIN ciutat ON persona.ciutat = ciutat.ciutat;

```sql
club=# SELECT * FROM persona JOIN ciutat ON persona.ciutat = ciutat.ciutat;
 passaport |    nom    |  cognom  |    ciutat     |    ciutat     | habitants | costanera |    comarca     
-----------+-----------+----------+---------------+---------------+-----------+-----------+----------------
 27673812M | Carme     | Peralta  | Cadaqués      | Cadaqués      |      2938 | t         | Alt Empordà
 X3478937A | Carles    | Sanàbria | Badalona      | Badalona      |    219708 | t         | Barcelonès
 47548338K | Anna      | Sanàbria | Badalona      | Badalona      |    219708 | t         | Barcelonès
 45493393Z | Jesús     | Hortesa  | Castelldefels | Castelldefels |     63077 | t         | Baix Llobregat
 C00001549 | Mick      | Brown    | San Francisco | San Francisco |    805235 | t         | 
 39238229E | Sònia     | Aragall  | Barcelona     | Barcelona     |   1611822 | t         | Barcelonès
 46372382N | Roser     | Puente   | Tiana         | Tiana         |      8221 | f         | Maresme
 C01X01TN  | Roberto   | Rietto   | Roma          | Roma          |   2796102 | t         | 
 38433548L | Anna      | Margalef | Tiana         | Tiana         |      8221 | f         | Maresme
 32234958K | José      | Sanlúcar | Castelldefels | Castelldefels |     63077 | t         | Baix Llobregat
 38474483Z | Miquel    | Vila     | Tredòs        | Tredòs        |       154 | f         | Val d'Aran
 42065765F | Camila    | Noriega  | Castelldefels | Castelldefels |     63077 | t         | Baix Llobregat
 59119283Z | Pere      | Camprubí | Barcelona     | Barcelona     |   1611822 | t         | Barcelonès
 27961020N | Pere      | Garcia   | Barcelona     | Barcelona     |   1611822 | t         | Barcelonès
 19891898A | Maria     | Martín   | Barcelona     | Barcelona     |   1611822 | t         | Barcelonès
 Y4394950D | Helena    | Pérez    | Tona          | Tona          |      8085 | f         | 
 37228901C | Sebastià  | Fonollà  | Sitges        | Sitges        |     29140 | t         | Garraf
 29874567M | Leonardo  | Soler    | Lleida        | Lleida        |    139809 | f         | Segrià
 05CK02337 | JeanMarie | Godard   | París         | París         |   2249975 | f         | 
 C00021549 | Mick      | Brown    | New York      | New York      |  18897109 | t         | 
 36940559Y | Magdalena | Pinós    | Sitges        | Sitges        |     29140 | t         | Garraf
 38223890Y | Jordi     | Parmalat | Badalona      | Badalona      |    219708 | t         | Barcelonès
 51234329N | Mireia    | Matas    | Barcelona     | Barcelona     |   1611822 | t         | Barcelonès
 45847558W | José      | González | Montgat       | Montgat       |     12277 | t         | Maresme
 48377283A | Daniel    | González | Montgat       | Montgat       |     12277 | t         | Maresme
 37866969E | Carme     | Ferrer   | Amposta       | Amposta       |     21511 | t         | Montsià
 27827228B | Sonia     | Colmena  | Roses         | Roses         |     19891 | t         | Alt Empordà
 X4534332C | Gabriel   | Cobos    | Roses         | Roses         |     19891 | t         | Alt Empordà
 Y3439185D | Boris     | Santos   | Viladecans    | Viladecans    |     65444 | t         | Baix Llobregat
(29 rows)
```

Fi de festa, treball amb valors nuls:
Reflexionem:

L'expressió 'A= NULL' SEMPRE dona fals! Independentment si A té un valor o no...

En canvi, A IS NULL sí que retorna el que desitgem tenint en compte els valors de A.

(Recorda que pots fer servir també el NOT, quedant l'expressió IS NOT NULL, depenent del que t'interessi)
Fes una prova:

## 37) Anem a fer una consulta INCORRECTA sobre les persones que no se sap on viuen

SELECT * FROM persona WHERE ciutat = NULL;

--> 0 rows... segur?

```sql
club=# SELECT * FROM persona WHERE ciutat = NULL;
 passaport | nom | cognom | ciutat 
-----------+-----+--------+--------
(0 rows)
```

### 37.1) Transforma la consulta anterior correctament

```sql
club=# SELECT * FROM persona WHERE ciutat is NULL;
 passaport |  nom   |  cognom  | ciutat 
-----------+--------+----------+--------
 294394950 | Klauss | Stallman | 
 187448338 | Rita   | Derbeken | 
(2 rows)
```

### 37.2) Si hem de fer servir valors no booleans, tenim el predicat IS UNKOWN. el seu ús és molt particular

```sql
club=# select * from ciutat where costanera is true;
     ciutat     | habitants | costanera |    comarca     
----------------+-----------+-----------+----------------
 Cadaqués       |      2938 | t         | Alt Empordà
 Badalona       |    219708 | t         | Barcelonès
 San Francisco  |    805235 | t         | 
 Rio de Janeiro |   6320446 | t         | 
 Castelldefels  |     63077 | t         | Baix Llobregat
 New York       |  18897109 | t         | 
 Sitges         |     29140 | t         | Garraf
 Atenes         |    664046 | t         | 
 Barcelona      |   1611822 | t         | Barcelonès
 Viladecans     |     65444 | t         | Baix Llobregat
 Roma           |   2796102 | t         | 
 Roses          |     19891 | t         | Alt Empordà
 Amposta        |     21511 | t         | Montsià
 Montgat        |     12277 | t         | Maresme
(14 rows)
```

### 37.3) Respón: Què fa aquesta consulta?

SELECT * FROM persona WHERE ciutat='Mart' IS UNKNOWN;

```sql
club=# SELECT * FROM persona WHERE ciutat='Mart' IS UNKNOWN;
 passaport |  nom   |  cognom  | ciutat 
-----------+--------+----------+--------
 294394950 | Klauss | Stallman | 
 187448338 | Rita   | Derbeken | 
(2 rows
```

### 37.4) Si et ve de gust, fes un update per ficar a Sònia Aragalll a la ciutat 'Mart' i repeteix la consulta, què passa ara ?

```sql
club=# insert into comarca values ('martelones');
INSERT 0 1
club=# insert into ciutat values ('mart',2,false,'martelones');
INSERT 0 1
club=# update persona set ciutat = 'mart' where ciutat is null;
UPDATE 2
club=# SELECT * FROM persona WHERE ciutat='Mart' IS UNKNOWN;
 passaport | nom | cognom | ciutat 
-----------+-----+--------+--------
(0 rows)
```

Que com mart es known (true), no mostra ninguna persona, ja que les úniques persones sense ciutat eren en Klauss i la Rita  

---

Clàusula IN:

Retorna cert si un valor pertany a la relació, la seva sintaxi general es:

SELECT A1,A2,..., Ak FROM R WHERE A IN (SELECT B FROM S....);

Fer una intersecció és relativament senzill fent servir IN, així resol aquesta qüestió:

## 38) Passaport, nom i cognom dels socis que practiquin fútbol i bàsquet

Et sona veritat? És la mateixa consulta 35 del INTERSECT, però ara la farem no pensant en conjunts, sino en files i columnes de taules... quina forma t'és més còmode? Totes dues són vàlides!

```sql
club=# select passaport, nom, cognom from persona where passaport in (select passaport from fa where esport='futbol') and passaport in (select passaport from fa where esport='bàsquet');
 passaport |  nom   |  cognom  
-----------+--------+----------
 294394950 | Klauss | Stallman
 187448338 | Rita   | Derbeken
(2 rows)club=# select passaport, nom, cognom from persona where passaport in (select passaport from fa where esport='futbol') and passaport in (select passaport from fa where esport='bàsquet');
 passaport |  nom   |  cognom  
-----------+--------+----------
 294394950 | Klauss | Stallman
 187448338 | Rita   | Derbeken
(2 rows)

```

## 39) Continuem amb IN... (difícil!)

Mostra el passaport , nom i cognoms de les persones conegudes pels treballadors de l'Alt Empordà amb sous superiors a 1000

```sql
club=# select passaport, nom, cognom from persona,ciutat where persona.ciutat=ciutat.ciutat and comarca='Alt Empordà' and passaport in (select es_coneguda from coneix where coneix in (select passaport from nomines where periode between '2014-12-01' and '2014-12-31' and sou_base > 1000));
 passaport |  nom  | cognom  
-----------+-------+---------
 27827228B | Sonia | Colmena
(1 row)

```
o
```sql
club=# select persona.* from persona,ciutat where passaport in (select passaport from coneix, persona where es_coneguda=passaport) and passaport in(select passaport from nomines where periode between '2014-12-01' and '2014-12-31' and sou_base > 1000) and persona.ciutat=ciutat.ciutat and comarca='Alt Empordà';
 passaport |  nom  | cognom  | ciutat 
-----------+-------+---------+--------
 27827228B | Sonia | Colmena | Roses
(1 row)
```
o
```sql
club=# select passaport,nom,cognom from coneix, persona where es_coneguda=passaport and coneix in (select passaport from nomines where sou_base > 1000 and passaport in (select passaport from persona natural join ciutat where comarca='Alt Empordà'));
 passaport |  nom   | cognom  
-----------+--------+---------
 42065765F | Camila | Noriega
 27827228B | Sonia  | Colmena
(2 rows)
```
Pista: Aquesta consulta te un IN i dins un altre IN, pensa que travessem gairebé completament la BD, taules: coneix, persona, nomines, ciutat....)

---

Bé, ara ja ens podem considerar els/les cracks de SQL, les següents consultes no estàn 'guiades' en el sentit que podeu fer servir el que vulgueu,
sempre que el resultat sigui correcte. Si teniu curiositat, podeu fer servir la comanda de psql \timing on per mesurar el temps de la vostre consulta.
En general, qualsevol consulta superior a mig segon (abans de ser a la memòria cau (caché), sería moooolt dolent).
Sort!

## 40) Obtenir el cognom dels socis, amb el que paguen per cada esport

```sql
club=# select cognom, quota from persona, fa where persona.passaport=fa.passaport;
  cognom  | quota 
----------+-------
 Peralta  | 21.50
 Peralta  | 15.40
 Peralta  | 10.30
 Peralta  | 18.35
 Sanàbria |  0.00
 Sanàbria | 15.40
 Sanàbria | 10.30
 Sanàbria | 18.35
 Sanàbria | 23.65
 Sanàbria |  0.00
 Sanàbria | 21.50
 Sanàbria |  8.60
 Sanàbria | 24.15
 Hortesa  | 22.60
 Hortesa  | 14.50
 Brown    |  0.00
 Brown    |  8.60
 Brown    | 22.60
 Aragall  | 15.40
 Aragall  | 18.35
 Puente   | 15.40
 Puente   | 18.35
 Rietto   |  0.00
 Rietto   | 10.30
 Rietto   | 18.35
 Margalef | 10.30
 Margalef | 18.35
 Sanlúcar | 14.50
 Sanlúcar | 10.30
 Vila     | 23.65
 Vila     |  8.60
 Vila     | 22.60
 Noriega  | 23.65
 Noriega  | 14.50
 Camprubí |  0.00
 Camprubí | 14.50
 Camprubí | 18.35
 Garcia   | 14.50
 Garcia   | 18.35
 Martín   | 23.65

...skipping 1 line
 Stallman |  8.60
 Stallman | 15.40
 Derbeken |  8.60
 Derbeken | 15.40
(45 rows)

```

## 41) Passaport, nom i cognom dels socis que practiquen futbol

```sql
club=# select passaport, nom, cognom from persona where passaport in (select passaport from soci where passaport in (select passaport from fa where esport='futbol'));
 passaport |  nom   |  cognom  
-----------+--------+----------
 46372382N | Roser  | Puente
 27673812M | Carme  | Peralta
 187448338 | Rita   | Derbeken
 294394950 | Klauss | Stallman
 39238229E | Sònia  | Aragall
 X3478937A | Carles | Sanàbria
(6 rows)

Time: 0.945 ms
```

## 42) Nom dels socis amb alguna quota més alta que el sou d'algún treballador/a

```sql
club=# select nom from persona where passaport in (select passaport from nomines where (select sum(quota) from fa) > sou_base);
 nom 
-----
(0 rows)
```

## 43) Nom de les ciutats on no hi ha cap persona (Mirar clàusula 'EXISTS' a veure què fa)

```sql
club=# select ciutat.ciutat from ciutat left join persona on ciutat.ciutat=persona.ciutat where persona.ciutat is null;
     ciutat     
----------------
 Rio de Janeiro
 París
 Esplugues
 Atenes
 mart
(5 rows)
```

## 44) Donar el nom dels esports que practiquin socis de totes les ciutats de la comarca del Barcelonès

```sql
club=# select esport from fa where passaport in (select passaport from persona where ciutat in (select ciutat from ciutat where comarca='Barcelonès')) group by esport;
    esport     
---------------
 atletisme
 bàsquet
 futbol
 golf
 natació
 ping-pong
 tennis
 tennis dobles
 voleibol
(9 rows)
```

---

Consultas de repaso antes del examen, enjoy!

- Cuántos socios tienen un email de gmail.com?

```sql
club=# select count(mail) as usan_gmail from mails,soci where mail like '%@gmail.com' and mails.passaport=soci.passaport;
 usan_gmail 
------------
          1
(1 row)
```

- Prepara una VISTA con las ciudades de personas de la BD y cuantas viven en cada ciudad ordenadas por nombre de ciudad.

```sql
club=# create view personasxciudad as select persona.ciutat, count(persona.ciutat) from persona, ciutat where persona.ciutat=ciutat.ciutat group by persona.ciutat order by ciutat asc;
CREATE VIEW

club=# select * from personasxciudad;
    ciutat     | count 
---------------+-------
 Amposta       |     1
 Badalona      |     3
 Barcelona     |     5
 Cadaqués      |     1
 Castelldefels |     3
 Lleida        |     1
 Montgat       |     2
 New York      |     1
 Roma          |     1
 Roses         |     2
 San Francisco |     1
 Sitges        |     2
 Tiana         |     2
 Tona          |     1
 Tredòs        |     1
 Viladecans    |     1
(16 rows)
```

- Comarca de los socios que practiquen tennis.

```sql
club=# select distinct comarca from ciutat where ciutat in (select ciutat from persona where passaport in (select passaport from fa where esport='tennis'));
    comarca     
----------------
 Baix Llobregat
 Barcelonès
 Val d'Aran
(3 rows)
```

- En las ciudades que vivan 3 personas, sumar 1000 habitantes.

```sql
club=# update ciutat set habitants = habitants + 1000 where ciutat in (select ciutat from persona group by ciutat having count(ciutat) = 3);
UPDATE 2
```

---

- Para los deportes que los practiquen mas de 2 personas, sube la cuota un 10%

```sql
club=# update fa set quota = quota*(1.1) where esport in (select esport from fa group by esport having count(esport) > 2);
UPDATE 42
```

- Deportes que no son practicados por ningún socio

```sql
club=# select esport.esport from esport left join fa on esport.esport=fa.esport where fa.esport is null;
 esport  
---------
 handbol
(1 row)
```

- Sueldo medio de los trabajadores de la sección de 'comercial'

```sql
club=# select avg(sou_base) as sueldo_medio from nomines where passaport in (select passaport from treballador where departament='comercial');
     sueldo_medio      
-----------------------
 1103.6733333333333333
(1 row)
```