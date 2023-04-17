club=# select * from ciutat;
     ciutat     | habitants | costanera |    comarca     
----------------+-----------+-----------+----------------
 Cadaqués       |      2938 | t         | Alt Empordà
 San Francisco  |    805235 | t         | 
 Rio de Janeiro |   6320446 | t         | 
 París          |   2249975 | f         | 
 Lleida         |    139809 | f         | Segrià
 New York       |  18897109 | t         | 
 Sitges         |     29140 | t         | Garraf
 Tiana          |      8221 | f         | Maresme
 Esplugues      |     46667 | f         | Baix Llobregat
 Atenes         |    664046 | t         | 
 Tredòs         |       154 | f         | Val d'Aran
 Barcelona      |   1611822 | t         | Barcelonès
 Viladecans     |     65444 | t         | Baix Llobregat
 Roma           |   2796102 | t         | 
 Roses          |     19891 | t         | Alt Empordà
 Amposta        |     21511 | t         | Montsià
 Montgat        |     12277 | t         | Maresme
 Tona           |      8085 | f         | 
 mart           |         2 | f         | martelones
 Badalona       |    220708 | t         | Barcelonès
 Castelldefels  |     64077 | t         | Baix Llobregat
(21 rows)

club=# select * from comarca;
    comarca     
----------------
 Barcelonès
 Alt Empordà
 Baix Llobregat
 Val d'Aran
 Garraf
 Segrià
 Montsià
 Maresme
 Tarragonès
 martelones
(10 rows)

club=# select * from coneix;
  coneix   | es_coneguda 
-----------+-------------
 27673812M | X3478937A
 X3478937A | 27673812M
 27673812M | 47548338K
 27673812M | 294394950
 294394950 | 27673812M
 294394950 | C00001549
 45493393Z | 32234958K
 32234958K | 42065765F
 X4534332C | 27827228B
 27827228B | 42065765F
(10 rows)

club=# select * from esport;
    esport     | preu  | jugadors 
---------------+-------+----------
 natació       | 18.35 |        1
 voleibol      | 21.50 |        6
 ping-pong     | 12.50 |        1
 bàsquet       | 10.15 |        5
 futbol        |  8.60 |       11
 handbol       | 12.55 |        7
 golf          | 27.90 |        1
 vela          | 30.85 |        2
 tennis dobles | 21.50 |        2
 atletisme     | 10.00 |        1
 tennis        | 28.05 |        1
(11 rows)

club=# select * from fa;
 passaport |    esport     | quota 
-----------+---------------+-------
 47548338K | golf          | 24.15
 27673812M | tennis dobles | 21.50
 47548338K | tennis dobles | 21.50
 27673812M | natació       | 20.19
 X3478937A | natació       | 20.19
 39238229E | natació       | 20.19
 46372382N | natació       | 20.19
 59119283Z | natació       | 20.19
 C01X01TN  | natació       | 20.19
 38433548L | natació       | 20.19
 27961020N | natació       | 20.19
 C01X01TN  | ping-pong     | 11.33
 38433548L | ping-pong     | 11.33
 32234958K | ping-pong     | 11.33
 27673812M | ping-pong     | 11.33
 X3478937A | ping-pong     | 11.33
 19891898A | ping-pong     | 11.33
 45493393Z | voleibol      | 15.95
 42065765F | voleibol      | 15.95
 27961020N | voleibol      | 15.95
 32234958K | voleibol      | 15.95
 59119283Z | voleibol      | 15.95
 38474483Z | vela          | 24.86
 45493393Z | vela          | 24.86
 C00001549 | vela          | 24.86
 27673812M | futbol        | 16.94
 X3478937A | futbol        | 16.94
 294394950 | futbol        | 16.94
 39238229E | futbol        | 16.94
 187448338 | futbol        | 16.94
 46372382N | futbol        | 16.94
 C00001549 | bàsquet       |  9.46
 294394950 | bàsquet       |  9.46
 187448338 | bàsquet       |  9.46
 47548338K | bàsquet       |  9.46
 38474483Z | bàsquet       |  9.46
 X3478937A | atletisme     |  0.00
 C01X01TN  | atletisme     |  0.00
 C00001549 | atletisme     |  0.00
 59119283Z | atletisme     |  0.00
 
club=# select * from mails;
 passaport |             mail             
-----------+------------------------------
 27673812M | carmep@ionos.cat
 27673812M | carmenperalta@gmail.com
 05CK02337 | jmgodard@ille.fr
 05CK02337 | jean.marie.godard@ille.up.fr
 05CK02337 | jmgodard@yahoo.com
 C01X01TN  | rrrietto@gamil.com
 19891898A | robertor@dptia.udr.edu
 38223890Y | jparmalat@uab.edu  
 38223890Y | jordiparmalat@gmail.com  
 38223890Y | jordiparmalat@yahoo.com
 Y3439185D | rexstan12@gmail.com
 Y4394950D | hepe@esportespot.cat 
 37228901C | sefo@esportespot.cat 
 29874567M | leso@esportespot.cat 
 05CK02337 | jema@esportespot.cat 
 C00021549 | mibr@esportespot.cat 
 36940559Y | mapi@esportespot.cat 
 51234329N | mima@esportespot.cat 
 45847558W | jogo@esportespot.cat 
 48377283A | dago@esportespot.cat 
 37866969E | cafe@esportespot.cat 
 27827228B | soco@esportespot.cat 
 X4534332C | gaco@esportespot.cat 
 Y3439185D | bosa@esportespot.cat 
