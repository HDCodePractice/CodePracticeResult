import SwiftUI

struct ContentView: View {
    @State var user : String = "Please choose!"
    @State var computer : String = "AI not choose yet"
    @State var wl : String = "Scissors paper rock!"
    func triggerAI() {
        let all = ["Rock","Paper","Scissors"]
        
        if let c = all.randomElement() {
            computer = c
        }else{
            computer = "AI not choose yet"
        }
        caculateResult()
    }
    func caculateResult() {
        let result = ["You win!", "L", "Tie!"]
        if user == "Rock" {
            if computer == "Rock"{
                wl = result[2]
            }else if computer == "Paper"{
                wl = result[1]
            }else{
                wl = result[0]
            }
        }else if user == "Paper"{
            if computer == "Rock"{
                wl = result[0]
            }else if computer == "Paper"{
                wl = result[2]
            }else{
                wl = result[1]
            }
        }else{
            if computer == "Rock"{
                wl = result[1]
            }else if computer == "Paper"{
                wl = result[0]
            }else{
                wl = result[2]
            }
        }
            
            
    }
    var body: some View {
        VStack {
            Text(computer).font(.title2)
                .fontWeight(.medium)
            Image(systemName: "desktopcomputer").resizable().scaledToFit().foregroundColor(.accentColor).padding(.all, 20).frame(width: 200, height: 200)
            //.imageScale(.large)
            Text(wl)
                .font(.largeTitle)
                .fontWeight(.medium)
                
            HStack {
                Image("Rock").resizable().scaledToFit().cornerRadius(5).onTapGesture {
                    user = "Rock"
                    triggerAI()
                }
                Image("Paper").resizable().scaledToFit().cornerRadius(5).onTapGesture {
                    user = "Paper"
                    triggerAI()
                }
                Image("Scissors").resizable().scaledToFit().cornerRadius(5).onTapGesture {
                    user = "Scissors"
                    triggerAI()
                }
            }
            .padding(.all, 10.0)
            Text(user)
                .font(.title2)
                .fontWeight(.medium)
        }
    }
}
