# Enlaces

## Crear directorios recursivamente

`$ mkdir -p ~/m01/enlaces`

## Ver número de enlaces de un directorio

`$ stat directorio1/`

## Ver número de inodo de un directorio

`$ ls -i .`

### Que es un inodo?

Un inodo es una estructura de datos utilizada por los sistemas de archivos en los sistemas operativos tipo Unix para almacenar información sobre los archivos.

Cada archivo en un sistema de archivos Unix tiene un inodo asociado que almacena información como el propietario del archivo, los permisos de acceso, la fecha y hora de creación y modificación, y los bloques de datos físicos que componen el archivo.

El sistema de archivos utiliza los inodos para mantener un seguimiento de los archivos y para localizar y acceder a sus datos en el disco. Cuando un archivo se elimina, el sistema de archivos libera el inodo asociado y los bloques de datos físicos del archivo, lo que permite que el espacio en disco se reutilice para almacenar otros archivos.

## Crear enlace simbólico

`$ ln -s directorio1/passwd directorio1/subdirectorioA/espasswd`

### Que es un enlace simbolico?

Un enlace simbólico (también conocido como symlink o soft link) en Linux es un tipo especial de archivo que actúa como un acceso directo a otro archivo o directorio en el sistema de archivos.

En lugar de contener datos reales, un enlace simbólico contiene una referencia al nombre y la ubicación del archivo o directorio al que apunta.

Una ventaja importante de los enlaces simbólicos es que pueden ser eliminados sin afectar al archivo o directorio original. Si se elimina un enlace simbólico, el archivo original seguirá existiendo en su ubicación original. Además, los enlaces simbólicos pueden ser utilizados para proporcionar acceso a archivos o directorios en ubicaciones que no son accesibles de otra manera debido a permisos de usuario o restricciones de ubicación.

## Crear enlace duro

`$ ls -l directorio1/subdirectorioB/`

### Que es un enlace duro?

Un enlace duro (también conocido como hard link) en Linux es un tipo especial de enlace que permite crear múltiples nombres de archivo (o entradas de directorio) que apuntan al mismo archivo en el sistema de archivos.

A diferencia de los enlaces simbólicos, los enlaces duros no son archivos separados con una referencia al archivo original, sino que son entradas adicionales en el sistema de archivos que apuntan directamente al mismo objeto de archivo que el archivo original.

Esto significa que los enlaces duros comparten el mismo número de i-nodo (inodo) que el archivo original, lo que implica que los cambios realizados en cualquiera de los enlaces duros o en el archivo original se reflejarán en todos los demás.

A diferencia de los enlaces simbólicos, los enlaces duros sólo pueden ser creados para archivos regulares y no para directorios. Además, los enlaces duros sólo pueden ser creados en el mismo sistema de archivos donde reside el archivo original.

Los enlaces duros son útiles cuando se desea tener varios nombres de archivo para el mismo archivo, pero sin crear copias adicionales del archivo en el sistema de archivos. Por ejemplo, se puede crear un enlace duro a un archivo de registro para accederlo desde diferentes directorios sin tener que duplicar el archivo físicamente en el sistema de archivos.

## Ver permisos de un archivo

`$ ls -l directorio1/passwd`

### Que permisos hay?

En Linux, los permisos de un archivo se dividen en tres categorías principales: usuario (owner), grupo y otros. Para cada categoría, hay tres permisos posibles: lectura (read), escritura (write) y ejecución (execute). Estos permisos se representan por medio de caracteres en las salidas de listado de archivos y en comandos como "ls -l". Los permisos se muestran en ese orden y se utilizan los siguientes caracteres para representar cada permiso:

"r" para permiso de lectura (read)
"w" para permiso de escritura (write)
"x" para permiso de ejecución (execute)
"-" para indicar la ausencia de un permiso
Por lo tanto, las combinaciones posibles de permisos son:

rwx: permisos completos (lectura, escritura y ejecución)
rw-: permisos de lectura y escritura solamente
r-x: permisos de lectura y ejecución solamente
r--: permiso de lectura solamente
-wx: permisos de escritura y ejecución solamente
-w-: permiso de escritura solamente
--x: permiso de ejecución solamente
---: ningún permiso

# Alias

## Que es un alias en linux?

En Linux, un alias es un comando personalizado que se utiliza para reemplazar otro comando existente o para crear un nuevo comando que combine varios comandos en uno solo. Un alias se define mediante el comando "alias" seguido del nombre del alias y la cadena de comando que se desea asignar al alias.

## Para que se utiliza un alias?

Los aliases son útiles para simplificar comandos largos y complejos, o para crear comandos personalizados que se ajusten a las necesidades específicas del usuario. 

## Donde se definen los alias

