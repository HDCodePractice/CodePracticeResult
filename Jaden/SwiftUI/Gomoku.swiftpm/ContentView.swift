import SwiftUI
struct ContentView : View {
   @State var vm = ViewModel()
   var body: some View{
       VStack(spacing:0){
           Text(vm.display)
               .foregroundColor(.black)
           ForEach(vm.chessBoard,id:\.self){row in
               HStack(spacing:0){
                   ForEach(row){ item in
                       GridItemView(item: item)
                   }
               }
           }
       }
   }
}
struct GridItemView : View{
    @State var item : ChessBoardItem
    @State var vm = ViewModel()
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
       .onTapGesture {
           print(vm.display)
           if item.chess == "no"{
               item = ViewModel.changePiece()
               if ViewModel.changer == 1{
                   item.chess = "2"
               }else if ViewModel.changer == 2{
                   item.chess = "3"
               }
           }
       }
   }
}


