# Más preguntas SQL

## ¿Cuál es el deporte con el menor número de jugadores en la tabla esport?

```sql
club=# select esport,jugadors from esport where jugadors = (select min(jugadors) from esport);
  esport   | jugadors 
-----------+----------
 natació   |        1
 ping-pong |        1
 golf      |        1
 atletisme |        1
 tennis    |        1
(5 rows)
```

## ¿Cuál es el deporte más barato en el club?

```sql
club=# select esport from esport where preu = (select min(preu) from esport);
 esport 
--------
 futbol
(1 row)
```

## ¿Cuál es el deporte más caro en la tabla esport?

```sql
club=# select esport from esport where preu = (select max(preu) from esport);
 esport 
--------
 vela
(1 row)
```

## ¿Cuál es el nombre de la ciudad con más habitantes?

```sql
club=# select ciutat from ciutat where habitants = (select max(habitants) from ciutat);
  ciutat  
----------
 New York
(1 row)
```

## ¿Cuál es el nombre y apellidos de la persona que conoce a más personas en la tabla coneix?

```sql
club=# select nom,cognom from persona where passaport in (SELECT coneix FROM coneix GROUP BY coneix HAVING COUNT(es_coneguda) = (SELECT MAX(contador) FROM (SELECT COUNT(es_coneguda) AS contador FROM coneix GROUP BY coneix) subconsulta));
  nom  | cognom  
-------+---------
 Carme | Peralta
(1 row)
```

## ¿Cuál es el nombre y apellidos de la persona que juega al golf y de la/las personas que tienen la cuota más alta?

```sql
club=# select nom, cognom from persona where passaport in (select passaport from fa where esport='golf' or quota = (select max(quota) from fa));
  nom   |  cognom  
--------+----------
 Anna   | Sanàbria
 Miquel | Vila
 Camila | Noriega
 Maria  | Martín
(4 rows)
```

## ¿Cuál es el total de ingresos por membresías vendidas?

```sql
club=# select sum(quota) as total_ingresos from fa;
 total_ingresos 
----------------
         704.00
(1 row)

```

## ¿Cuál es la ciudad con menos habitantes de la tabla?

```sql
club=# select ciutat from ciutat where habitants = (select min(habitants) from ciutat);
 ciutat 
--------
 mart
(1 row)
```

## ¿Cuál es la ciudad más poblada en la comarca de Barcelonès?

```sql
club=# select ciutat from ciutat where habitants = (select max(habitants) from ciutat where comarca='Barcelonès');
  ciutat   
-----------
 Barcelona
(1 row)
```

## ¿Cuál es la comarca a la que pertenece la ciudad de Roses?

```sql
club=# select comarca from ciutat where ciutat='Roses';
   comarca   
-------------
 Alt Empordà
(1 row)
```

## ¿Cuál es la cuota media en la tabla fa?

```sql
club=# select avg(quota) from fa;
         avg         
---------------------
 15.6444444444444444
(1 row)
```

## ¿Cuál es la suma total de la cuota para los deportes de natación y voleibol en la tabla fa?

```sql
club=# select sum(quota) from fa where esport='natació' or esport='voleibol';
  sum   
--------
 241.27
(1 row)
```

## ¿Cuáles son las ciudades con menos de 10,000 habitantes?

```sql
club=# select ciutat from ciutat where habitants < 10000;
  ciutat  
----------
 Cadaqués
 Tiana
 Tredòs
 Tona
 mart
(5 rows)
```

## ¿Cuáles son las ciudades con más de 1 millón de habitantes?

```sql
club=# select ciutat from ciutat where habitants > 1000000;
     ciutat     
----------------
 Rio de Janeiro
 París
 New York
 Barcelona
 Roma
(5 rows)
```

## ¿Cuáles son las ciudades que no están en la costa?

```sql
club=# select ciutat from ciutat where not costanera;
  ciutat   
-----------
 París
 Lleida
 Tiana
 Esplugues
 Tredòs
 Tona
 mart
(7 rows)
```

## ¿Cuáles son los deportes que cuestan más de 25 euros?

```sql
club=# select esport from esport where preu > 25;
 esport 
--------
 golf
 vela
 tennis
(3 rows)
```