Los aliases pueden ser definidos en el archivo de inicio del usuario (por ejemplo, .bashrc para la shell bash), de modo que estén disponibles cada vez que se inicie una nueva sesión de terminal.

## Donde se aplican los alias?

los aliases sólo se aplican en la terminal en la que se han definido, por lo que si se desea utilizar un alias en una nueva terminal, debe ser definido nuevamente.

## Mostrar todos los alias definidos

`$ alias`

## Crear un alias

`$ alias datecal='date && cal'`

## Definir un alias permanente

`$ echo "alias quisoc='id -u && id -g && whoami'" >> ~/.bashrc`

# Path

## Mostrar el path actualmente definido

`$ echo $PATH`

## Hacer una copia del path

`$ OLDPATH=$PATH`

## Listar las ordenes internas

`$ printenv`

## Mostrar la ayuda de una orden interna

`$ fg --help`

# Valores de retorno

## Ver el valor de retorno de ejecución

```
$ free
               total        used        free      shared  buff/cache   available
Mem:        16102080     3127868     4111532      505820     8862680    12121176
Swap:       10148184        5888    10142296
$ echo $?
0
```

## Significado de cada valor de retorno

```
Valor 0: El comando se ha ejecutado correctamente.
Valor 1: Valor para errores generales.
Valor 127: El comando no se ha podido ejecutar.
```

## Ejecutar una orden únicamente si la anterior no falla

```
$ mkdir /tmp/test && echo "Directory created successfully"
Directory created successfully
```

## Ejecutar una orden únicamente si la anterior falla

```
$ mkdir /tmp/test 2>/dev/null || echo "$?, ya existe cruc"
1, ya existe cruc
```

# Expansions

## Operaciones en bash

```
$ echo $(((10*15)-5))
145
```

# Repaso

## Mostrar las localizaciones de un comando

`$ which ls`

## Mostrar la localización del binario, fuente y manual de un comando

`$ whereis ls`

## Localización de la base de datos de locate

`La base de datos se localiza en: /var/lib/mlocate/mlocate.db`

## Ejecutar un comando sin ver los errores por pantalla

```
$ find /etc -name passwd 2> /dev/null
/etc/pam.d/passwd
/etc/passwd
```

## Buscar más de un fichero con find

```
find . -name "*.xml" -o -name "*.xsl"
```

## Contar saltos de línea de la salida de un comando

```
$ find / -name png 2> /dev/null | wc -l
2
```

## Buscar todos los archivos ocultos de un directorio

`$ find /tmp/ -type f 2> /dev/null | head`

## Buscar ficheros por un tamaño exacto

`$ find /var/ -size 24c`

## Buscar ficheros por un tamaño menor que

`$ find /var/ -size -24M`

## Buscar ficheros por un tamaño mayor que

`$ find /var/ -size +46k`

## Buscar ficheros entre 2 tamaños

`$ find /var/ -size +2M -size -5M`

## Buscar y eliminar ficheros a la vez

`$ find / -size +100M -exec rm {} \;`

# Sistemas de archivos

```
|         Sistema de archivos        |             Tamaño máximo            |            Sistemas compatibles           |
|:----------------------------------:|:------------------------------------:|:-----------------------------------------:|
|    FAT  (File Allocation Table)    | FAT12: 16 MB FAT16: 2 GB FAT32: 2 TB | MS-DOS y Windows 95                       |
| NTFS  (New Technology File System) |                 16 EB                | Windows NT y posteriores hasta Windows 11 |
|   HFS  (Hierarchical File System)  |                 2 TB                 | Apple MarcOS                              |
|           Ext2 Ext3 Ext4           |         2-32TiB 4-32Tib 1Eib         | Linux                                     |
|     Btrfs  (B-tree file system)    |                16 EiB                | Linux                                     |
|     XFS  (eXtended File System)    |              8 exbibytes             | Linux                                     |
|       UFS  (Unix File System)      |                 8 ZiB                | Basados en Unix (Solaris y FreeBSD)       |
|              ReiserFS              |                16 TiB                | Linux                                     |
|     JFS  (Journaled FileSystem)    |                 32 PB                | Linux y AIX                               |
```

# Particiones

***Para crear una partición lógica es necesario tener una partición extendida, pues ésta es una partición primaria especial que puede contener una o más particiones lógicas.***

- *Para particionar en **msdos** se recomienda **fdisk***

- *Para particionar en **gpt** se recomienda **parted***

## Parted

### Listar discos y particiones

`usuario@usuario-VirtualBox:~$ sudo parted -l`

### Entrar en la interfaz

`sudo parted /dev/sdb`

### Añadir un formato de tabla

`(parted) mklabel gpt`

### Mostrar información del disco antes de grabar

`(parted) p free`

### Crear una partición

`(parted) mkpart primary ext4 0% 7G`

### Crear varias particiones

