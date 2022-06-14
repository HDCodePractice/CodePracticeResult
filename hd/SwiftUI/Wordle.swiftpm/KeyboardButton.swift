import SwiftUI

enum KeyboardButton{
    case letter(String,Status)
    case function(Function)
    
    enum Function {
        case enter
        case delete
    }
}

extension KeyboardButton:Hashable{
    var title: String{
        switch self {
        case .letter(let letter, _):
            return letter 
        case .function(let function):
            switch function {
            case .delete:
                return "Delete"
            case .enter:
                return "Enter"
            }
        }
    }
    
    var backgroundColor:Color{
        let notused = Color(red: 212/255, green: 214/255, blue: 208/255)
        let gray = Color.gray
        let green = Color.green
        let yello = Color.yellow
        
        switch self {
        case .letter(_, let status):
            switch status {
            case .notused:
                return notused
            case .gray:
                return gray
            case .green:
                return green
            case .yellow:
                return yello
            }
        case .function(_):
            return notused
        }
    }
    
    var foregroundColor:Color{
        switch self{
        case .function(_):
            return .black
        case .letter(_, let status):
            switch status{
            case .notused:
                return .black
            default:
                return .white
            }
        }
    }
}
