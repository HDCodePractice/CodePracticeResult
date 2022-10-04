import SwiftUI
struct ContentView: View {
    @State var dices : [Int] = [1,2,3]
    @State var totalValue: Int = 0
    @State var toggle: Bool = true
    var body: some View {
        HStack {
            VStack{
                VStack(){
                    Text("Dice 1").foregroundColor(.blue).bold().padding(50)
                    Image(String(dices[0])).resizable()
                        .scaledToFit()
                        .mask{
                            Rectangle()
                        }.rotationEffect(Angle(degrees: toggle ? 0 : 720))
                }
                VStack(){
                    Text("Dice 2").foregroundColor(.blue).bold().padding(50)
                    Image(String(dices[1])).resizable()
                        .scaledToFit()
                        .mask{
                            Rectangle()
                        }.rotationEffect(Angle(degrees: toggle ? 0 : 720))
                }
                VStack(){
                    Text("Dice 3").foregroundColor(.blue).bold().padding(50)
                    Image(String(dices[2])).resizable()
                        .scaledToFit()
                        .mask{
                            Rectangle()
                        }.rotationEffect(Angle(degrees: toggle ? 0 : 720))
                }
                Text("Total Value: " + String(totalValue)).padding(30)
                Button("START"){
                    withAnimation(.easeInOut(duration: 2)){
                        toggle.toggle()
                        dices[0] = (Int.random(in: 1...6))
                        dices[1] = (Int.random(in: 1...6))
                        dices[2] = (Int.random(in: 1...6))
                    }
                    totalValue = ((dices[0]) + (dices[1]) + (dices[2]))
                }.buttonStyle(.borderedProminent).scaledToFit()
            }
            
            
        }
    }
}
