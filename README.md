Servidor Swift + MySQL DB
-------------------------

Requerimientos
----------------------
1. Instalar **[Swift](https://swift.org)**
2. Instalar **[Vapor](https://vapor.codes)**
3. Instalar **[MySQL](https://dev.mysql.com/downloads/mysql/)**


Clonando el template
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

Una vez en el XCode, en el project navigator, ir a **Config > secrets > mysql.json**. Ahí puedes configurar las propiedades necesarias para configurar la conexión a la base de datos MYSQL.
Ej.

```bash
{
    "host": "localhost",
    "user": "root",
    "password": "2413",
    "database": "OrbisUniverse",
    "port": "8080",
    "encoding": "utf8"
}
```
Luego en el project navigator, ir a **Sources > App > main.swift**. Este es el archivo principal para empezar la aplicación. Para poder conectarse a la base de datos, se necesita unas líneas de código.

Importamos la librería VaporMySQL:
```bash
import VaporMySQL
```

Agregamos al **"Provider"** de conexión de BD. Otros lo llaman **"Driver"**
```bash
let drop = Droplet()
.
.
.
try drop.addProvider(VaporMySQL.Provider.self)
.
.
.
```

Hacemos una pequeña consulta:
```bash
.
.
.
drop.get ("persons") { _ in
    if let db = drop.database?.driver as? MySQLDriver {
        let result = try db.raw("SELECT * FROM persons;")
        return JSON(result)
    }
    else {
        return "Falló la conexión a la bd"
    }  
}
.
.
.
drop.resource("posts", PostController())
drop.run()
```

- Finalmente, corremos la aplicación y esperamos en el log: **Starting...**. Vamos al navegador e ingresamos ej. //locahost:8080/persons.
