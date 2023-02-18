import SwiftUI

class History: Codable, Identifiable{
    var date : String = ""
    var name : String = ""
    var members : [Member] = []
    
    class Member : Codable, Identifiable{
        var name : String = ""
        var age : Int = 0
    }
}

