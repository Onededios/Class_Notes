# Repaso Examen M05 UF1 NF1

## ¿Qué es un programa informático?

Un programa informático es aquel que ejecuta un conjunto de ordenes secuencialmente y contiene estructuras de control de selección e iteración.

## ¿Qué tipos de estructuras de control existen en un programa informático?

En un programa informático existen las estructuras de control secuenciales, de selección y de iteración.

## ¿Para qué están orientados los programas informáticos?

Los programas informáticos están orientados a resolver problemas específicos, utilizando conjuntos y tipos de datos específicos para ese programa.

## ¿Cuál es la estructura de un programa informático?

Lenguajes compilados:
`Código fuente -> Compilador -> Código Objeto -> Enlazador -> Código Ejecutable`

Lenguajes interpretados:
`Código fuente -> Intérprete -> Traducción/Ejecución`

Máquinas virtuales:
`Código fuente -> Compilador -> Bytecode -> Máquina Virtual -> Ejecución`

## ¿Qué es el código fuente en un programa informático?

El código fuente es aquel entendible por una persona formada en programación. Ésta puede llegar a interpretar el funcionamiento del mismo.
El código fuente no puede ser interpretado por la CPU, ya que ésta únicamente entiende binario. El código fuente ha de pasar por varios procesos para ser traducido a binario, así como un compilador o un intérprete.

## ¿Qué es el compilador en un programa informático?

Un compilador es un programa o herramienta que va acompañada de un lenguaje de programación y es la encargada de comprobar la sintaxis del código fuente y si ésta es correcta, compilarlo en un código objeto incompleto (aún sin bibliotecas), pero interpetable (no ejecutable) por la CPU.

## ¿Qué es el código objeto en un programa informático?

El código objeto es el resultado de la compilación del código fuente realizada por el compilador.
Éste código es la traducción del código fuente en binario, interpetable pero no ejecutable por la CPU, pues no contiene las bibliotecas.

## ¿Qué es el enlazador en un programa informático?

En elazador es la herramienta o programa encargada de añadir/adjuntar las bibliotecas externas necesarias para ejecutar el código objeto, resultando así en un código ejecutable por el procesador.

## ¿Qué es el código ejecutable en un programa informático?

El código ejecutable es el resultado final del proceso de compilación de un código fuente.
És un archivo binario que contiene el código con todas las bibliotecas necesarias para ser ejecutado por el procesador.

## ¿Qué es un lenguaje de programación?

Un lenguaje de programación es un método de comunicación entre humano y máquina. Enviándole éste instrucciones secuenciales en un lenguaje interpetable por la misma.

## ¿Qué es un lenguaje de programación de 1ª generación?

Un lenguaje de programación de 1ª generación es aquel escrito en código máquina o binario y es directamente interpretable y ejecutable por el procesador.
Es el más eficiente, pues no requiere de otras herramientas para ser procesado y ejecutado.
Es muy dificil de enteder a simple vista por una persona y por lo tanto muy difícil de mantener.

## ¿Qué es un lenguaje de programación de 2ª generación?

Un lenguaje de programación de 2ª generación es aquel escrito en ensamblador, directamente interpretable y ejecutable por el procesador, pues el ensamblador se encarga de traducirlo a instrucciones de la CPU.
Es igual de eficiente que uno de 1º generación, pues tampoco requiere de otras herramientas para ser procesado y ejecutado.
Es de gran ayuda respecto al de anterior generación, ya que es más visual y permite un mejor entendimiento del mismo, igualmente el mantenimiento del mismo es muy difícil de realizar por un programador.

## ¿Qué es un lenguaje de programación de 3ª generación?

Un lenguaje de programación de 3ª es un lenguaje estructurado mediante ordenes secuenciales y cuenta con estructuras de control condicionales e iterativas.

Se pueden clasificar en 3 tipos según el proceso de ejecución para cada uno:

- **Compilados**:
Los lenguajes de programación compilados así como **C, C++, Pascal o Cobol** son aquellos que siguen el siguiente proceso para ser ejecutados: `Código fuente -> Compilador -> Código Objeto -> Enlazador -> Código Ejecutable`
Son los más optimizados y eficientes, pero tienen poca portabilidad de ejecución.

- **Interpretados**:
Los lenguajes de programación interpretados así como **Python, C#, JavaScript o PHP** son aquellos que siguen el siguiente proceso para ser ejecutados: `Código fuente -> Intérprete -> Traducción/Ejecución`
El código fuente pasa por un intérprete genérico para ese lenguaje que traduce y ejecuta el código instrucción por instrucción.
Es el más lento debido a que se ejecuta y traduce a la vez, por lo que no está ejecutado, pero es el más portable, pues para ejecutar un código interpretado únicamente necesitas un intérprete.

