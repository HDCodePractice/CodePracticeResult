import SwiftUI

struct ContentView: View {
    @State var user : String = "No Choose"
    @State var computer : String = "No Choose"
    @State var result : String = "Please choose"
    
    func caiQ(){
        let all = ["rock", "paper","scissors"]
        
        if let c = all.randomElement(){
            computer  = c
            if computer == user{
                result = "tied"
            }
            if (user=="rock"&&computer=="scissors")||(user=="scissors"&&computer=="paper") ||     (user=="paper"&&computer=="rock") {
                result = "You Won!"
                }
            if (user=="rock"&&computer=="paper")||(user=="scissors"&&computer=="rock") ||     (user=="paper"&&computer=="scissors"){
                result = "You lost!"
            }
        }else{
            computer = "No Choose"
        }
    }
    
    var body: some View {
        VStack {
            Text(computer)
                .font(.largeTitle)
            Image(systemName: "desktopcomputer")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(width:200,height: 100)
            Text(result)
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
        }
        HStack{
            Image("rock")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .onTapGesture {
                    user = "rock"
                    caiQ()
                }
            Image("scissors")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .onTapGesture {
                    user = "scisstors"
                    caiQ()
                }
            Image("paper")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .onTapGesture {
                    user = "paper"
                    caiQ()
                }
            
        }
        .padding(.all, 5.0)
        Text(user)
    }
}
