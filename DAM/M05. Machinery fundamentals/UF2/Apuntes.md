# Apuntes UF2 M05

## Documentación

La documentación es un procedimiento en el cual se deja constancia de aquello que resulta relevante en un proyecto.

### Tipos de documentación

#### Documentación orientada al usuario

Cuando se desarrolla un dispositivo o aplicación suele hacer falta un **manual de usuario**.

El manual contiene información relevante sobre como utilizar el dispositivo o aplicación,
así como de avisar sobre posibles peligros de mal uso. 

Es importante que un manual sea **claro, específico y completo**.

#### Documentación orientada al técnico

Una guía de soporte a aquellas personas que deben llevar a cabo el mantenimiento de un producto o servicio.

Es importante que la documentación técnica esté siempre actualizada respecto a la realidad del producto.

Llevar al dia la documentación técnica de una aplicación informática resulta vital y tedioso.

##### Documentación orientada al programador

- **Comentarios**: Anotaciones que no afectan a la ejecución de un código, pero ayudan a su comprensión.
- **Documentación** de una biblioteca o API: Instrucciones sobre cuáles son y como funcionan los métodos de una biblioteca. 

### Herramientas de soporte a la documentación

#### Gestión documental

Un gestor documental puede ser una wiki.

#### Javadoc

Javadoc es una herramienta de Java que permite convertir los comentarios del código fuente de una aplicación
a documentación técnica en HTML.

#### DocFX

DocFX es una herramienta de C# que permite convertir los comentarios del código fuente de una aplicación
a documentación técnica en HTML.

## Control de versiones

Un sistema de control de versiones es una herramienta que ayuda al desarrollo de un software.

Es especialmente recomendada para proyectos largos o con una gran cantidad de programadores involucrados.

Se pretende principalmente llevar un registro de todos los cambios por los cuales pasan los componentes de 
una aplicación.

### Funcionalidades principales

- **Control histórico detallado de cada archivo**:
  - Comparar cambios en los archivos a lo largo del tiempo.
  - Posibilidad de acceder al historial de versiones anteriores de los documentos o código fuente.
  - Volver un archivo determinado o todo el proyecto entero a un estado anterior.
- **Control de usuarios con permisos para acceder a los archivos**.
- **Creación de ramas en un mismo proyecto**.
  - Posibilidad de clonar el código fuente de un proyecto para mantener diferentes versiones a la vez.
  - También es posible reintegrar una serie de cambios a la rama principal, fusionando diferentes versiones del mismo archivo.
- **Reducción de problemas de coordinación del equipo**.

### Componentes

- **Repositorio**: El lugar donde se almacenan los datos y puede contener varios proyectos y versiones de los mismos.
- **Módulo**: Carpeta o directorio específico del repositorio.
- **Revisión**: Cada una de las versiones almacenadas de un determinado proyecto.
- **Etiqueta**: Información que se añade a un módulo para indicar alguna característica específica que lo hace especial.
- **Rama**: Una copia del módulo o revisión que se hará servir para hacer modificaciones sin afectar las revisiones en curso.
- **Directorio de trabajo**: El directorio sobre el que el programador trabaja a partir de una copia local del repositorio.

### Operaciones básicas

#### Introducción de datos al repositorio

- **Importación de datos**: Primera introducción de datos de un proyecto.
- **Subir** (commit): Permite enviar los datos locales modificados al repositorio.

#### Extracción de datos del repositorio

- **Bajar** (check-out): Descargar una versión de trabajo de un archivo, un módulo o una revisión a un directorio de trabajo de un ordenador cliente.
- **Actualizar** (update): Actualiza los ficheros de del directorio de trabajo con las nuevas revisiones que estén disponibles al repositorio desde el último *update* o *check-out*. 

### Soluciones más comunes

- **Team Foundation Server**: La solución de Microsoft, todo y que las versiones más modernas de esta herramienta están dando soporte a Git.
- **Subversion**: Herramienta de código abierto, independiente del sistema operativo.
- **Git**: Herramienta de código abierto desarrollada por los programadores del nucleo de linux.

### Problemática de la modificación en paralelo

Con diversos programadores trabajando a la vez, es probable que se quiera modificar el mismo fichero con diferente contenido.
De no gestionarse esto, se pueden perder los cambios que se han subido primero.

#### Opción 1: Bloqueo de ficheros

El bloqueo de ficheros supone los siguientes inconvenientes:
- **Inconsistencias**: Desarrollo en base a un código que se verá modificado en un futuro provocando errores de compilación.
- **Inaccessibilidad**: Si el archivo se queda bloqueado por error, los otros programadores no podrán acceder.
- **Improductividad**: Dos programadores deberían de poder modificar dos métodos diferentes del mismo archivo sin que eso genere conflictos.

#### Opción 2: Fusión de ficheros

Fusionar ficheros no siempre es trivial:
- **Automático**: Si dos programadores han modificado diferentes partes de un archivo, la fusión de las partes más nuevas de cada uno se puede realizar automáticamente.
- **Manual**: Si dos programadores han modificado la misma parte de un código, la fusión requiere de validación manual (el último programador es el que tendrá que decidir qué cambios conservar.)