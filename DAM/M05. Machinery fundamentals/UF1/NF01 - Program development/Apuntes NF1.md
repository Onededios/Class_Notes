# NF01 - Desarrollo de programario

## Introducción a los programas informáticos

### Concepto

**Un programa informático se puede entender como un conjunto de ordenes que se ejecutan de forma secuencial.**
Contiene **Estructuras de control** (Bucles, condicionales) y **Datos** (Entrada/Salida).

### Ámbito de trabajo

Un programa se encarga de resolver un problema específico, por lo tanto, cada programa trabaja con conjutos y tipos de datos diferentes.

### Estructura

`Código fuente --> Compilador --> Código objeto --> Enlazador --> Código Ejecutable`

#### Código fuente

El código fuente el legible y cualquier persona entrenada podría llegar a entender el comportamiento del programa.
**Un ordenador no es capaz de entender el código fuente.**

#### Compilador

El compilador es el programa u herramienta que acompaña a un lenguaje de programación.
Éste se encarga de **comprobar que el código fuente no tiene errores de sintaxis**.
Si éste no encuentra errores, **genera un código objeto** mediante el proceso de compilación.

#### Código objeto

**Es una traducción del código fuente hecha por el compilador.**
Este está **escrito en binario** (código máquina o ensamblador) i **sí es interpetable por el procesador**, pero **está incompleto y el ordenador aún no lo puede ejecutar**.

#### Enlazador

El enlazador es aquel que se encarga de **enlazar el código objeto con las librerías externas**.
Resulta en un código ejecutable.

#### Código ejecutable

Es la **traducción completa a código máquina del código fuente** original **con todas las bibliotecas necesarias** para funcionar.

## Tipologia de los lenguajes de programación

### Concepto

Un lenguaje de programación se puede entender como un **mecanismo de comunicación** entre un ser humano y una máquina.
Mediante un lenguaje de programación se pueden dar **ordenes estrictas a una máquina**.
Existen una gran cantidad de lenguajes, que se pueden **clasificar en generaciones**.

#### 1ª generación: LENGUAJE MÁQUINA

Se le dan **instrucciones directamente al microprocesador** mediante código máquina o binario.
El código generado es **altamente rápido y eficiente**, pues **no necesita de otras herramientas** para ejecutarse.
Es realmente **complejo de entender** y por lo tanto, también de **mantener**.
Está muy **ligado al hardware** de la máquina.

#### 2ª generación: LENGUAJE ENSAMBLADOR

Se le dan **instrucciones directamente al microprocesador** mediante código ensamblador.
Cada instrucción en ensamblador corresponde a una en código máquina.
Un programador entrenado en este lenguaje, puede **generar un código altamente eficiente**.
Al igual que el lenguaje máquina, **es complejo de entener y mantener**.
También está completamente **ligado al hardware de la máquina**.

##### 2ª generación: ENSAMBLADOR

El ensamblador es un código que se encarga de **traducir el código ensamblador a código máquina**.
Es de gran ayuda para el programador, pues **trabaja con instrucciones más sencillas**.
`Código ensamblador --> Ensamblador --> Código Máquina`

#### 3ª generación: LENGUAJE DE ALTO NIVEL

Se hacen servir **frases sencillas** para programar, resultando en un **código bonito, legible e interpretable** por un programador.
Se reperesentan **estructuras de control simples e intuitivas**.
**Prioriza el mantenimiento sobre el rendimiento.**
Permite hacer **aplicaciones grandes y complejas**, ya que es fácil de aprender.

##### 3ª generación: LENGUAJES COMPILADOS

Algunos lenguajes de 3ª generación necesitan compilarse para poder funcionar.
Algunos ejemplos pueden ser: **C, C++, Java, Objective-C, Swift, Rust, Go,Pascal, Fortran**

#### 3ª generación: LENGUAJES INTERPRETADOS

Algunos lenguajes no necesitan compilarse para funcionar.
**Se interpretan a la hora que se ejecutan**, secuencialmente por instrucciones.
Los lenguajes interpretados son **más lentos que los compilados pero más portables**.
Algunos ejemplos pueden ser: **Python, Ruby, Perl, PHP, JavaScript, Lua, Tcl, R, Bash**
`Código fuente --> Intérprete --> Código máquina`

#### 3ª generación: MÁQUINAS VIRTUALES

Las máquinas virtuales permiten hibridar los lenguajes compilados y los interpretados.
El compilador **transforma el código fuente a código intermedio o bytecode**, que la máquina virtual ejecuta.
El código compilado es portable, **sólo se necesita la máquina virtual compatible** con el Sistema Operativo.
Estos lenguajes tienen la ventaja de que al ser el bytecode ejecutado en otra máquina virtual igual, al transferir el código, éste no se podrá interpretar fácilmente como un código fuente.
Algunos ejemplos pueden ser: **Java, C#, Ruby, Kotlin, Groovy, Scala**
`Código fuente --> Compilador --> Bytecode --> Máquina virtual --> Ejecución del bytecode`

#### 4ª generación: Lenguajes de propósito específico