## ¿Cuáles son los deportes más que se practican en el club y cuánto cuesta practicarlos?

```sql
club=# select esport, count(esport), quota from fa group by esport,quota order by count(esport) desc;
    esport     | count | quota 
---------------+-------+-------
 natació       |     8 | 20.19
 ping-pong     |     6 | 11.33
 futbol        |     6 | 16.94
 bàsquet       |     5 |  9.46
 voleibol      |     5 | 15.95
 atletisme     |     5 |  0.00
 tennis        |     4 | 26.02
 vela          |     3 | 24.86
 tennis dobles |     2 | 21.50
 golf          |     1 | 24.15
(10 rows)
```

## Cual es el nombre, apellido y ciudad de las personas que practica futbol o tennis en la comarca del "Barcelonès"

```sql
club=# select nom, cognom, persona.ciutat from persona, ciutat where passaport in (select passaport from fa where esport='tennis' or esport='futbol') and comarca='Barcelonès' and ciutat.ciutat=persona.ciutat;
  nom   |  cognom  |  ciutat   
--------+----------+-----------
 Carles | Sanàbria | Badalona
 Anna   | Sanàbria | Badalona
 Sònia  | Aragall  | Barcelona
 Maria  | Martín   | Barcelona
(4 rows)
```

## Los nombres de los trabajadores del departamento de administración que recibieron la nómina en 2015

```sql
club=# select nom, cognom from persona where passaport in (select passaport from treballador where departament='administració') and passaport in (select passaport from nomines where periode between '2015-01-01' and '2016-01-01');
   nom    |  cognom  
----------+----------
 Daniel   | González
 Mick     | Brown
 Leonardo | Soler
 José     | González
 Sebastià | Fonollà
(5 rows)
```

## Nombre y apellido de los trabajadores que son conocidos por otros trabajadores 

```sql
club=# select nom, cognom from persona where passaport in (select es_coneguda from coneix where es_coneguda in (select passaport from treballador));
  nom  | cognom  
-------+---------
 Sonia | Colmena
(1 row)
```

## ¿Cuántas ciudades hay en cada comarca?

```sql
club=# select count(ciutat), comarca from ciutat group by comarca;
 count |    comarca     
-------+----------------
     7 | 
     1 | martelones
     2 | Maresme
     1 | Montsià
     3 | Baix Llobregat
     2 | Barcelonès
     2 | Alt Empordà
     1 | Segrià
     1 | Garraf
     1 | Val d'Aran
(10 rows)
```

## ¿Cuántas ciudades hay en la tabla "ciutat"?

```sql
club=# select count(*) as qty_ciutat from ciutat;
 qty_ciutat 
------------
         21
(1 row)
```

## ¿Cuántas ciudades tienen costa?

```sql
club=# select count(*) as qty_ciutat from ciutat where costanera;
 qty_ciutat 
------------
         14
(1 row)
```

## ¿Cuántas ciudades tienen menos de 100.000 habitantes?

```sql
club=# select count(*) as qty_ciutat from ciutat where habitants < 100000;
 qty_ciutat 
------------
         12
(1 row)
```

## ¿Cuántas personas conocen a la persona con el número de identificación 27673812M?

```sql
club=# select count(*) from coneix where es_coneguda='27673812M';
 count 
-------
     2
(1 row)
```

## ¿Cuántas personas en la tabla "coneix" no conocen a nadie en la tabla?

```sql
club=# select count(passaport) from persona where passaport not in (select es_coneguda from coneix);
 count 
-------
    23
(1 row)
```

## ¿Cuántas personas han comprado una membresía para cualquier deporte por debajo de los 20 euros?

```sql
club=# select distinct count(passaport) from fa where quota > 20;
 count 
-------
    18
(1 row)
```

## ¿Cuántas personas no conocen a nadie en el club?

