import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var answer : [String]?
    
    var body: some View {
        VStack{
            if let answer = answer{
                HStack{
                    VStack{
                        Text("Click on the flag of:")
                            .font(.title)
                            .foregroundColor(.blue)
                            .padding()
                    
                    Text(answer[0])
                        .font(.title)
                        .foregroundColor(.green)
                        .padding()
//                    Text(answer[1])
                    }}
                Text("")
                ForEach(game.flags,id:\.self){ flag in
                    Text(flag)
                        .font(Font.system(size:60, design: .default))
                        .onTapGesture {
                            print("Clicked on a flag")
                        }
                }
                
            }else{
                Text("Nothing!")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
            }
            
            Text("Start")
                .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 5)
                        )
                .onTapGesture {
                    answer = game.newGame()
                }
        }
    }
}
