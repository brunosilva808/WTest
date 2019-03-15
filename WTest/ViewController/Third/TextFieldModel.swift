import Foundation

enum TextFieldType {
    case text
    case number
    case capitalLetter
    case date
    case entry
}

struct TextFieldModel {
    var type: TextFieldType
    var title: String
}