```sql
club=# select persona.* from persona, coneix where coneix!=passaport;
 passaport |    nom    |  cognom  |    ciutat     
-----------+-----------+----------+---------------
 X3478937A | Carles    | Sanàbria | Badalona
 47548338K | Anna      | Sanàbria | Badalona
 45493393Z | Jesús     | Hortesa  | Castelldefels
 C00001549 | Mick      | Brown    | San Francisco
 39238229E | Sònia     | Aragall  | Barcelona
 46372382N | Roser     | Puente   | Tiana
 C01X01TN  | Roberto   | Rietto   | Roma
 38433548L | Anna      | Margalef | Tiana
 32234958K | José      | Sanlúcar | Castelldefels
 38474483Z | Miquel    | Vila     | Tredòs
 42065765F | Camila    | Noriega  | Castelldefels
 59119283Z | Pere      | Camprubí | Barcelona
 27961020N | Pere      | Garcia   | Barcelona
 19891898A | Maria     | Martín   | Barcelona
 Y4394950D | Helena    | Pérez    | Tona
 37228901C | Sebastià  | Fonollà  | Sitges
 29874567M | Leonardo  | Soler    | Lleida
 C00021549 | Mick      | Brown    | New York
 36940559Y | Magdalena | Pinós    | Sitges
 38223890Y | Jordi     | Parmalat | Badalona
 51234329N | Mireia    | Matas    | Barcelona
 45847558W | José      | González | Montgat
 48377283A | Daniel    | González | Montgat
 37866969E | Carme     | Ferrer   | Amposta
 27827228B | Sonia     | Colmena  | Roses
 X4534332C | Gabriel   | Cobos    | Roses
 Y3439185D | Boris     | Santos   | Viladecans
 294394950 | Klauss    | Stallman | 
 187448338 | Rita      | Derbeken | 
 05CK02337 | JeanMarie | Godard   | 
 27673812M | Carme     | Peralta  | Cadaqués
 47548338K | Anna      | Sanàbria | Badalona
 45493393Z | Jesús     | Hortesa  | Castelldefels
 C00001549 | Mick      | Brown    | San Francisco
 39238229E | Sònia     | Aragall  | Barcelona
 46372382N | Roser     | Puente   | Tiana
 C01X01TN  | Roberto   | Rietto   | Roma
 38433548L | Anna      | Margalef | Tiana
 32234958K | José      | Sanlúcar | Castelldefels
 38474483Z | Miquel    | Vila     | Tredòs
```

## ¿Cuántas personas pagan una cuota superior a 20 euros por jugar al golf o al tenis?

```sql
club=# select count(*) from fa where quota > 20 and esport='tennis' or esport='golf';
 count 
-------
     5
(1 row)
```

## ¿Cuántas personas pagan una cuota superior a 20 euros por jugar al golf?

```sql
club=# select count(*) from fa where quota > 20 and esport='golf';
 count 
-------
     1
(1 row)
```

## ¿Cuántas personas viven en ciudades con una costa?

```sql
club=# select count(passaport) from persona where ciutat in (select ciutat from ciutat where costanera);
 count 
-------
    23
(1 row)

```

## ¿Cuántas personas viven en ciudades que no tienen una costa?

```sql
club=# select count(passaport) from persona where ciutat in (select ciutat from ciutat where not costanera);
 count 
-------
     5
(1 row)
```

## ¿Cuántos deportes diferentes se ofrecen en el club?

```sql
club=# select count(*) from esport;
 count 
-------
    11
(1 row)
```

## ¿Cuántos deportes diferentes se ofrecen en las ciudades de la comarca de Barcelonès?

```sql
club=# select count(persona.*) from persona,ciutat where passaport in (select passaport from fa) and ciutat.ciutat=persona.ciutat and comarca='Barcelonès';
 count 
-------
     6
(1 row)
```

## ¿Cuántos deportes ofrecidos en el club tienen un precio superior a 20 euros?

```sql
club=# select count(*) from esport where preu > 20;
 count 
-------
     5
(1 row)
```

## ¿Cuántos jugadores juegan a cada deporte?

```sql
club=# select esport, count(passaport) from fa group by esport;
    esport     | count 
---------------+-------
 voleibol      |     5
 bàsquet       |     5
 vela          |     3
 futbol        |     6
 tennis dobles |     2
 tennis        |     4
 golf          |     1
 atletisme     |     5
 natació       |     8
 ping-pong     |     6
(10 rows)
```

## ¿Qué comarca tiene más ciudades?

```sql
club=# select comarca from ciutat where comarca is not null group by comarca order by count(ciutat) desc limit 1;
    comarca     
----------------
 Baix Llobregat
(1 row)
```

