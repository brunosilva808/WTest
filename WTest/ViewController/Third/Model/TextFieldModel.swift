import Foundation

public typealias TextFieldInfo = (type: TextFieldType, title: String, entry: String)

public enum TextFieldType {
    case text
    case number
    case capitalLetter
    case date
    case entry
}

public enum TextFieldModelEnum {
    case generic(type: TextFieldType, title: String)
    case entry(type: TextFieldType, title: String, entry: String)
    
//    var info: TextFieldInfo {
//        switch self {
//        case .generic(let type, let title):
//            return (type, title, "")
//        case .entry(let type, let title, let entry):
//            return (type, title, entry)
//        }
//    }
    
    var info: TextFieldInfo {
        get {
            switch self {
            case .generic(let type, let title):
                return (type, title, "")
            case .entry(let type, let title, let entry):
                return (type, title, entry)
            }
        }
        set {
            switch self {
            case .generic:
                self = TextFieldModelEnum.generic(type: newValue.type, title: newValue.title)
            case .entry:
                self = TextFieldModelEnum.entry(type: newValue.type, title: newValue.title, entry: newValue.entry)
            }
        }
    }
}

extension TextFieldModelEnum {
    init(type: TextFieldType, title: String, entry: String? = "") {
        switch type {
        case .entry:
            self = .entry(type: type, title: title, entry: entry!)
        default:
            self = .generic(type: type, title: title)
        }
    }
}

//struct TextFieldModel {
//    var type: TextFieldType
//    var text: String?
//    var title: String
//}
