import SwiftUI

 struct ContentView: View {
     var body: some View {
         enum  connect4 : String{
         case green
         case grey
         }
         switch self{
         case green{
         return green
         }
         case grey{
         return grey
         }
         }
         VStack {
             HStack{
                 Grid
             }
         }
     }
 }