## ¿Qué deportes juegan las personas que pagan una cuota superior a 20 euros por cualquier deporte?

```sql
club=# select esport from fa where quota > 20 group by esport;
    esport     
---------------
 tennis
 golf
 vela
 natació
 tennis dobles
(5 rows)
```

## ¿Qué nombre y apellidos pagan una cuota superior a 20 euros y qué deporte practican?

```sql
club=# select nom, cognom, esport from persona, fa where quota > 20 and persona.passaport=fa.passaport;
   nom   |  cognom  |    esport     
---------+----------+---------------
 Carme   | Peralta  | natació
 Carme   | Peralta  | tennis dobles
 Carles  | Sanàbria | natació
 Anna    | Sanàbria | tennis
 Anna    | Sanàbria | tennis dobles
 Anna    | Sanàbria | golf
 Jesús   | Hortesa  | vela
 Mick    | Brown    | vela
 Sònia   | Aragall  | natació
 Roser   | Puente   | natació
 Roberto | Rietto   | natació
 Anna    | Margalef | natació
 Miquel  | Vila     | tennis
 Miquel  | Vila     | vela
 Camila  | Noriega  | tennis
 Pere    | Camprubí | natació
 Pere    | Garcia   | natació
 Maria   | Martín   | tennis
(18 rows)
```

## ¿Cuál es el salario promedio de los empleados en el departamento "comercial" en la tabla "empleados"?

```sql
club=# select avg(sou_base) from nomines where passaport in (select passaport from treballador where departament='comercial');
          avg          
-----------------------
 1103.6733333333333333
(1 row)
```

## Crea una tabla en la base de datos que se llame "telefons" con el campo "passaport" de texto, no nulo y que referencie a persona(passaport) y "telefon" tipo texto que sea not nulo  

```sql
club_test=# create table telefons (passaport text not null references persona(passaport), telefon text not null);
CREATE TABLE
```

## Ahora inserta datos en la tabla ya creada

```sql
club_test=# insert into telefons (passaport, telefon) values
('27673812M','343684473882'),
('05CK02337','0011833493388'),
('05CK02337','655944839'),
('05CK02337','972102293'),
('C01X01TN','968339229'),
('19891898A','677384487');
INSERT 0 6
```

## Crea una vista nombrada "total_esports" que muestre el nombre total de socios apuntados en cada desporte, el coste mensual del deporte y el lo que el club ingresa mensualmente con esa cuota

```sql
club_test=# select esport,count(esport) as total_socis, quota as cost_quota, sum(quota) as total_per_esport from fa group by esport,quota;
    esport     | total_socis | cost_quota | total_per_esport 
---------------+-------------+------------+------------------
 golf          |           1 |      24.15 |            24.15
 tennis        |           4 |      26.02 |           104.08
 voleibol      |           5 |      15.95 |            79.75
 natació       |           8 |      20.19 |           161.52
 tennis dobles |           2 |      21.50 |            43.00
 futbol        |           6 |      16.94 |           101.64
 vela          |           3 |      24.86 |            74.58
 atletisme     |           5 |       0.00 |             0.00
 ping-pong     |           6 |      11.33 |            67.98
 bàsquet       |           5 |       9.46 |            47.30
(10 rows)

club_test=# create view total_esports as select esport,count(esport) as total_socis, quota as cost_quota, sum(quota) as total_per_esport from fa group by esport,quota;
CREATE VIEW
```
## Muestra el nombre y el pasaporte de los trabajadores con una nómina superior a 200 e inferior a 700

```sql
club_test=# select nom, passaport from persona where passaport in (select distinct passaport from nomines where sou_base between 200 and 700);
  nom   | passaport 
--------+-----------
 José   | 45847558W
 Daniel | 48377283A
(2 rows)
```

## Muestra las ciudades que NO empiecen por la letra ‘A’ y sus habitantes sean menos de 10000

```sql
club_test=# select ciutat from ciutat where ciutat not like 'A%' and habitants < 10000;
  ciutat  
----------
 Cadaqués
 Tiana
 Tredòs
 Tona
 mart
(5 rows)
```

## Muestra el total de habitantes de las comarcas que empiezan por “B”

