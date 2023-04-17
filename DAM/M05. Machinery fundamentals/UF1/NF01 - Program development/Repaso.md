# Repaso

## Introducción

### Concepto

Un programa informático es aquel que se compone de instrucciones que se ejecutan de manera secuencial. Contiene Estructuras de control, así como bucles y condicionales y tamibén datos o parámetros de entrada o salida.

### Ámbito

Los programas informáticos están orientados a resolver problemas específicos, trabajando así también con conjuntos y tipos de datos específicos para cada programa.

### Estructura código fuente a ejecución

``` text
                    -----------> ByteCode -------> Máquina virtual ---> Ejecución
                    |
Código fuente --> Compilador --> Código objeto --> Enlazador --> Código Ejecutable
    |                                                                 ^
    ____________> Intérprete _________________________________________| 

```

#### Código fuente

Es aquel que cualquier persona formada puede entender y podría llegar a interpretar su funcionamiento.
Un orderador o CPU, no es capaz de interpretar un código fuente.

#### Compilador

El compilador es una herramiento o programa que siempre acompaña a un lenguaje de programación, pues es el que se encarga de revisar que la sintaxis del código esté correcta y que genera un código objeto, incompleto pero interpretable por el procesador, mediante el proceso de compilación en el caso de ésta sea correcta.

#### Código objeto

El código objeto es la traducción del código fuente hecha por el compilador, está escrito en código máquina o ensamblador y es interpretable por el procesador, pero aún no es ejecutable por el mismo, pues está incompleto porque le faltan las bibliotecas.

#### Enlazador

El enlazador es aquel que se encarga de enlazar las bibliotecas externas al código objeto, resultando así en un código ejecutable por el procesador de la máquina.

#### Código ejecutable

Es el código fuente procesado, traducido a código máquina o ensamblador y con todas las biliotecas necesarias para poder ser ejecutado por el procesador.

## Tipología

### Concepto

Se podría decir que un lenguaje de programación es aquel que permite la comunicación entre humano y máquina mediante ordenes ejecutables y estrictas por el mismo o introducción de datos. Existen una cantidad muy grande de lenguajes de programación dedicados a la comunicación humano-máquina.

#### 1ª gen: LENGUAJE MÁQUINA

Se le dan instrucciones directamente al microprocesador mediante código máquina o binario.
El código generado es altamente eficiente, ya que no necesita de otras herramientas para ejecutarse.
Es realmente complejo de entender por un humano, pues está escrito en binario, y por lo tanto será dificil de mantener.
Está muy ligado al hardware de la máquina

#### 2ª gen: LENGUAJE ENSAMBLADOR

Al igual que en el anterior, mediante el lenguaje ensamblador también se le pueden dar instrucciones directamente al microprocesador, pero necestiando un traductor de ensamblador a código máquina.
Es de gran ayuda respecto al anterior, pues es más fácil de interpretar que el binario, pero sigue siendo dificil de mantener.
Está completamente ligado al hardware.

#### 3ª gen: LENGUAJE DE ALTO NIVEL

Este es el más utilizado actualmente, pues es completamente legible e interpretable por un programador formado.
Se utilizan estructuras de control y bucles simples e intuitivos.
Prioriza el mantenimiento sobre la eficiéncia, pues requiere de varios procesos para poder ser ejecutado por el procesador.
Grácias a su falicidad de interpretación, se pueden realizar mediante éste grandes y complejas aplicaciones.

##### 3ª gen: LENGUAJES COMPILADOS

Los lenguajes compilados son aquellos que requieren de un compilador, que procese el código mediante un proceso de compilación, para poder ser ejecutados por el procesador.

Ejemplos: **C, C#, C++, Java, Cobol**

##### 3ª gen: LENGUAJES INTERPRETADOS

Los lenguajes interpretados son los que requieren de un intérprete para poder ser ejecutados. Su ejecución resulta más lenta que un lenguaje compilado, pues se traduce en código máquina instrucción por instrucción mediante el intérprete, lo que resulta en una ventaja de portabilidad y en una desventaja de rendimiento respecto a los lenguajes compilados.

Ejemplos: **Python, PHP, Ruby, JavaScript, Perl, Bash, R**

##### 3ª gen: MÁQUINAS VIRTUALES

Las máquinas virtuales permiten realizar un hibrido entre lenguajes compilados e interpretados, ya que el código fuente es compilado y traducido a bytecode y ejecutado por una máquina virtual compatible con el sistema operativo. Esto permite hacer un código portable y ejecutable en cualquier máquina virtual de ese lenguaje, pero imposible de interpretar por una persona.

Ejemplos: **Java, C#**

##### 4ª gen: LENGUAJES DE PROGRAMACIÓN DE PROPÓSITO ESPECÍFICO

Son lenguajes de programación orientados a trabajar con grandes cantidades de información centrados en generación de informes, representación gráfica de fórmulas matemáticas o consultas sobre bases de datos.

Ejemplos: **Matlab, SQL, HTML, Awk, R, Lisp**

##### 5ª gen: LENGUAJES LÓGICOS

Son lenguajes de programación pensados para trabajar con inteligencias artificiales, pero actualmente están de capa caida pues no los usa ni cristo para promover el catolocismo.

Han quedado completamente desbancados por los lenguajes de 3ª y 4ª generación.

Ejemplos: **Prolog, Datalog, Alloy**

## Paradigmas de programación

### Imperativo/Estructurado

Se basa en dar órdenes directas que al ser ejecutadas de forma secuencial, alteran los datos a la memória.
Su estructura está formada mediante 3 tipos de estructuras de control **secuencia**, **selección** e **iteración**.

Ejemplos: **c, Cobol, Pascal**

#### Técnica de diseño

Para el diseño de algoritmos del paradigma imperativo/estructurado se utiliza la técnica de diseño descendente, que implica dividir un problema complejo en subproblemas más simples, para luego resolver más eficientemente e independiente cada uno de estos subproblemas.

### Objetos

El paradigma de objetos o programación orientada a objetos es aquella que utiliza la abstracción de objetos del mundo real para representarlos en un programa mediante métodos u atributos.

Ejemplos: **C#, Java, Python, C++**

Se compone de:
- **Abstracción** (Clases)
- **Encapsulación** (Público, protegido, package o privado)
- **Modularidad** (Independencia entre componentes)
- **Jerarquia** (Herencia, asociación, composición y agregación)
- **Poliformismo** (Sobrecarga y sobreescritura)

**La sobrecarga es la definición de un método con el mismo nombre en una misma clase, pero con diferentes parámetros de entrada.**
**La sobreescritura es la redefinición de un método en una clase derivada o en una misma clase, pero cambiando el funcionamiento o resultado del mismo (el tipo de datos de retorno no).**

### Funcional

El paradigma funcional es la combinación de funciones matemáticas para reducir la complejidad. Orientado al ámbito de la investigación y origen de las expresiones Lambda.

Ejemplos: **Haskell, Lisp, F#**

### Lógico

El paradigma lógico es aquel en el que se aplican las reglas de la lógica para inferir conclusiones a partir de datos.
Creado para trabajar con la IA, pero actualmente en desuso.

Ejemplos: **Prolog, Elf, Godel**