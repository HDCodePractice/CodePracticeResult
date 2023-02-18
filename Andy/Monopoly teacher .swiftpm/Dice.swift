import SwiftUI
struct Dice: View {
    let diceAlignments: [[Alignment]] = [
        [.center,.center,.center,.center,.center,.center],
        [.topLeading,.topLeading,.topLeading,.topLeading,.bottomTrailing,.bottomTrailing],
        [.topLeading,.topLeading,.topLeading,.center,.center,.bottomTrailing],
        [.topLeading,.topLeading,.bottomLeading,.topTrailing,.topTrailing,.bottomTrailing],
        [.topLeading,.center,.bottomLeading,.topTrailing,.center,.bottomTrailing],
        [.topLeading,.leading,.bottomLeading,.topTrailing,.trailing,.bottomTrailing]
    ]
        
    
    @Binding var dice : Int
    @Binding var turn : Bool
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                ForEach(0..<6){ index in
                    ZStack(alignment: diceAlignments[dice-1][index]){
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.clear)
                            .frame(width: 100, height: 100)
                        Circle()
                            .fill(.white)
                            .frame(width: 15, height: 15)
                            .padding()
                    }
                }
            }.rotationEffect(Angle(degrees: turn ? 0 : 180))
        }
    }
}
