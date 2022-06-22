import SwiftUI
struct ContentView : View {
    @State var y = 2
    @State var x = 2
    @State var fun = ""
    @State var troll = ""
   @State var vm = ViewModel()
   var body: some View{
       ZStack{
           LinearGradient(colors: [.indigo,.blue,.cyan,.teal], startPoint: .top, endPoint: .bottom)

           VStack(spacing:0){
               Spacer()
               VStack{
                   Spacer()
                   Button() {
                       if x == 1{
                           fun = ""
                           x = 2
                       }else if x == 2{
                           fun = "You Found A Secret Message: Hello! :D"
                           x = 1
                       }
                   } label: {
                       ZStack {
                           LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                           Text(vm.display)
                               .font(.system(size: 60, design: .rounded))
                               .bold()
                               .foregroundColor(.white)
                               .font(.title)
                       }
                       .frame(width: 300, height: 100)
                       .cornerRadius(20)
                   }
                   Spacer()
                   Text(fun)
                       .foregroundColor(.white)
                       .font(.system(size: 20, design: .rounded))
                   Spacer()
               }
               Spacer()
               ForEach(vm.chessBoard,id:\.self){row in
                   HStack(spacing:0){
                       ForEach(row){ item in
                           GridItemView(item: item)
                               .onTapGesture {
                                   vm.tapItem(item: item)
                               }
                       }
                   }
               }
               Spacer()
               Button() {

                   if y == 1{
                       troll = ""
                       y = 2
                   }else if y == 2{
                       troll = "You can't restart in the middle of the game. Are you trying to cheat???"
                       y = 1
                   }
                   
               } label: {
                   ZStack {
                       LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                       Text("Restart")
                           .font(.system(size: 40, design: .rounded))
                           .bold()
                           .foregroundColor(.white)
                           .font(.title)
                   }
                   .frame(width: 200, height: 70)
                   .cornerRadius(20)
               }
               Spacer()
               VStack{
                   Spacer()
                   Text(troll)
                       .foregroundColor(.white)
                       .font(.system(size: 20, design: .rounded))
                   Spacer()
               }
           }
       }.ignoresSafeArea()
   }
}
struct GridItemView : View{
    @State var item : ChessBoardItem
   var body: some View{
       ZStack{

           Image(item.background)
               .resizable()
               .scaledToFit()
           if (item.chess != "no"){
               Image(item.chess)
                   .resizable()
                   .scaledToFit()
           }
       }
   }
}


