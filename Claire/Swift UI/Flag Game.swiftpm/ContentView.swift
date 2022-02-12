import SwiftUI

struct ContentView: View {
    @State var game = Game()
    let flagNumber = [1,2,3,4,5,6,7,8]
    let countryNumber = [1,2,3,4,5,6,7,8]
    
    
    var body: some View {
        
        ZStack{
            LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
            VStack{
                if game.gameStart {
                    HStack{
                        Text(game.question)
                            .font(.custom("Gill Sans", size: 25))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .offset(y: -60)
                    }

                    ForEach(game.answers,id:\.self){ flag in
                        HStack{
                            Text(flag)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .onTapGesture {
                                    Image(systemName: "checkmark.circle.fill")
                                }
                        }
                    }
                    
                }else{
                    Text("Guess the Flag")
                        .font(.custom("Gill Sans", size: 50))
                        .foregroundColor(.white)
                        .shadow(radius: 20, y: 90)
                        .offset(y: -60)
                }
                
                Button {
                    game.newGame()
                }label: {
                    ZStack{
                        Color.white
                        Text("Start Game")
                            .font(.custom("Gill Sans", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                    }
                    .frame(width: .infinity)
                    .cornerRadius(100)
                    .shadow(radius: 5)
                }
                .frame(width: 350, height: 45)
                .offset(y: 30)
                
                
                
            }
        }
        .ignoresSafeArea()
        
        
        
        
    }
}