```sql
club_test=# select comarca,sum(habitants) from ciutat where comarca like 'B%' group by comarca;
    comarca     |   sum   
----------------+---------
 Baix Llobregat |  176188
 Barcelonès     | 1832530
(2 rows)
```

## Dar de baja las ciudades que no tienen comarca y que empiecen por la letra ‘A’.

```sql
club_test=# select ciutat from ciutat where comarca is null and ciutat like 'A%';
 ciutat 
--------
 Atenes
(1 row)

club_test=# delete from ciutat where comarca is null and ciutat like 'A%';
DELETE 1
```

## Cambia la ciudad de la persona que su email contiene la palabra «ionos» por «Badalona».

```sql
club_test=# select * from persona where passaport in (select passaport from mails where mail like '%ionos%');
 passaport |  nom  | cognom  |  ciutat  
-----------+-------+---------+----------
 27673812M | Carme | Peralta | Cadaqués
(1 row)

club_test=# update persona set ciutat='Badalona' where passaport in (select passaport from mails where mail like '%ionos%');
UPDATE 1
```

## Muestra el Email de los socios que no jueguen a fútbol.

```sql
club=# select mail from mails where passaport in (select passaport from fa where esport!='futbol' group by passaport);
          mail           
-------------------------
 carmep@ionos.cat
 carmenperalta@gmail.com
 rrrietto@gamil.com
 robertor@dptia.udr.edu
(4 rows)
```

## Muestra el nombre y apellido de los jefes de los departamentos de ‘administración’ y ‘comercial’

```sql
club_test=# select nom, cognom from persona where passaport in (select passaport from treballador where departament='administració' or departament='comercial');
    nom    |  cognom  
-----------+----------
 Helena    | Pérez
 Sebastià  | Fonollà
 Leonardo  | Soler
 Mick      | Brown
 Magdalena | Pinós
 Jordi     | Parmalat
 Mireia    | Matas
 José      | González
 Daniel    | González
 Carme     | Ferrer
 JeanMarie | Godard
(11 rows)
```

## Cuántas ciudades de la base de datos son costaneras?

```sql
club_test=# select count(ciutat) from ciutat where costanera;
 count 
-------
    14
(1 row)
```

## El nombre, apellido y pasaporte de los empleados que ganen más de $5000?

```sql
club=# select nom, cognom, passaport from persona where passaport in (select passaport from nomines where sou_base > 1200);
    nom    | cognom  | passaport 
-----------+---------+-----------
 Sebastià  | Fonollà | 37228901C
 Leonardo  | Soler   | 29874567M
 Mireia    | Matas   | 51234329N
 Boris     | Santos  | Y3439185D
 JeanMarie | Godard  | 05CK02337
(5 rows)
```

## ¿Cuántos empleados hay en el departamento "administración" en la tabla "empleados"?

```sql
club=# select count(*) from treballador where departament='administració';
 count 
-------
     7
(1 row)
```

## 1. Dime la comarca de los socios que practiquen tennis.

```sql
club=# select distinct comarca from ciutat where ciutat in (select ciutat from persona where passaport in (select passaport from fa where esport='tennis'));
    comarca     
----------------
 Baix Llobregat
 Barcelonès
 Val d'Aran
(3 rows)
```

o

```sql
club=# select distinct comarca from ciutat where ciutat in (select ciutat from fa natural join persona where esport='tennis');
    comarca     
----------------
 Baix Llobregat
 Barcelonès
 Val d'Aran
(3 rows)
```

## 2. Pasaporte, nom i cognom de las personas que hacen fútbol y básquet y sean de la comarca del Barcelonès.

```sql
club=# select passaport, nom, cognom from persona, ciutat where passaport in (select passaport from fa where esport='futbol') and passaport in (select passaport from fa where esport='bàsquet') and persona.ciutat=ciutat.ciutat and comarca='Barcelonès';
 passaport | nom | cognom 
-----------+-----+--------
(0 rows)
```

## 3. Nombre, apellido y pasaporte de los socios que hagan natación ordenados por apellidos.

