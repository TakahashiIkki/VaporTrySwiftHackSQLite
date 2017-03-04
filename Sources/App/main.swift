import Vapor
import VaporSQLite

let drop = Droplet()
try drop.addProvider(VaporSQLite.Provider.self)

// This is Defaul
drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

// This is Defaul
drop.resource("posts", PostController())

/*
 * GET 
 * version
 * You can get `sqlite_version`
 */
drop.get("version") { request in
    let result = try drop.database?.driver.raw("SELECT sqlite_version()")
    return try JSON(node: result)
}

/*
 * GET
 * users
 * You can get all of `users`(the table on sqlite) data.
 */
drop.get("users") { request in
    let result = try drop.database?.driver.raw("SELECT email, password FROM users")
    
    return try JSON(node: result)
}

/*
 * GET
 * users/:id
 * You can get `users`(the table on sqlite) data By id(request).
 */
drop.get("users", Int.self) { request, userId in
    let result = try drop.database?.driver.raw("SELECT email, password FROM users WHERE id = ?", [userId])
    
    return try JSON(node: result)
}

/*
 * POST
 * users
 * You can create `users`(the table on sqlite) data By request.
 * parameter:  {"email":"xxx","password":"xxx"}
 */
drop.post("users") { request in
    guard let email = request.json?["email"]?.string! else {
        throw Abort.custom(status: .badRequest, message: "Sorry, Email is Missing")
    }
    
    guard let password = request.json?["password"]?.string! else {
        throw Abort.custom(status: .badRequest, message: "Sorry, Password is Missing")
    }
    
    let result = try drop.database?.driver.raw("INSERT INTO users(email, password) VALUES(?, ?)", [email, password])
    
    return try JSON(node: result)
}

/*
 * PUT
 * users/:id
 * You can edit `users`(the table on sqlite) data By id(request).
 * parameter:  {"email":"xxx","password":"xxx"}
 */
drop.put("users", Int.self) { request, userId in
    guard let email = request.json?["email"]?.string! else {
        throw Abort.custom(status: .badRequest, message: "Sorry, Email is Missing")
    }
    
    guard let password = request.json?["password"]?.string! else {
        throw Abort.custom(status: .badRequest, message: "Sorry, Password is Missing")
    }
    
    let result = try drop.database?.driver.raw("UPDATE users SET email = ?, password = ? WHERE id = ?", [email, password, userId])
    
    return try JSON(node: result)
}

/*
 * DELETE
 * users/:id
 * You can delete `users`(the table on sqlite) data By id(request).
 */
drop.delete("users", Int.self) { request, userId in
    let result = try drop.database?.driver.raw("DELETE FROM users WHERE id = ?", [userId])
    
    return try JSON(node: result)
}

drop.run()
