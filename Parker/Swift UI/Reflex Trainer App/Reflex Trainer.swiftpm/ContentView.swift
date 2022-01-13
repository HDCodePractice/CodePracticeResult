import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [.purple,.blue], startPoint: .top, endPoint: .bottom)
                
                VStack(spacing:20){
                    NavigationLink(){
                            GameView()
                        }label: {
                            ZStack{
                                Text("Play")
                                    .font(.title)
                                    .padding()
                            }
                            .frame(width:300)
                            .foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    NavigationLink(){
                            MoreInfoView()
                        }label: {
                            ZStack{
                                Text("More Info")
                                    .font(.title)
                                    .padding()
                            }
                            .frame(width:300)
                            .foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                }
            .ignoresSafeArea()
            .navigationTitle("Reflex Tester")
        }
    }
}

struct GameView: View {
    let reflextime = 0.00
    var body: some View {
        VStack{
            Text("Click the button below when the text on the button says GO")
                .font(.title)
                .padding()
            
            VStack{
                Button {
                    print("Button tapped!")
                } label: {
                    Text("Don't Tap me!")
                        .font(.title)
                        .bold()
                        .frame(width:300,height:150)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                
                Button {
                    print("Button tapped!")
                } label: {
                    Text("Tap me!")
                        .font(.title)
                        .bold()
                        .frame(width:300,height:150)
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(10)
                        .shadow(radius: 5)
            }
            }
        }
    }
}

struct MoreInfoView: View {
    
    var body: some View {
        Text("And Marques Brownlee")
    }
}

struct ButtonView: View {
    var item : String
    var body: some View {
        ZStack{
            Color.blue
            Text("\(item)")
                .font(.title)
                .foregroundColor(.white)
        }
        .cornerRadius(5)
        .shadow(radius: 5)
    }
}
