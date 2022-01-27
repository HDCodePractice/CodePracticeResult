import SwiftUI

struct ContentView: View {
    var Computer = Int.random(in: 1...3)
    var Me = 0.0
    var body: some View {
        VStack {
            Image(systemName: "desktopcomputer")
                .scaledToFit()
                .cornerRadius(50)
                .foregroundColor(.accentColor)
            Text("Choose One")
            HStack{
                Button{
                    Me = 1
                }label: {
                        Label(Me += 3,Image("Rock"))
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(70)
                    }
                Button{
                    Me = 2
                }label: {
                        Label(Me += 2,Image("paper"))
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(70)
                    }
            Button{
                Me = 3
            }label: {
                    Label(Me += 3,Image("Scissor"))
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(70)
                }
                }
            }
        }
    }
for i in 1...3{
    if Computer == i && Me == i{
        print("Draw")
    }
}
if Computer == 2 && Me == 1 || Computer == 3 && Me == 2 ||  Computer == 1 && Me == 3{
    print("Computer won")
}
if Computer == 1 && Me == 2 || Computer == 2 && Me == 3 ||  Computer == 3 && Me == 1{
    print("You won")
}
