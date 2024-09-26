//
//  User.swift
//  RandomUsers
//
//  Created by Nazrin Atayeva on 24.09.24.
//

import Foundation
/// Ultimately, each User instance will be displayed using a List which requires the items conform to Identifiable.
/// The first problem that we’ll solve with CodingKeys is to update the Response so that the JSON can be parsed into it.
/// Next, let’s look again at the JSON to find the correct key for the users array.
/// {
///  "results": [
///    {
///      "gender": "male",
///      "name": {
///        "title": "Mr",
///        "first": "Ryan",
///        "last": "Gulliksen"
///      },
/// …
///
///The JSON structure doesn’t contain a “users” key. Instead, it contains a “results” key that maps to the users. Let’s guide the “results” key to decode into the Response structure by giving users case in the CodingKeys enumeration a raw value of “results”.
///


struct Response: Decodable {
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}

/// Created Response structure to decode the raw JSON into the User structure.

struct User: Decodable, Identifiable {
  let id: String
  let name: Name
  let picture: Picture
    
    ///create a custom initializer to decode the JSON using the new enumerations.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(Name.self, forKey: .name)
        picture = try values.decode(Picture.self, forKey: .picture) /// You create the picture coding key and used the Decodable intializer to decode the JSON "picture" key-values into a Picture object.
        let loginInfo = try values.nestedContainer(keyedBy: LoginInfoCodingKeys.self,
                                                     forKey: .login)
        id = try loginInfo.decode(String.self, forKey: .uuid)
    }
    
    var fullName: String {
        name.title + ". " + name.first + " " + name.last
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case login
        case picture
    }
    
    enum LoginInfoCodingKeys: String, CodingKey {
        case uuid
    }
}

struct Name: Decodable {
  let title: String
  let first: String
  let last: String
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}
