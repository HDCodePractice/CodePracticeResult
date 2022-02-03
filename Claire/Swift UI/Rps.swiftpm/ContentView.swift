import SwiftUI

struct ContentView: View {
    @State var game : Game = Game()
    
    var body: some View {
        if game.starting {
            gameStarting
        }else{
            gameRestule
        }
    }
    
    var gameRestule: some View{
        VStack{
            Text(game.result)
                .font(.largeTitle)
            
            Text("Play again")
                .font(.largeTitle)
                .onTapGesture(){
                    game.starting = true
                }
        }
    }
    
    var gameStarting: some View{
        VStack(spacing:60) {
            Image(game.computer)
                .resizable()
                .frame(width: 120, height: 100)
                .cornerRadius(20)
            ZStack{
                ZStack{
                    Color.black
                }
                .frame(width: 120, height: 120)
                .cornerRadius(20)
                .shadow(radius: 5)
                Image(systemName: "desktopcomputer")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .onTapGesture(){
                        game.genComputer()
                    }
            }
                            
            Text(game.result)
                .font(.custom("Gill Sans", size: 30))
            
            Image(game.player)
                .resizable()
                .frame(width: 120, height: 100)
                .cornerRadius(20)
            
            HStack(spacing:20){
                ZStack{
                    ZStack{
                        Color.black
                    }
                    .frame(width: 115, height: 100)
                    .cornerRadius(30)
                    .shadow(radius: 5)
                    Image("scissor")
                        .resizable()
                        .frame(width: 100, height: 80)
                        .cornerRadius(20)
                        .onTapGesture(){
                            game.player = "scissor"
                            game.genComputer()
                            game.starting = false
                        }
                }
                
                ZStack{
                    ZStack{
                        Color.black
                    }
                    .frame(width: 100, height: 100)
                    .cornerRadius(30)
                    .shadow(radius: 5)
                    Image("rock")
                        .resizable()
                        .frame(width: 85, height: 80)
                        .cornerRadius(20)
                        .onTapGesture(){
                            game.player = "rock"
                            game.genComputer()
                            game.starting = false
                        }
                }
                
                ZStack{
                    ZStack{
                        Color.black
                    }
                    .frame(width: 100, height: 100)
                    .cornerRadius(30)
                    .shadow(radius: 5)
                    Image("paper")
                        .resizable()
                        .frame(width: 87, height: 80)
                        .cornerRadius(20)
                        .onTapGesture(){
                            game.player = "paper"
                            game.genComputer()
                            game.starting = false
                        }
                }
            }
        }
        .padding()
    }
}





//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack(spacing: 90) {
//            Spacer()
//            ZStack{
//                ZStack{
//                    Color.black
//                }
//                .frame(width: 120, height: 120)
//                .cornerRadius(20)
//                .shadow(radius: 5)
//                Image(systemName: "desktopcomputer")
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                    .foregroundColor(.white)
//            }
//            Text("Choose One")
//                .font(.custom("Gill Sans", size: 30))
//            HStack{
//                ZStack{
//                    ZStack{
//                        Color.black
//                    }
//                    .frame(width: 100, height: 100)
//                    .cornerRadius(30)
//                    .shadow(radius: 5)
//                    Image("Rock")
//                        .resizable()
//                        .frame(width: 70, height: 70)
//                        .cornerRadius(20)
//                }
//
//                ZStack{
//                    ZStack{
//                        Color.black
//                    }
//                    .frame(width: 100, height: 100)
//                    .cornerRadius(30)
//                    .shadow(radius: 5)
//                    Image("Paper")
//                        .resizable()
//                        .frame(width: 70, height: 70)
//                        .cornerRadius(20)
//                }
//
//                ZStack{
//                    ZStack{
//                        Color.black
//                    }
//                    .frame(width: 100, height: 100)
//                    .cornerRadius(30)
//                    .shadow(radius: 5)
//                    Image("Scissor")
//                        .resizable()
//                        .frame(width: 70, height: 70)
//                        .cornerRadius(20)
//                }
//            }
//            Spacer()
//        }
//    }
//}
//
//struct Game{
//    var computer : String = "rock"
//    var player: String = "rock"
//    var won : Int = 0
//    var lost : Int = 0
//    var tied : Int = 0
//    var starting : Bool = true
//
//    var result : String {
//        if computer == player {
//            return "Tied"
//        }
//
//        if (player=="rock"&&computer=="scissors") ||
//            (player=="scissors"&&computer=="paper") ||
//            (player=="paper"&&computer=="rock") {
//            return "Won"
//        }
//
//        if (player=="scissors"&&computer=="rock") ||
//            (player=="paper"&&computer=="scissors") ||
//            (player=="rock"&&computer=="paper") {
//            return "Lost"
//        }
//        return "Choose One"
//    }
//
//    mutating func genComputer(){
//        let outcome = ["rock","scissors","paper"]
//        computer = outcome.randomElement() ?? "rock"
//    }
//
//}