```sql
club=# select nom, cognom, passaport from persona where passaport in (select passaport from fa where esport='natació') order by cognom desc;
   nom   |  cognom  | passaport 
---------+----------+-----------
 Carles  | Sanàbria | X3478937A
 Roberto | Rietto   | C01X01TN
 Roser   | Puente   | 46372382N
 Carme   | Peralta  | 27673812M
 Anna    | Margalef | 38433548L
 Pere    | Garcia   | 27961020N
 Pere    | Camprubí | 59119283Z
 Sònia   | Aragall  | 39238229E
(8 rows)
```

o

```sql
club=# select nom, cognom, persona.passaport from persona natural join fa where fa.passaport=persona.passaport and esport='natació';
   nom   |  cognom  | passaport 
---------+----------+-----------
 Carme   | Peralta  | 27673812M
 Carles  | Sanàbria | X3478937A
 Sònia   | Aragall  | 39238229E
 Roser   | Puente   | 46372382N
 Roberto | Rietto   | C01X01TN
 Anna    | Margalef | 38433548L
 Pere    | Camprubí | 59119283Z
 Pere    | Garcia   | 27961020N
(8 rows)
```

## 4. Nombre,apellido y comarca de los socios que paguen una cuota mayor a 15 y menor a 20

```sql
club=# select nom, cognom, comarca from persona, ciutat where persona.ciutat=ciutat.ciutat and passaport in (select passaport from fa group by passaport having sum(quota) between 15 and 20);
 nom | cognom | comarca 
-----+--------+---------
(0 rows)
```

## 5. Nombre y apellidos de los trabajadores que sean conocidos por otros trabajadores.

```sql
club=# select nom, cognom from persona where passaport in (select es_coneguda from coneix where es_coneguda in (select passaport from treballador));
  nom  | cognom  
-------+---------
 Sonia | Colmena
(1 row)
```

## 6. Nombre y apellidos de los trabajadores del departamento de administración que recibieron la nómina en 2015

```sql
club=# select nom, cognom from persona where passaport in (select passaport from treballador where departament='administració') and passaport in (select passaport from nomines where periode between '2015-01-01' and '2016-01-01');
   nom    |  cognom  
----------+----------
 Daniel   | González
 Mick     | Brown
 Leonardo | Soler
 José     | González
 Sebastià | Fonollà
(5 rows)
```

## 7. Nombre apellido y ciudad de las personas que practican tennis o futbol de la comarca del barcelonés 

```sql
club=# select nom, cognom, persona.ciutat from persona, ciutat where passaport in (select passaport from fa where esport='tennis' or esport='futbol') and comarca='Barcelonès' and ciutat.ciutat=persona.ciutat;
  nom   |  cognom  |  ciutat   
--------+----------+-----------
 Carles | Sanàbria | Badalona
 Anna   | Sanàbria | Badalona
 Sònia  | Aragall  | Barcelona
 Maria  | Martín   | Barcelona
(4 rows)
```

## 1. Todas las combinaciones posibles entre todos los deportes y todas las personas que vivan en Barcelona

