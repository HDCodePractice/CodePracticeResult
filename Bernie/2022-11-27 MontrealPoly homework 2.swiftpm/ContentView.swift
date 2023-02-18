import SwiftUI

struct ContentView: View {
    let diceAlignments: [[Alignment]] = [
        [.center,.center,.center,.center,.center,.center],
        [.topLeading,.topLeading,.topLeading,.bottomTrailing,.bottomTrailing,.bottomTrailing],
        [.topLeading,.topLeading,.center,.center,.bottomTrailing,.bottomTrailing],
        [.topLeading,.topLeading,.bottomLeading,.topTrailing,.bottomTrailing,.bottomTrailing],
        [.topLeading,.center,.bottomLeading,.topTrailing,.center,.bottomTrailing],
        [.topLeading,.leading,.bottomLeading,.topTrailing,.trailing,.bottomTrailing]
    ]
    
    let pass : [[Int]] = [
        [10,10],[9,10],[8,10],[7,10],[6,10],[5,10],[4,10],[3,10],[2,10],[1,10],
        [0,10],[0,9],[0,8],[0,7],[0,6],[0,5],[0,4],[0,3],[0,2],[0,1],
        [0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],
        [10,0],[10,1],[10,2],[10,3],[10,4],[10,5],[10,6],[10,7],[10,8],[10,9]
    ]
    
    @State var vm = ViewModel()
    @State var dice : Int = 1
    @State var turn : Bool = false
    @State var currentCoordinate : [Int] = [10,10]
    
    var body: some View {
        ZStack{
            VStack(spacing: 3){
                ForEach(0..<11,id:\.self){y in
                    HStack(spacing: 3){
                        ForEach(0..<11,id:\.self){x in
                            VStack(spacing: 0){
                                Rectangle()
                                    .fill(vm.fillColor(x, y))
                                    .frame(height: 10)
                                ZStack{
                                    Rectangle()
                                        .fill(vm.fillBGColor(x, y))
                                    VStack{
                                        Text(vm.gridName(x,y))
                                        //                                        Text("\(x),\(y)")
                                    }
                                    Circle()
                                        .fill(vm.isShowDot(x, y, currentCoordinate: currentCoordinate))
                                        .frame(width: 30)
                                }
                            }
                        }
                    } // HStack
                }
            } // VStack
            //            Text("MontrealPoly")
            //                .font(.system(size: 50))
            //                .padding()
            //                .border(.primary, width: 2)
            //                .rotationEffect(.degrees(-45))
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
                }.rotationEffect(Angle(degrees: turn ? 0 : 180))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            dice = Int.random(in: 1...6)
                            turn.toggle()
                            currentCoordinate = vm.getPosition(dice: dice, pass: pass, currentCoor: currentCoordinate)
                        }
                    }
                //                HStack{
                //                    // 如何把button 点骰子？ zstack一个透明的rectangle？
                //                    Button("Random"){
                //                        withAnimation(.easeInOut(duration: 0.5)){
                //                            dice = Int.random(in: 1...6)
                //                            turn.toggle()
                //                            currentCoordinate = vm.getPosition(dice: dice, pass: pass, currentCoor: currentCoordinate)
                //                            
                //                        }
                //                    }.buttonStyle(.borderedProminent)
                //                }
                
                
                Text("\(dice)")
                Image(systemName: "questionmark")
                    .font(.system(size: 50))
                    .padding()
                    .border(.primary, width: 2)
                    .offset(x: 140, y: 140)
                Image(systemName: "dollarsign")
                    .font(.system(size: 50))
                    .padding()
                    .border(.primary, width: 2)
                    .offset(x: -140, y: -140)
            }
//            .border(.primary)
            .padding()
        }
        
        
    }
}