- **Híbridos/Máquinas virtuales**:
Los lenguajes de programación híbridos así como **Java o C#** son aquellos que siguen el siguiente proceso para ser ejecutados: `Código fuente -> Compilador -> ByteCode -> Máquina Virtual -> Ejecución`
El compilador compila el código fuente en un archivo ByteCode transferible y ejecutable por cualquier máquina virtual de dicho lenguaje. Lo ventaja que tiene utilizar los lenguajes híbridos es que el código es ilegible por una persona, ya que se encuentra en binario.
Es el lenguaje intermédio entre los lenguajes compilados e interpretados, ya que es más portable pero menos eficiente que unos compilado y menos portable pero más eficiente que uno interpretado.

## ¿Cuál es la diferencia entre un lenguaje de programación compilado e interpretado?

Que el compilado está completamente optimizado para la ejecución del código y uno interpretado se traduce a la vez que se va ejecutando instrución por instrución, haciendolo mucho más lento de ejecutar que uno compilado, pero también mucho más portable.

## ¿Qué son las máquinas virtuales en un programa informático?

Las encargadas de ejecutar el bytecode dependiendo del lenguaje de programación empleado.

## ¿Qué son los lenguajes de programación de propósito específico?

Los lenguajes de 4ª generación o de propósito específico así como **SQL, Matlab, HTML o Awk** son aquellos orientados a trabajar con grandes cantidades de datos, así como para generar informes, representaciones gráficas de funciones matemáticas u consultas sobre bases de datos.

## ¿Qué lenguajes de programación son compilados y cuáles son interpretados?

Estos podrían ser ejemplos de lenguajes de programación compilados: **C, C++, Cobol, Pascal**
Estos podrían ser ejemplos de lenguajes de programación interpretados: **Python, PHP, Javascript, Perl, Bash**

## ¿Cuál es la ventaja de los lenguajes interpretados sobre los lenguajes compilados?

La ventaja fundamentdal de los lenguajes interpretados respecto a los lenguajes compilados es que éstos son más portables, permitiendo la ejecución de los mismos en todas las plataformas, siempre que se tenga el intérprete para ese lenguaje.

## ¿Qué es la desventaja de los lenguajes interpretados respecto a los lenguajes compilados?

La desventaja más grande de los lenguajes interpretados respecto a los lenguajes compilados es que son mucho más lentos, pues se traducen a la vez que se van ejecutando, instrucción por instrucción, lo que hace una pésima optimización en comparación con los otros.

## ¿Qué es la portabilidad en un programa informático?

La portabilidad es la capacidad de ejecución de un programa informático en diversas y diferentes plataformas.

## ¿Por qué se prioriza el mantenimiento sobre la eficiencia en los lenguajes de programación de 3ª generación?

Porque grácias a la sintaxis más sencilla u humana respecto al código máquina, se pueden realizar códigos y proyectos altamente grandes y complejos.

## ¿Cuál es la diferencia entre un lenguaje de programación de alto nivel y un lenguaje de programación de bajo nivel?

Que un lenguaje de programación de alto nivel siempre será más lento en la ejecución del mismo que uno de bajo nivel, pues a éste se le tienen que realizar varios procesos para ser ejecutado. Por el contrario, los lenguajes de programación de alto nivel son mucho más fáciles de entender y mantener que los lenguajes de bajo nivel.

## ¿Qué es el bytecode en un programa informático?

El bytecode es el código binario especial para la máquina virtual, generado por un compilador, ejecutable en cualquier máquina virtual del mismo tipo de lenguaje.

## ¿Qué es la máquina virtual en un programa informático?

La máquina virtual es la encargada de interpretar y ejecutar el código binario especial del bytecode generado por el compilador de un lenguaje híbrido de alto nivel.

## ¿Qué lenguajes de programación utilizan máquinas virtuales?

Hay varios lenguajes para ser ejecutados en máquina virtuales, así como **Python, Java o C#**.

## ¿Qué ventajas tiene utilizar máquinas virtuales en los lenguajes de programación?

Que el código es transferible y ejecutable por cualquier máquina virtual del mismo lenguaje. También hace muy dificil la interpretación del Bytecode por una persona.

## ¿Qué son los datos o parámetros de entrada o salida en un programa informático?