```sql
club=# select * from persona natural join esport where persona.ciutat='Barcelona';
 passaport |  nom   |  cognom  |  ciutat   |    esport     | preu  | jugadors 
-----------+--------+----------+-----------+---------------+-------+----------
 39238229E | Sònia  | Aragall  | Barcelona | natació       | 18.35 |        1
 59119283Z | Pere   | Camprubí | Barcelona | natació       | 18.35 |        1
 27961020N | Pere   | Garcia   | Barcelona | natació       | 18.35 |        1
 19891898A | Maria  | Martín   | Barcelona | natació       | 18.35 |        1
 51234329N | Mireia | Matas    | Barcelona | natació       | 18.35 |        1
 39238229E | Sònia  | Aragall  | Barcelona | voleibol      | 21.50 |        6
 59119283Z | Pere   | Camprubí | Barcelona | voleibol      | 21.50 |        6
 27961020N | Pere   | Garcia   | Barcelona | voleibol      | 21.50 |        6
 19891898A | Maria  | Martín   | Barcelona | voleibol      | 21.50 |        6
 51234329N | Mireia | Matas    | Barcelona | voleibol      | 21.50 |        6
 39238229E | Sònia  | Aragall  | Barcelona | ping-pong     | 12.50 |        1
 59119283Z | Pere   | Camprubí | Barcelona | ping-pong     | 12.50 |        1
 27961020N | Pere   | Garcia   | Barcelona | ping-pong     | 12.50 |        1
 19891898A | Maria  | Martín   | Barcelona | ping-pong     | 12.50 |        1
 51234329N | Mireia | Matas    | Barcelona | ping-pong     | 12.50 |        1
 39238229E | Sònia  | Aragall  | Barcelona | bàsquet       | 10.15 |        5
 59119283Z | Pere   | Camprubí | Barcelona | bàsquet       | 10.15 |        5
 27961020N | Pere   | Garcia   | Barcelona | bàsquet       | 10.15 |        5
 19891898A | Maria  | Martín   | Barcelona | bàsquet       | 10.15 |        5
 51234329N | Mireia | Matas    | Barcelona | bàsquet       | 10.15 |        5
 39238229E | Sònia  | Aragall  | Barcelona | futbol        |  8.60 |       11
 59119283Z | Pere   | Camprubí | Barcelona | futbol        |  8.60 |       11
 27961020N | Pere   | Garcia   | Barcelona | futbol        |  8.60 |       11
 19891898A | Maria  | Martín   | Barcelona | futbol        |  8.60 |       11
 51234329N | Mireia | Matas    | Barcelona | futbol        |  8.60 |       11
 39238229E | Sònia  | Aragall  | Barcelona | handbol       | 12.55 |        7
 59119283Z | Pere   | Camprubí | Barcelona | handbol       | 12.55 |        7
 27961020N | Pere   | Garcia   | Barcelona | handbol       | 12.55 |        7
 19891898A | Maria  | Martín   | Barcelona | handbol       | 12.55 |        7
 51234329N | Mireia | Matas    | Barcelona | handbol       | 12.55 |        7
 39238229E | Sònia  | Aragall  | Barcelona | golf          | 27.90 |        1
 59119283Z | Pere   | Camprubí | Barcelona | golf          | 27.90 |        1
 27961020N | Pere   | Garcia   | Barcelona | golf          | 27.90 |        1
 19891898A | Maria  | Martín   | Barcelona | golf          | 27.90 |        1
 51234329N | Mireia | Matas    | Barcelona | golf          | 27.90 |        1
 39238229E | Sònia  | Aragall  | Barcelona | vela          | 30.85 |        2
 59119283Z | Pere   | Camprubí | Barcelona | vela          | 30.85 |        2
 27961020N | Pere   | Garcia   | Barcelona | vela          | 30.85 |        2
 19891898A | Maria  | Martín   | Barcelona | vela          | 30.85 |        2
 51234329N | Mireia | Matas    | Barcelona | vela          | 30.85 |        2

...skipping 1 line
 59119283Z | Pere   | Camprubí | Barcelona | tennis dobles | 21.50 |        2
 27961020N | Pere   | Garcia   | Barcelona | tennis dobles | 21.50 |        2
 19891898A | Maria  | Martín   | Barcelona | tennis dobles | 21.50 |        2
 51234329N | Mireia | Matas    | Barcelona | tennis dobles | 21.50 |        2
 39238229E | Sònia  | Aragall  | Barcelona | atletisme     | 10.00 |        1
 59119283Z | Pere   | Camprubí | Barcelona | atletisme     | 10.00 |        1
 27961020N | Pere   | Garcia   | Barcelona | atletisme     | 10.00 |        1
 19891898A | Maria  | Martín   | Barcelona | atletisme     | 10.00 |        1
 51234329N | Mireia | Matas    | Barcelona | atletisme     | 10.00 |        1
 39238229E | Sònia  | Aragall  | Barcelona | tennis        | 28.05 |        1
 59119283Z | Pere   | Camprubí | Barcelona | tennis        | 28.05 |        1
 27961020N | Pere   | Garcia   | Barcelona | tennis        | 28.05 |        1
 19891898A | Maria  | Martín   | Barcelona | tennis        | 28.05 |        1
 51234329N | Mireia | Matas    | Barcelona | tennis        | 28.05 |        1
(55 rows)
```
o
```sql
club=# select * from persona natural join fa where persona.ciutat='Barcelona';
 passaport |  nom  |  cognom  |  ciutat   |  esport   | quota 
-----------+-------+----------+-----------+-----------+-------
 39238229E | Sònia | Aragall  | Barcelona | natació   | 20.19
 59119283Z | Pere  | Camprubí | Barcelona | natació   | 20.19
 27961020N | Pere  | Garcia   | Barcelona | natació   | 20.19
 19891898A | Maria | Martín   | Barcelona | ping-pong | 11.33
 27961020N | Pere  | Garcia   | Barcelona | voleibol  | 15.95
 59119283Z | Pere  | Camprubí | Barcelona | voleibol  | 15.95
 39238229E | Sònia | Aragall  | Barcelona | futbol    | 16.94
 59119283Z | Pere  | Camprubí | Barcelona | atletisme |  0.00
 19891898A | Maria | Martín   | Barcelona | tennis    | 26.02
(9 rows)
```

