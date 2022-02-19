import SwiftUI

struct ContentView: View {
    @State var result : String = "Please choose"
    @State var user : String = "NO Choice"
    
    var body: some View {
        VStack {
            Image(systemName: "desktopcomputer")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .padding()
                .frame(width: 150, height: 150)
            Text(result)
        }
        HStack{
            Image("fist")
                .resizable()
                .scaledToFit()
                .onTapGesture{
                    user = "fist"
                    }
            Image("scissor")
                .resizable()
                .scaledToFit()
                .onTapGesture{
                    user = "scissor"
                    }
            Image("paper")
                .resizable()
                .scaledToFit()
                .onTapGesture{
                    user = "paper"
                    }
                }
        Text(user)
    }
}