Los parámetros de entrada o salida son los datos que requiere un método o constructor para poder funcionar o llevar a cabo las instrucciones especificadas dentro del mismo.

## ¿Qué tipos de datos o parámetros de entrada o salida existen en un programa informático?

Existen muchos tipos desde primitivos como **int, float, double, char** a tipos de objetos como **String, Integer, Long, Float**.

## ¿Por qué un ordenador o CPU no es capaz de interpretar un código fuente?

Básicamente porque la CPU únicamente entiende instrucciones en binario.

## ¿Qué ventaja tiene el lenguaje ensamblador sobre el lenguaje de máquina?

Que es más fácil de entender/interpretar por una persona, y por o tanto, más fácil de mantener.

## ¿Cuál es la desventaja del lenguaje ensamblador respecto al lenguaje de máquina?

Realmente no hay ninguna desventaja, ya que para los dos el procesador tiene que realizar una traducción de la instrucción a binario.

## ¿Por qué es más utilizado el lenguaje de alto nivel en la actualidad?

Porque es mucho más fácil de mantener y es mucho más escalable que el lenguaje de bajo nivel.

## ¿Cuál es la desventaja de los lenguajes de programación de propósito específico?

Que no están orientados a ejecutar ordenes secuencialmente, si no más a consultas o resolución de funciones matemáticas.

## ¿Qué tipos de lenguajes de programación de propósito específico existen?

Existen varios tipos de lenguajes de programación de propósito específico, así como **SQL, MATLAB, HTML, Awk, Bash, LaTeX, XPath**.

## ¿Qué son los lenguajes lógicos y por qué han perdido popularidad en comparación con otros lenguajes de programación?

Los lenguajes de 5ª generación o lenguajes lógicos son los aquellos orientados a trabajar con inteligencias artificiales.
Actualmente están es desuso, incluso en el ámbito de las inteligencias artificiales. Han sido desbancados por los lenguajes de 3ª y 4ª generación.
Algunos ejemplos de lenguajes de programación podrían ser **Prolog, Lisp, Golog, Alloy**.

## ¿Qué es el paradigma imperativo/estructurado en programación y cuál es su estructura básica?

El paradigma imperativo/estructurado se basa en ejecutar ordenes de manera secuencial, alterando los datos en memoria.
Su estructura básica sigue estructuras de control **secuenciales**, **condicionales** e **iterativas**.

## ¿Qué técnica de diseño se utiliza en el paradigma imperativo/estructurado?

Se utiliza la técnica top-down o diseño descente, que se basa en una técnica modular que divide los problemas en problemas más pequeños, simples e independientes, resolviendo así el problema de manera eficiente.

## ¿En qué consiste el paradigma de objetos en programación y cuáles son sus componentes principales?

El paradigma de objetos o programación orientada a objetos se basa en la abstracción de objetos del mundo real, recreando o representando sus métodos/funciones y atributos más significativos u necesarios en un programa.

Sus componentes principales son:

- **Abstracción**: Clases.
- **Encapsulación**: Privacidad (private, public, package, protected).
- **Modularidad**: Independencia entre componentes.
- **Jerarquía**: Herencia, asociación, composición y agregación
- **Polimorfismo**: Sobrecarga y sobreescritura

## ¿Qué es la sobrecarga y la sobreescritura en el paradigma de objetos?

La sobrecarga en el paradigma de objetos es la definición de un método, que se basa en crear un método en la misma clase que se llame igual que otro método, pero con parámetros de entrada diferentes.

La sobreescritura en el paradigma de objetos es la redefinición de un método, que se basa en cambiar la funcionalidad, contenido, resultado o ejecución de un método heredado de una clase o en la misma clase.

## ¿Qué es el paradigma funcional en programación y en qué se basa?

El paradigma funcional es la combinación de funciones matemáticas para reducir la complejidad de una función. Orientado al ámbito de las matemáticas y a resolver expresiones Lambda.

## ¿Cuáles son algunos ejemplos de lenguajes de programación que utilizan el paradigma funcional?

Algunos ejemplos que utilizan el paradigma funcional pueden ser **Matlab, F# o Haskell**.

## ¿En qué consiste el paradigma lógico en programación y para qué fue creado originalmente?

El paradigma lógico es aquel en el que se aplican las reglas de la lógica para inferir conclusiones a partir de datos.
Creado para trabajar con la IA, pero actualmente en desuso.

## ¿Cuáles son algunos ejemplos de lenguajes de programación que utilizan el paradigma lógico?

Algunos ejemplos que utilizan el paradigma lógico pueden ser **Prolog, Lisp o Golog**.