## 2. Muestra las ciudades que no comiencen por la letra A y los habitantes sean menos de 100000

```sql
club=# select ciutat from ciutat where ciutat not like 'A%' and habitants < 100000;
    ciutat     
---------------
 Cadaqués
 Sitges
 Tiana
 Esplugues
 Tredòs
 Viladecans
 Roses
 Montgat
 Tona
 mart
 Castelldefels
(11 rows)
```

## 3. Nombre y apellidos de las personas de la BD que sean socios, agrupadas por deporte

```sql
club=# select nom, cognom, esport from persona natural join fa order by esport asc;
   nom   |  cognom  |    esport     
---------+----------+---------------
 Mick    | Brown    | atletisme
 Pere    | Camprubí | atletisme
 Roberto | Rietto   | atletisme
 Carles  | Sanàbria | atletisme
 Anna    | Sanàbria | atletisme
 Rita    | Derbeken | bàsquet
 Klauss  | Stallman | bàsquet
 Anna    | Sanàbria | bàsquet
 Miquel  | Vila     | bàsquet
 Mick    | Brown    | bàsquet
 Carles  | Sanàbria | futbol
 Carme   | Peralta  | futbol
 Sònia   | Aragall  | futbol
 Roser   | Puente   | futbol
 Klauss  | Stallman | futbol
 Rita    | Derbeken | futbol
 Anna    | Sanàbria | golf
 Anna    | Margalef | natació
 Carme   | Peralta  | natació
 Roser   | Puente   | natació
 Pere    | Garcia   | natació
 Carles  | Sanàbria | natació
 Pere    | Camprubí | natació
 Sònia   | Aragall  | natació
 Roberto | Rietto   | natació
 Carles  | Sanàbria | ping-pong
 Carme   | Peralta  | ping-pong
 Roberto | Rietto   | ping-pong
 Anna    | Margalef | ping-pong
 Maria   | Martín   | ping-pong
 José    | Sanlúcar | ping-pong
 Anna    | Sanàbria | tennis
 Miquel  | Vila     | tennis
 Camila  | Noriega  | tennis
 Maria   | Martín   | tennis
 Anna    | Sanàbria | tennis dobles
 Carme   | Peralta  | tennis dobles
 Miquel  | Vila     | vela
 Mick    | Brown    | vela
 Jesús   | Hortesa  | vela

...skipping 1 line
 Camila  | Noriega  | voleibol
 Pere    | Garcia   | voleibol
 Pere    | Camprubí | voleibol
 Jesús   | Hortesa  | voleibol
(45 rows)
```

## 4. Muestra el nombre de las personas que vivan en las ciudades de la comarca del Barcelonès con más de 60000 personas

```sql
club=# select nom from persona natural join ciutat where comarca='Barcelonès' and habitants > 60000;
  nom   
--------
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

## 5. Indica el nombre y pasaporte con una nómina superior a 200 e inferior a 700

```sql
club=# select distinct nom, passaport from persona natural join nomines where sou_base between 200 and 700;
  nom   | passaport 
--------+-----------
 Daniel | 48377283A
 José   | 45847558W
(2 rows)
```

## 6. Indica nombres y deportes de las personas que empiecen por 'A' y que hagan algún deporte

```sql
club=# select nom, esport from persona natural join fa where nom like 'A%';
 nom  |    esport     
------+---------------
 Anna | golf
 Anna | tennis dobles
 Anna | natació
 Anna | ping-pong
 Anna | bàsquet
 Anna | atletisme
 Anna | tennis
(7 rows)
```
