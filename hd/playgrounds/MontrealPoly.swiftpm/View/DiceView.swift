import SwiftUI

struct DiceView: View {
    let diceAlignments: [[Alignment]] = [
        [.center,.center,.center,.center,.center,.center],
        [.topLeading,.topLeading,.topLeading,.bottomTrailing,.bottomTrailing,.bottomTrailing],
        [.topLeading,.topLeading,.center,.center,.bottomTrailing,.bottomTrailing],
        [.topLeading,.topLeading,.bottomLeading,.topTrailing,.bottomTrailing,.bottomTrailing],
        [.topLeading,.center,.bottomLeading,.topTrailing,.center,.bottomTrailing],
        [.topLeading,.leading,.bottomLeading,.topTrailing,.trailing,.bottomTrailing]
    ]
    
    @Binding var dice : Int
    @State var turn : Bool = true
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                ForEach(0..<6){ index in
                    ZStack(alignment: diceAlignments[dice-1][index]){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.clear)
                            .frame(width: 100, height: 100)
                        Circle()
                            .fill(.white)
                            .frame(width: 20, height: 20)
                            .padding()
                    }
                }
            }
            .rotationEffect(Angle(degrees: turn ? 0 : 180))
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)){
                    dice = Int.random(in: 1...6)
                    turn.toggle()
                }
            }
        }
    }
}

private struct DiceDemoView:View{
    @State var diceInt = 1 
    @State var sum = 1
    
    var dice: Binding<Int>{
        Binding{
            diceInt
        }set:{ newValue in
            diceInt = newValue
            sum += diceInt
        }
    }
    
    var body: some View{
        VStack{
            DiceView(dice: dice)
            Text("\(diceInt)")
            Text("\(sum)")
        }
    }
}

private struct DiceDemoView1:View{
    @State var diceInt = 1 
    
    var body: some View{
        VStack{
            DiceView(dice: $diceInt)
            Text("\(diceInt)")
        }
    }
}


struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            DiceDemoView()
            DiceDemoView1()
        }
    }
}
