Servidor Swift + MySQL DB
-------------------------

Requerimientos
----------------------

- Instalar **[Vapor](https://vapor.codes)**
- Instalar **[MySQL](https://dev.mysql.com/downloads/mysql/)**



Como empezar?
----------------------

```bash 
$ git clone git@github.com:orbismobile/OrbisUniverse.git
```

Ingresamos al repositorio: 
```bash 
$ cd OrbisUniverse/
$ vapor xcode
```

Esperamos a que Vapor obtenga todas las dependencias. Vapor te preguntará si quieres abrir el proyecto en Xcode.
```bash 
$ Open Xcode project?
$ y/n> n
```

- Finalmente,  agregamos **-DNOJSON** en "Other Swift Flags" en el framework de **MySQL** en *Build Settings* del proyecto.