Orientados a trabajar con grandes cantidades de información.
Se centran en la consulta, tratamiento y presentación de la información, así como:

- **Generación de informes.**
- **Representación gráfica de fórmulas matemáticas.**
- **Consultas sobre bases de datos (SQL, XML).**
Pueden incluir sus própios entornos de desarrollo.
Algunos ejemplos pueden ser: **SQL, MATLAB, R, VHDL, Verilog, LaTeX, HTML/CSS, Bash, Awk**

#### 5ª generación: Lenguajes lógicos

Pensados para trabajar con Inteligencia Artificial.
Han quedado **desbancados por los lenguajes modernos** de 3ª y 4ª generación.
**Casi no se hacen servir**, ni si quiera en el campo de las Inteligencias Artificiales.
Algunos ejemplos pueden ser: **Prolog, Datalog, Answer Set Programming, Golog, ACL2, Alloy, Epilog, Lisp**

## Paradigmas de programación

### Imperativo/Estructurado

Se basa en donar ordenes directas que al ser ejecutadas de forma secuencial, alteran los datos a memória.
Ejemplos de lenguaje pueden ser: **C, Cobol, Basic, Pascal, Fortran, Ada, Modula-2, Algol, PL/I**

#### Estructuras de control del paradigma Imperativo/Estructurado

Cualquier programa basado en el paradigma Imperativo/Estructurado puede ser representado mediante las estructuras de control:

- **Secuéncia**: Las instrucciones se ejecutan una tras otra, en el orden en que aparecen en el programa.

``` java
instruccion1;
instruccion2;
instruccion3;
```

- **Selección**: Esta estructura permite tomar decisiones en función de ciertas condiciones.

``` java
if (condicion) {
    instruccion1;
} else {
    instruccion2;
}
```

- **Iteración**: Esta estructura permite repetir un bloque de código varias veces mientras se cumple una condición.

``` java
while (condicion) {
    instruccion1;
    instruccion2;
}
```

#### Técnica de diseño del paradigma Imperativo/Estructurado

La **técnica de diseño descendente o "top-down"** es una metodología utilizada para desarrollar programas de manera sistemática y eficiente. La técnica implica dividir un problema complejo en subproblemas más simples y manejables, y luego resolver cada subproblema de manera independiente.

### Objetos

Conocido como Programación Orientada a Objetos.
Se basa en la abstracción o representación de objetos del mundo real.
Algunos ejemplos pueden ser: **C++, Java, C#, Python, Ruby, Smalltalk, Objective-C, Swift**

#### Composición

Los objetos se componen de **atributos** y **métodos**.
Se basa en la integración de:

- **Abstracción**: clases
- **Encapsulación**: público, protegido y privado
- **Modularidad**: Independencia entre componentes
- **Jerarquia**: Heréncia, asociación, composición y agregación
- **Poliformismo**: Sobrecarga y sobreescritura

```java
public class Empleado {
  private String nombre;
  private int edad;
  private double salario;
  
  public Empleado(String nombre, int edad, double salario) {
    this.nombre = nombre;
    this.edad = edad;
    this.salario = salario;
  }
  
  public String getNombre() {
    return this.nombre;
  }
  
  public int getEdad() {
    return this.edad;
  }
  
  public double getSalario() {
    return this.salario;
  }
  
  public void setSalario(double salario) {
    this.salario = salario;
  }
  
  public void aumentarSalario(double porcentaje) {
    this.salario = this.salario * (1 + porcentaje);
  }
}
```

### Funcional

Combinación de funciones matemáticas para reducir la complejidad.
Orientado al ámbito de la investigación y origen de las expresiones lambda.
Algunos ejemplos puedes ser: **Haskell, Lisp, Erlang, Clojure, F#, Ocaml,**

```erlang
-- Función que devuelve el cuadrado de un número
cuadrado :: Int -> Int
cuadrado x = x * x

-- Función que suma todos los números en una lista
sumaLista :: [Int] -> Int
sumaLista [] = 0
sumaLista (x:xs) = x + sumaLista xs
```

### Lógico

Se aplican las reglas de la lógica para inferir conclusiones a partir de datos.
Se crean una serie de reglas u afirmaciones (premisas) que se aplican sobre una colección de datos.
Creado para trabajar con la IA, actualmente en deshuso.
Algunos ejemplos pueden ser: **Prolog, Mercury, Oz, Curry, Eclipse, Elf, Godel**

```prolog
% Base de conocimientos
hombre(pedro).
hombre(juan).
mujer(maria).
mujer(lucia).
padre(pedro, juan).
padre(pedro, maria).
madre(lucia, juan).
madre(lucia, maria).

% Reglas
hermano(X, Y) :- padre(Z, X), padre(Z, Y), X \= Y.
hermana(X, Y) :- madre(Z, X), madre(Z, Y), X \= Y.
tio(X, Y) :- hermano(X, Z), padre(Z, Y).
tia(X, Y) :- hermana(X, Z), madre(Z, Y).

% Consultas
?- hombre(pedro). % true
?- hermano(juan, maria). % true
?- tio(pedro, maria). % true
?- tia(lucia, juan). % true
```
