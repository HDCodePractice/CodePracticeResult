import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
            VStack {
                HomepageView()
            }
        }.ignoresSafeArea()
    }
}

struct HomepageView: View {
    var body: some View {
        VStack{
            ZStack{
                Color.white
                HStack{
                    Image(systemName: "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 50, height: 50)
                        .offset(x: 20, y: -25)
                    Spacer()
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 75, height: 75)
                        .offset(y: -50)
                    Spacer()
                    Image(systemName: "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 50, height: 50)
                        .offset(x: -20, y: -25)
                }
                Text("Star Level")
                    .font(.custom("Gill Sans", size: 30))
                    .foregroundColor(.black)
                    .offset(y: 30)
                Button {
                    
                }label: {
                    ButtonView(text: "unavaliable")
                }
                .frame(width: 120, height: 30)
                .offset(y: 80)
            }
            .frame(width: 265, height: 229)
            .cornerRadius(25)
            .shadow(radius: 15)
            .offset(y: -125)
            Text("Wordle")
                .font(.custom("Gill Sans", size: 60))
                .foregroundColor(.white)
                .shadow(radius: 20, y: 90)
                .offset(y: -60)
            
            Button {
                GameView()
            }label: {
                ZStack{
                    Color.white
                    Text("Level 1")
                        .font(.custom("Gill Sans", size: 30))
                        .fontWeight(.semibold)
                        .foregroundColor(.accentColor)
                }
                .frame(width: .infinity)
                .cornerRadius(100)
                .shadow(radius: 5)
            }
            .frame(width: 350, height: 45)
            .offset(y: 30)
            
            Button {
                GameView()
            }label: {
                ZStack{
                    Color.white
                    Text("Tutorial")
                        .font(.custom("Gill Sans", size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.pink)
                }
                .frame(width: .infinity)
                .cornerRadius(100)
                .shadow(radius: 5)
            }
            .frame(width: 125, height: 35)
            .offset(y: 150)
        }
        
    }
}

struct ButtonView: View {
    var text : String
    var body: some View {
        ZStack{
            Color.white
            Text("\(text)")
                .font(.headline)
                .foregroundColor(.accentColor)
        }
        .frame(width: .infinity)
        .cornerRadius(100)
        .shadow(radius: 5)
    }
}

struct TutorialView: View {
    var body: some View {
        Text("Hello")
    }
}

struct GameView: View {
    var body: some View {
        Text("Hello, world")
    }
}
