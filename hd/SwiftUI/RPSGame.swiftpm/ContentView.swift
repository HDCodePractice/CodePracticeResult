import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing:60) {
            Image(systemName: "desktopcomputer")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 120, height: 120)
                            
            Text("Choose One")
                .font(.largeTitle)
            
            HStack(spacing:20){
                Image("rock")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                
                Image("scissors")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                
                Image("space")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
            }
            .padding()
        }
    }
}
