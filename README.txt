=======================================================================
         SISTEMA WEB DE CITAS MÉDICAS PORTABLE - TICS UNEMI
=======================================================================

Proyecto multiplataforma portable de gestión clínica automatizada,
desarrollado bajo metodologías ágiles (Scrum) para la carrera de
Tecnologías de la Información (TICS) - UNEMI.

Estudiantes:
JAHIR ARMANDO ABAD GARCIA
ARIEL ABRAHAM LEON ZAMBRANO
LILIBETH NICOL ORTIZ ARCE
MAIKOL JAHIR ROMERO PINEDA
JHANDRY JOSE SANCHEZ AGUILAR
CARLOS JAVIER TOAPANTA POZO


-----------------------------------------------------------------------
1. REQUISITOS DEL SISTEMA Y DEPENDENCIAS
-----------------------------------------------------------------------
Para que el intérprete de comandos procese correctamente la lógica de
negocio y la base de datos relacional, el entorno requiere:

* PHP (Hypertext Preprocessor): Versión 8.0 o superior (CLI).
* Motor de Base de Datos: SQLite 3.

Módulos y Extensiones de PHP Requeridas (en el php.ini):
* pdo_sqlite: Habilita el acceso específico a la base de datos.
* sqlite3: Soporte fundamental para el motor binario local.

-----------------------------------------------------------------------
2. GUÍA DE DESPLIEGUE MULTIPLATAFORMA
-----------------------------------------------------------------------

OPCIÓN A: EN WINDOWS NATIVO
El proyecto incluye un entorno pre-empaquetado dentro de "php/".
1. Descargue o clone este repositorio en su almacenamiento local.
2. Ejecute con doble clic el archivo: EJECUTAR_SISTEMA.bat
3. Abra su navegador web e ingrese a: http://localhost:8080

OPCIÓN B: EN LINUX BAZZITE (ARQUITECTURA INMUTABLE)
La ejecución se aísla de forma segura en un contenedor de desarrollo
basado en Fedora Linux gestionado por Distrobox y Podman.

Step 1: Preparación del Contenedor (Solo la primera vez)
Si aún no cuenta con el entorno dev-box, créelo e ingrese con:
$ distrobox create -i registry.fedoraproject.org/fedora-toolbox:latest -n dev-box
$ distrobox enter dev-box

Step 2: Instalación Interna de las Dependencias
Dentro del contenedor dev-box, instale el núcleo de PHP y SQLite:
$ sudo dnf update -y
$ sudo dnf install -y php-cli php-sqlite3
$ exit

Step 3: Ejecución Automatizada
Para levantar el servidor web local con un solo comando, otorgue
permisos al script automatizado de Bash y ejecútelo en su terminal:
$ chmod +x EJECUTAR_SISTEMA.sh
$ ./EJECUTAR_SISTEMA.sh

Abra su navegador web en: http://localhost:8080

-----------------------------------------------------------------------
3. CÓMO APAGAR Y CERRAR EL SERVIDOR (.SH)
-----------------------------------------------------------------------
Cuando finalice el uso del sistema o la toma de evidencias, puede
apagar el servidor de dos maneras:

Método 1: Desde la ventana de la terminal activa
* Regrese a la consola donde se ejecuta el script y presione:
  [CTRL + C]
  Esto detendrá el proceso de PHP de inmediato.

Método 2: Forzar el cierre desde el sistema host (Segundo plano)
* Si cerró la terminal pero el puerto 8080 sigue ocupado, ejecute
  este comando en su terminal principal de Bazzite para liberar el entorno:
  $ distrobox enter dev-box -- pkill -f php

-----------------------------------------------------------------------
4. CREDENCIALES DE ACCESO (MODO EVALUACIÓN)
-----------------------------------------------------------------------
Para la revisión del laboratorio docente, use:
* Usuario: admin
* Contraseña: 1234

Nota: Al iniciar el sistema por primera vez, el archivo binario físico
"citas_medicas.db" se autogenerará dinámicamente en la carpeta.
=======================================================================
