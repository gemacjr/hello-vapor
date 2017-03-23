import Vapor

let drop = Droplet()

drop.get { request in
    // return "Hello, Vapor!"
    return try JSON(node:["message": "Hello, Vapor!"
        ])
}

drop.get("hello") { request in
    // return "Hello, Vapor!"
    return try JSON(node:["message": "Hello Again!"
        ])
}

drop.get("hello", "there") { request in
    // return "Hello, Vapor!"
    return try JSON(node:["message": "I am tired!"
        ])
}

drop.get("beers", Int.self) { request, beers in
    return try JSON(node: [
        "message": "Take one down, pass it around, \(beers - 1) bottles of beer on the wall..."
        ])
}

drop.get("beers", Int.self) { request, beers in
    return try JSON(node: [
        "message": "Take one down, pass it around, \(beers - 1) bottles of beer on the wall..."
        ])
}

drop.post("post") { request in
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    return try JSON(node: [
        "message": "Hello, \(name)!"
    ])
}

//drop.resource("posts", PostController())

drop.run()
