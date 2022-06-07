import SwiftUI

enum ButtonItem{
    case letter(String,ButtonLetter)
    case function(ButtonFunction)
}

extension ButtonItem{
    var background:Color{
        return .gray
    }
    
    var title:String{
        return "Delete"
    }
}

enum ButtonFunction{
    case delete
    case enter
}

enum ButtonLetter:String{
    case notuse
    case gray
    case green
    case yellow
}
