import Foundation

struct PostalCode: Codable {
    let name, title, description: String
    let homepage: String
    let version, license: String
//    let sources: [Source]
//    let resources: [Resource]
}

struct Resource: Codable {
    let name, path, format, mediatype: String
    let bytes: Int
    let schema: Schema
}

struct Schema: Codable {
    let fields: [Field]
}

struct Field: Codable {
    let name: String
    let type: TypeEnum
    let description: String
}

enum TypeEnum: String, Codable {
    case integer = "integer"
    case number = "number"
    case string = "string"
}

struct Source: Codable {
    let title: String
    let path: String
}
