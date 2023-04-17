# Nuevas preguntas XPath

## ¿Cuál es el nombre de la capital de España?

`/mondial/country[name/text() = 'Spain']/province/name[text() = 'Madrid']/text()`

## ¿Cuántas regiones administrativas hay en Italia?


## ¿Cuál es la extensión territorial de Portugal?

`/mondial/country[name/text() = 'Portugal']/@area/string()`

## ¿Cuál es el nombre del río más largo de Europa?

`/mondial/river[max(length)]/name/text()`

## ¿Cuántos habitantes tiene la ciudad de París?

`/mondial/country[name/text() = "France"]/province/city[name/text() = 'Paris']/population[@year='2011']/text()`

## ¿Cuál es la longitud del río Támesis?

`/mondial/river[name/text() = 'Thames']/length/text()`

## ¿En qué país se encuentra la ciudad de Belgrado?

`//city[name/text() = 'Belgrade']/../name/text()`

## ¿Cuántos kilómetros cuadrados tiene el territorio de Suiza?

`//country[name/text() = 'Switzerland']/@area/string()`

## ¿Cuál es la altura del Monte Elbrus?

`//name[text() = 'Elbrus']/../elevation/text()`

## ¿Cuál es el nombre del río que pasa por Berlín?

``

## ¿Cuántos habitantes tiene la ciudad de Moscú?

`//name[text() = 'Moscow']/../population[last()]/text()`

## ¿Cuál es el país más grande de Europa en términos de superficie?

`//country[@area = max(//country/@area/string())]/name/text()`

## ¿En qué país se encuentra la ciudad de Cracovia?

`//name[text() = 'Kraków']/../../../name/text()`

## ¿Cuál es la longitud del río Rin?

`//river[name/text() = 'Rhein']/length/text()`

## ¿Cuántos habitantes tiene la ciudad de Madrid?

`//city/name[text() = 'Madrid']/../population[@year = max(//city/name[text() = 'Madrid']/../population/@year)]/string()`

## ¿Cuál es la altura del Monte Blanc?

## ¿Cuál es el nombre del río que pasa por Budapest?

## ¿Cuántos habitantes tiene la ciudad de Roma?

`//city/name[text() = 'Rome']/../population[@year = max(//city/name[text() = 'Rome']/../population/@year)]/string()`

## ¿Cuántos países se encuentran en la península ibérica?

## ¿En qué país se encuentra la ciudad de Viena?

`//city/name[text() = 'Vienna']/../population[@year = max(//city/name[text() = 'Vienna']/../population/@year)]/string()`

## ¿Cuál es la longitud del río Volga?

``//river[name/text() = 'Volga']/length/text()``

## ¿Cuántos habitantes tiene la ciudad de Berlín?

`//city/name[text() = 'Berlin']/../population[@year = max(//city/name[text() = 'Berlin']/../population/@year)]/string()`

## ¿Cuál es la altura del Monte Olimpo?

`//name[text() = 'Olympos']/../elevation/text()`

## ¿En qué país se encuentra la ciudad de Edimburgo?

`//name[text()='Edinburgh']/../../name/text()`

## ¿Cuántos habitantes tiene la ciudad de Londres?

`//city/name[text() = 'London']/../population[@year = max(//city/name[text() = 'London']/../population/@year)]/string()`

## ¿Cuál es la extensión territorial de Noruega?

`//name[text() = 'Norway']/../@area/string()`

## ¿En qué país se encuentra la ciudad de Lisboa?

`//name[text() = 'Lisbon']/../../../name/text()`

## ¿Cuál es la longitud del río Danubio?



## ¿Cuántos habitantes tiene la ciudad de Estocolmo?

## ¿Cuál es la altura del Monte Etna?

## ¿En qué país se encuentra la ciudad de Copenhague?

## ¿Cuál es el nombre del río que pasa por Ámsterdam?

## ¿Cuántos habitantes tiene la ciudad de Atenas?

## ¿Cuántos países se encuentran en la península escandinava?

## ¿En qué país se encuentra la ciudad de Oslo?

## ¿Cuál es la longitud del río Elba?

## ¿Cuál es la altura del Monte Pico?

## ¿En qué país se encuentra la ciudad de Helsinki?

## ¿Cuál es el nombre del río que pasa por Varsovia?

## ¿Cuántos habitantes tiene la ciudad de Budapest?

## ¿Cuál es la extensión territorial de Islandia?

## ¿En qué país se encuentra la ciudad de Bucarest?

## ¿Cuál es la longitud del río Loira?

## ¿Cuántos países hay en el documento XML?

## ¿Cuál es la capital de Austria?

## ¿Qué países tienen costas en el mar Mediterráneo?

## ¿Cuántos idiomas oficiales tiene Suiza?

## ¿Qué países limitan con España?
