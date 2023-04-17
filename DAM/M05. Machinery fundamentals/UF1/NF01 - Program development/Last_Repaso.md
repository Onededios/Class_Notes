# Last repaso

## ¿Qué es un programa informático?

Un programa informático es aquel que se compone de instrucciones que se ejecutan de manera secuencial, mediante el empleo de estructuras de control secuenciales, condicionales u iterativas, como también de parámetros de entrada u salida.

## ¿Qué tipos de estructuras de control existen en un programa informático?

En un programa informático existen 3 tipos de estructuras de control, las secuenciales, condicionales u iterativas.

## ¿Para qué están orientados los programas informáticos?

Los programas informáticos están orientados a la resolución de problemas específicos, con conjuntos y tipos de datos diferentes para cada tipo de empleo del programa.

## ¿Cuál es la estructura de un programa informático?

Compilados (**C, C++, Cobol, Pascal**):
`Código fuente -> Compilador -> Código Objeto -> Enlazador -> Código Ejecutable`

Interpretados (**Python, Ruby, PHP, JavaScript**):
`Código fuente -> Intérprete -> Traducción/Ejecución`

Híbridos (**Java, C#**):
`Código fuente -> Compilador -> Bytecode -> Máquina Virtual -> Ejecución`

## ¿Qué es el código fuente en un programa informático?

El código fuente es aquel interpretable y en el que un programador formado puede entender su funcionamiento.
En cambio una CPU no puede entender el código fuente, pues únicamente entiende binario.

## ¿Qué es el compilador en un programa informático?

El compilador es una herramienta o programa que siempre va a asociado a un lenguaje de programación.
Se encarga de revisar que la sintaxis del código fuente es correcta, y si lo és, genera un código objeto en binario del código fuente.
Éste si que es interpretable por la CPU, pues está en binario, pero aún no es ejecutable porque no contiene las bibliotecas.

## ¿Qué es el código objeto en un programa informático?

El código objecto es el código fuente procesado por el compilador y traducido a binario. Éste es interpretable por la CPU, pero aún requiere de bibliotecas para poder ser ejecutado.

## ¿Qué es el enlazador en un programa informático?

El enlazador es la herramienta o programa que realiza el proceso final para la posible ejecución de un programa, añadiendo u adjuntando las bibliotecas al código objeto generado por el compilador.

## ¿Qué es el código ejecutable en un programa informático?

El código ejecutable es el código fuente que ha pasado por todo un proceso para que sea entendible y ejecutable por el procesador de la máquina. Está en binario y contiene todas las bibliotecas necesarias para que una CPU, en ese entorno, lo pueda ejecutar.

## ¿Qué es un lenguaje de programación?

Un lenguaje de programación es aquel empleado para mandar ordenes ejecutables y estrictas a un ordenador mediante la introducción de datos, así como para garantizar la comunicación entre humano-máquina.

## ¿Qué es un lenguaje de programación de 1ª generación?

Un lenguaje de programación de 1ª generación o código máquina es la manera de comunicarse directamente con la CPU mediante el uso de código binario.
Es el más eficiente ya que no requiere de otras herramientas para ejecutarse, pero muy difícil de comprender y realizar un mantenimiento por un humano.
Está muy ligado al hardware de la máquina, así como a la arquitectura de la CPU.

## ¿Qué es un lenguaje de programación de 2ª generación?

Un lenguaje de programación de 2ª generación o ensamblador es otra manera de comunicarse directamente con la CPU mediante el uso de instrucciones más sencillas que el código binario.
Es altamente eficiente, pues al igual que el anterior, no requiere de otras herramientas para ejecutarse.
Pese a ser una gran ayuda para el programador, sigue siendo muy difícil de comprender y realizar un mantenimiento del mismo por un humano.
Sigue estando my ligado al hardware de la máquina, así como a su arquitectura.

## ¿Qué es un lenguaje de programación de 3ª generación?

Los lenguajes de programación de 3ª generación son los actualmente más utilizados para la realización de programas complejos gracias a que son fácilmente interpretables y presentan una sintaxis comprensible por un programador formado.
No son tan eficientes como los anteriores, ya que requieren de herramientas como compiladores, enlazadores, intérpretes o máquina virtuales para poder ejecutarse. Pero en cambio, gracias a su fácil sintaxis, son mucho más fáciles de mantener y presentan una mayor escalabilidad respecto a los anteriores.
Entre ellos podemos encontrar lenguajes compilados, interpretados u híbridos.

## ¿Qué son los lenguajes de programación de propósito específico?

Los lenguajes de programación de propósito específico o lenguajes de 4ª generación son aquellos lenguajes orientados a trabajar con grandes cantidades de datos. Así como para realizar consultas en bases de datos, generar informes o representar funciones matemáticas.
Algunos ejemplos de los mismos pueden ser **Matlab, SQL, Awk, R, HTML**

## ¿Qué son los lenguajes lógicos?

Los lenguajes lógicos son lenguajes de programación orientados a trabajar con las Inteligencias Artificiales, pero actualmente no los usa ni cristo para promover el catolicismo.

Han quedado en el olvido, siendo desbancados por los lenguajes de 3ª generación.

Ejemplos: **Prolog, Golog, Elf, Datalog**

## ¿Qué es el bytecode en un programa informático?

El bytecode es el código generado por un compilador de un lenguaje híbrido específico, éste se encuentra escrito en binario y únicamente puede ser interpretado y ejecutado por una máquina virtual del lenguaje compilado.

## ¿Qué es el paradigma imperativo/estructurado en programación y cuál es su estructura básica?

El paradigma imperativo/estructurado es aquel que ejecuta órdenes de manera secuencial, alterando así los datos en la memoria.
Su estructura básica está formada por 3 estructuras de control: **secuencia**, **selección** e **iteración**.

Ejemplos: **C, Cobol, Pascal**

## ¿Qué técnica de diseño se utiliza en el paradigma imperativo/estructurado?

Se utiliza la técnica de diseño top-down, que se basa en una técnica modular ya que divide los problemas en problemas inviduales más pequeños que perite una mayor eficiencia a la resolución.

## ¿En qué consiste el paradigma de objetos en programación y cuáles son sus componentes principales?

El paradigma de objetos o programación orientada a objetos consiste en la abstracción de objectos del mundo real y tratar de representarlos en un código mediante sus funciones o métodos y parámetros más importantes u que consideremos necesarios.
Sus componentes principales son:
-**Abstraccion**clases
-**Encapsulacion**privacidad (public, protected, package, private)
-**Modularidad**Independencia entre componentes
-**Jerarquía**Heréncia, asociación, etc.
-**Polimorfismo**sobreescritura y sobrecarga

Ejemplos **Python, C#, Java, C++**

## ¿Qué es la sobrecarga y la sobreescritura en el paradigma de objetos?

La sobrecarga de un método es la definición de un método ya existente dentro de una clase, cambiando los parámetros de entrada.
La sobreescritura de un método es la redefinición de un método ya existente dentro de una clase, cambiando el funcionamiento del mismo.

## ¿Qué es el paradigma funcional en programación y en qué se basa?

El paradigma funcional la combinación de funciones matemáticas para reducir la complejidad de problemas matemáticos.
Orientado al ámbito de las matemáticas y resolución de expresiones lambda.

Ejemplos: **Haskell, Lisp, F#**.

## ¿En qué consiste el paradigma lógico en programación y para qué fue creado originalmente?

El paradigma lógico es aquel en el que se aplican reglas propias de la lógica para inferir conclusiones a partir de datos.
Fue creado originalmente para trabajar con las Inteligencias Artificiales, pero actualmente se encuentra en desuso incluso en ese mismo ámbito.

Ejemplos: **Prolog, Golog, Elf, Godel**.