```
(parted) mkpart primary ext4 0% 7G
(parted) mkpart primary linux-swap 7001 11G                 
(parted) mkpart primary ext4 11001 15G
```

### Añadir banderas

`(parted) set 2 boot on`

### Cambiar las unidades de parted a Bytes

`(parted) unit B`

### Borrar una partición

`(parted) rm 2`

### Crear una partición swap

``

## Fdisk

### Listar discos y particiones

`usuario@usuario-VirtualBox:~$ sudo fdisk -l`

### Entrar en la interfaz

`usuario@neva:~$ sudo fdisk /dev/sdb`

### Formatear un disco con msdos o dos

```
Orden (m para obtener ayuda): o
Se ha creado una nueva etiqueta de disco DOS con el identificador de disco 0x25e0b5fb.
```

### Mostrar el resultado

```
Orden (m para obtener ayuda): p
Disco /dev/sdb: 10 GiB, 10737418240 bytes, 20971520 sectores
Disk model: HARDDISK        
Unidades: sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico/físico): 512 bytes / 512 bytes
Tamaño de E/S (mínimo/óptimo): 512 bytes / 512 bytes
Tipo de etiqueta de disco: dos
Identificador del disco: 0x25e0b5fb
```

### Crear una partición

```
Orden (m para obtener ayuda): n
Tipo de partición
   p   primaria (0 primaria(s), 0 extendida(s), 4 libre(s))
   e   extendida (contenedor para particiones lógicas)
Seleccionar (valor predeterminado p): p
Número de partición (1-4, valor predeterminado 1): 1
Primer sector (2048-20971519, valor predeterminado 2048): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-20971519, valor predeterminado 20971519): +1,5G
```

### Eliminar una partición

```
Orden (m para obtener ayuda): d
Número de partición (1-3,5-7, valor predeterminado 7): 2

Se ha borrado la partición 2.
```

### Aplicar cambios al disco

```
Orden (m para obtener ayuda): w
Se ha modificado la tabla de particiones.
Llamando a ioctl() para volver a leer la tabla de particiones.
Se están sincronizando los discos.
```

# LVM

*Cuando configuras un nuevo servidor a través del instalador de Ubuntu, se da la opción de usar LVM durante la instalación.*

## Grupo de volumenes

*Un grupo de volúmenes es un espacio de nombres dado a todos los volúmenes físicos y lógicos que deseas utilizar con esa implementación de LVM.*

### Crear un grupo de volumenes

`vgcreate NOMBRE_GRUPO /dev/sdX1 /dev/sdX2`

### Eliminar un grupo de volumenes

`vgremove NOMBRE_GRUPO`

### Ver detalles de un grupo de volumenes

`vgdisplay`

### Añadir volumenes físicos a un grupo de volumenes

`sudo vgextend vg-test /dev/sdc`

## Volumen físico

*Un volumen físico es un disco duro físico o virtual que es miembro de un grupo de volúmenes.*

### Crear un volumen físico

`pvcreate /dev/sdX1`

### Eliminar un volumen físico

`sudo pvremove /dev/sdX1`

## Volumen lógico

*Los volúmenes lógicos son similares en concepto a las particiones. Los volúmenes lógicos pueden ocupar una porción, o la totalidad, de un disco, pero a diferencia de las particiones estándar, también pueden abarcar múltiples discos.*

### Crear un volumen lógico

`lvcreate -L TAMANY -n NOMBRE_VOLUM NOMBRE_GRUPO`

### Aumentar el tamaño de un volumen lógico

`lvextend -L +TAMANY /dev/NOMBRE_GRUPO/NOMBRE_VOLUM`

### Reducir el tamaño de un volumen lógico

`lvreduce -L -TAMANY /dev/NOMBRE_GRUPO/NOMBRE_VOLUM`

### Redimensionar el volumen lógico

`lvextend -n /dev/vg-test/myvol1 -l +100%FREE`
`sudo resize2fs /dev/mapper/vg--test-myvol1`

### Eliminar un volumen lógico

`lvremove /dev/NOMBRE_GRUPO/NOMBRE_VOLUM`

### Ver detalles de un volumen lógico

`lvdisplay`

## Pasos

1. Instalar LVM

    `sudo apt install lvm2`
2. Configurar un disco como un volumen físico
3. Crear un grupo de volúmenes
4. Crear un volumen lógico
5. Formatear un volumen lógico

    `sudo mkfs.ext4 /dev/vg-test/myvol1`
6. Montar el volumen lógico como un nuevo disco

    `sudo mount /dev/vg-test/myvol1 /mnt/lvm/myvol1`

## Instantáneas

Una snapshot es una copia puntual del estado de un sistema, como el contenido de un sistema de archivos, el estado de una máquina virtual o el estado de una base de datos.

