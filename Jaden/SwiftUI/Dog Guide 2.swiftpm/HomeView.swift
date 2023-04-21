import SwiftUI

struct HomeView: View {
    @State private var showingTest = false
    @State private var showingGuide = false
    @State private var showingGame = false
    @State private var showingTTT = false
    @State private var showingMatch = false
    var body: some View {
        VStack{
            if showingTest == false && showingGuide == false && showingGame == false && showingTTT == false && showingMatch == false{
                Button() {
                    showingTest = true
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Take Quiz")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                Image("1")
                Button() {
                    showingGuide = true
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Dog Guide")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                Image("JPEG image 4")
                Button() {
                    showingGame = true
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Game")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                Image("aussiepuppy")
                Button() {
                    showingTTT = true
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Tic Tac Toe")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                Image("2")
                Button() {
                    showingMatch = true
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Match Game")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
            }
            
        }
        if showingTest == true{
            TestView()
        }
        if showingGuide == true{
            DogView()
        }
        if showingGame == true{
            GameView()
        }
        if showingTTT == true{
            TicTacToeView()
        }
        if showingMatch == true{
            MatchView()
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

