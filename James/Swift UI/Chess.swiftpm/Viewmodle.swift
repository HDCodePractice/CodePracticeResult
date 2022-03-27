import SwiftUI

 enum Checker: String {
     case White = "white"
     case Black = "black"
     case Whiteking = "whiteKing"
     case Blacking = "blackKing"
     case Nothing = "nothing"

     func nextChecker() -> Checker {
         switch self {
         case .nothing:
             return .White
         case .White:
             return .Black
         case .Black:
             return .WhiteKing
         case .Whiteking:
             return .Blacking
         case .Blacking:
             return .Nothing
         }

     var color: Color {
         switch self {
         case .white, .WhiteKing:
             return Color(black)
         case .black, .Blacking:
             return Color(white)
         default:
             return .clear
         }

     }

     var imageName: String {
         switch self {
         case .White:
             return "circle"
         case .Black:
             return "circle.fill"
         case .Whiteking:
             return "crown"
         case .Blacking:
             return "crown.fill"
         default:
             return "l.circle.fill"
         }
     }
 }


 enum Grid: String {
     case light = "light"
     case dark = "dark"
     var color: Color {
         switch self {
         case .light:
             return Color(black)
         case .dark:
             return Color(white)
         }
     }
 }

 struct ViewModule {
     var grid: [[GridItem]] = [[GridItem(gridColor: .light, checker: .white)]]
 }

 struct GridItem: Identifiable, Hashable{
     let id: UUID = UUID()
     var gridColor: Grid
     var checker: Checker
 }
 }