Las snapshots se utilizan normalmente con fines de copia de seguridad y recuperación, permitiendo restaurar el sistema a un estado conocido si algo va mal.

Una snapshot es una instantánea del estado del disco de una máquina virtual en un momento dado, que puede utilizarse posteriormente para restaurar la máquina virtual a ese estado.

Una snapshot o vista en base de datos puede referirse a una copia de sólo lectura de los datos, que puede usarse para informes, análisis de datos u otros propósitos sin afectar a los datos originales.

### Comando

`lvcreate -s -n mysnapshot /dev/myvg/mylv`

## LDAP

### Atributos
| Atributo                         | Descripción                                                                            |
|----------------------------|----------------------------------------------------------------------------------------|
| cn                         | Nombre común del objeto                                                                |
| sn                         | Apellido o apellido del objeto                                                         |
| uid                        | Identificador único del objeto                                                         |
| userPassword               | Contraseña del objeto                                                                  |
| description                | Descripción del objeto                                                                 |
| mail                       | Dirección de correo electrónico del objeto                                             |
| telephoneNumber            | Número de teléfono del objeto                                                          |
| title                      | Título del objeto                                                                      |
| department                 | Departamento al que pertenece el objeto                                                |
| ou                         | Unidad organizativa del objeto                                                         |
| dc                         | Componente de dominio del objeto                                                       |
| memberOf                   | Lista de grupos a los que pertenece el objeto                                          |
| objectClass                | Clase de objeto                                                                        |
| displayName                | Nombre que se mostrará del objeto                                                      |
| givenName                  | Nombre de pila del objeto                                                              |
| initials                   | Iniciales del objeto                                                                   |
| jpegPhoto                  | Fotografía del objeto en formato JPEG                                                  |
| street                     | Dirección del objeto                                                                   |
| l                          | Localidad del objeto                                                                   |
| st                         | Estado o provincia del objeto                                                          |
| postalCode                 | Código postal del objeto                                                               |
| employeeNumber             | Número de empleado del objeto                                                          |
| employeeType               | Tipo de empleado del objeto                                                            |
| streetAddress              | Dirección del objeto                                                                   |
| postOfficeBox              | Apartado postal del objeto                                                             |
| physicalDeliveryOfficeName | Ubicación física del objeto                                                            |
| facsimileTelephoneNumber   | Número de fax del objeto                                                               |
| mobile                     | Número de teléfono móvil del objeto                                                    |
| pager                      | Número de pager del objeto                                                             |
| roomNumber                 | Número de habitación del objeto                                                        |
| seeAlso                    | Otras entradas relacionadas con el objeto                                              |
| manager                    | Identificador del objeto de su supervisor                                              |
| member                     | Lista de miembros de un grupo                                                          |
| owner                      | Propietario del objeto                                                                 |
| secretary                  | Asistente administrativo del objeto                                                    |
| preferredLanguage          | Idioma preferido del objeto                                                            |
| userCertificate            | Certificado de usuario del objeto                                                      |
| userPKCS12                 | PKCS12 del usuario                                                                     |
| userSMIMECertificate       | Certificado S/MIME del usuario                                                         |
| audio                      | Archivo de audio asociado al objeto                                                    |
| documentAuthor             | Autor del documento asociado al objeto                                                 |
| documentTitle              | Título del documento asociado al objeto                                                |
| documentVersion            | Versión del documento asociado al objeto                                               |
| homeDirectory              | Directorio de inicio del objeto                                                        |
| loginShell                 | Shell de inicio de sesión del objeto                                                   |
| gidNumber                  | Identificador de grupo del objeto                                                      |
| memberUid                  | Lista de miembros del grupo identificados por el identificador único del usuario (UID) |

## Que es Kerberos?

Kerberos es un protocolo de autenticación de red utilizado para autenticar la identidad de un usuario o servicio en un entorno de red. Fue desarrollado por el MIT (Massachusetts Institute of Technology) y se basa en la idea de que las entidades en una red confiable puedan verificar su identidad mutuamente para evitar ataques malintencionados.

Kerberos es un protocolo muy seguro, ya que utiliza técnicas de cifrado fuertes y de autenticación mutua para proteger la comunicación entre los clientes, los servicios y el KDC. Además, también se puede utilizar para controlar el acceso a recursos específicos de la red y para generar registros de auditoría detallados que permiten rastrear el uso de los recursos de la red.

## Donde se utiliza Kerberos?

Kerberos se utiliza en sistemas operativos modernos, como Microsoft Windows, Linux y macOS, para proporcionar una autenticación segura en redes empresariales y de gobierno. Funciona mediante el uso de un servidor de autenticación centralizado, conocido como KDC (Centro de distribución de claves), que se comunica con los clientes y los servicios de red para verificar su identidad y proporcionar un token de autenticación para el acceso a los recursos de red.

