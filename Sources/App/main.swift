import Vapor
import VaporMySQL

let drop = Droplet()
try drop.addProvider(VaporMySQL.Provider.self)

drop.get ("persons") { _ in
    
    if let db = drop.database?.driver as? MySQLDriver {
        let result = try db.raw("SELECT * FROM persons;")
        return JSON(result)
    }
    else {
        return "Falló la conexión a la bd"
    }
    
    
}

drop.resource("posts", PostController())

drop.run()