(24 rows)

club=# select * from nomines;
 passaport |  periode   | sou_base | retencio 
-----------+------------+----------+----------
 37228901C | 2015-01-28 |  1525.67 |     8.15
 37228901C | 2014-12-29 |  1530.80 |     8.15
 37228901C | 2014-11-29 |  1523.42 |     8.15
 37228901C | 2014-10-29 |  1523.42 |     8.15
 37228901C | 2014-09-28 |  1523.42 |     8.15
 37228901C | 2014-08-30 |  1523.42 |     8.15
 37228901C | 2014-07-29 |  1530.80 |     8.15
 29874567M | 2015-01-28 |  1213.93 |    10.25
 29874567M | 2014-12-29 |  1213.93 |    10.25
 29874567M | 2014-11-29 |  1213.93 |    10.25
 29874567M | 2014-10-29 |  1201.46 |    10.25
 29874567M | 2014-09-28 |  1201.46 |     6.80
 29874567M | 2014-08-30 |  1201.46 |     6.80
 29874567M | 2014-07-29 |  1201.46 |     6.80
 29874567M | 2014-06-29 |  1213.93 |     6.80
 29874567M | 2014-05-31 |  1213.93 |     6.80
 29874567M | 2014-04-30 |  1201.46 |     6.80
 29874567M | 2014-03-29 |  1201.46 |     6.80
 29874567M | 2014-02-28 |  1201.46 |     6.80
 05CK02337 | 2014-01-31 |  1450.69 |     2.00
 C00021549 | 2015-01-28 |   812.30 |     3.15
 C00021549 | 2014-12-29 |   812.30 |     3.15
 C00021549 | 2014-11-29 |   915.35 |     3.15
 C00021549 | 2014-10-29 |   915.35 |     3.15
 C00021549 | 2014-09-28 |   915.35 |     3.15
 C00021549 | 2014-08-30 |   915.35 |     3.15
 C00021549 | 2014-07-29 |   812.30 |     3.15
 C00021549 | 2014-06-29 |   812.30 |     3.15
 C00021549 | 2014-05-31 |   915.35 |     3.15
 C00021549 | 2014-04-30 |   801.46 |     3.15
 36940559Y | 2015-01-28 |  1090.23 |     5.00
 36940559Y | 2014-12-29 |  1090.23 |     5.00
 36940559Y | 2014-11-29 |  1090.23 |     5.00
 38223890Y | 2015-01-28 |  1102.43 |     9.10
 38223890Y | 2014-12-29 |  1102.43 |     9.10
 38223890Y | 2014-11-29 |  1102.43 |     7.35
 38223890Y | 2014-10-29 |  1060.90 |     7.35
 38223890Y | 2014-09-28 |  1060.90 |     2.00
 51234329N | 2015-01-28 |  1232.02 |     2.00
 45847558W | 2015-01-28 |   729.45 |     3.59

club=# select * from pagament_soci;
 passaport |   nom   |  cognom  | pagament 
-----------+---------+----------+----------
 39238229E | Sònia   | Aragall  |    37.13
 C00001549 | Mick    | Brown    |    34.32
 59119283Z | Pere    | Camprubí |    36.14
 187448338 | Rita    | Derbeken |    26.40
 27961020N | Pere    | Garcia   |    36.14
 45493393Z | Jesús   | Hortesa  |    40.81
 38433548L | Anna    | Margalef |    31.52
 19891898A | Maria   | Martín   |    37.35
 42065765F | Camila  | Noriega  |    41.97
 27673812M | Carme   | Peralta  |    69.96
 46372382N | Roser   | Puente   |    37.13
 C01X01TN  | Roberto | Rietto   |    31.52
 X3478937A | Carles  | Sanàbria |    48.46
 47548338K | Anna    | Sanàbria |    81.13
 32234958K | José    | Sanlúcar |    27.28
 294394950 | Klauss  | Stallman |    26.40
 38474483Z | Miquel  | Vila     |    60.34
(17 rows)

club=# select * from persona;
 passaport |    nom    |  cognom  |    ciutat     
-----------+-----------+----------+---------------
 27673812M | Carme     | Peralta  | Cadaqués
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
(31 rows)

club=# select * from soci;
 passaport |          alta          
-----------+------------------------
 27673812M | 2010-03-21 00:00:00+00
 X3478937A | 2011-09-12 00:00:00+00
 47548338K | 2013-04-01 00:00:00+00
 38474483Z | 2014-03-02 00:00:00+00
 45493393Z | 2011-05-31 00:00:00+00
 C00001549 | 2009-06-30 00:00:00+00
 294394950 | 2012-06-14 00:00:00+00
 39238229E | 2011-11-14 00:00:00+00
 187448338 | 2013-07-17 00:00:00+00
 46372382N | 2009-12-15 00:00:00+00
 C01X01TN  | 2009-01-09 00:00:00+00
 38433548L | 2012-12-18 00:00:00+00
 32234958K | 2010-07-16 00:00:00+00
 42065765F | 2013-04-27 00:00:00+00
 59119283Z | 2012-10-26 00:00:00+00
 27961020N | 2014-10-09 00:00:00+00
 19891898A | 2014-12-09 00:00:00+00
(17 rows)

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