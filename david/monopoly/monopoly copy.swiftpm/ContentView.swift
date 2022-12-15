import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    
    @State var chess = Chess()
    @State var steps:Int = 3
    @State var degrees = 0.0
    @State var toggle = false
    
    var body: some View {
        ZStack{
            VStack(spacing: 3){
                ForEach(0..<11,id:\.self){y in
                    HStack(spacing: 3){
                        ForEach(0..<11,id:\.self){x in
                            ZStack{
                                Rectangle()
                                    .fill(vm.fillColor(x, y))
                                VStack{
                                    Text(vm.gridName(x,y))
                                    Text("\(x),\(y)")
                                        
                                }
                                VStack{
                                    if !vm.chessLocation.isEmpty{
                                        Circle()
                                            .fill(.clear)
                                            .frame(width: 15)
                                        
                                        Circle()
                                            .fill(vm.chessLocation[x][y].chessColor)
                                            .frame(width: 15)
                                    }
                                    
                                    
                                }
                                
                                
                            }
                        }
                    } // HStack
                }
            } // VStack
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width:80,height: 80)
                    .rotation3DEffect(Angle(degrees: degrees), axis: (x:0,y:0,z:1))
                
                ForEach(0..<vm.dice(diceCode: steps).count){ i in
                    ZStack(alignment:vm.dice(diceCode: steps)[i]){
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.clear)
                            .frame(width:80,height: 80)
                        Circle()
                            .fill(.white)
                            .frame(width:15,height: 15)
                            .padding()
                        
                    }
                    .rotation3DEffect(Angle(degrees:degrees), axis: (x:0,y:0,z:1))
                }
            }
            .offset(x: 0, y: -200)
            .onTapGesture {
                withAnimation{   
                    
                    steps = (1...6).randomElement()!
                    degrees = (toggle ? 360.0:0.0)
                    toggle.toggle()
                    
                    vm.movingChess(steps: steps )
//                    print(vm.chessLocation)
                }    
            }
            
            Text("MontrealPoly")
                .font(.system(size: 50))
                .padding()
                .border(.primary, width: 6)
                .rotationEffect(.degrees(-45))
                .onTapGesture {
                    vm.startGame() 
                    
                }
            Image(systemName: "questionmark.square")
                .font(.system(size: 80))
                .rotationEffect(.degrees(-45))
                .padding()
            //                .border(.primary, width: 2)
                .offset(x: 80, y: 150)
            Image( systemName: "bitcoinsign.square")
                .font(.system(size: 80))
                .padding()
            //                .border(.primary, width: 2)
                .offset(x: 20, y: -150)
                .rotationEffect(.degrees(-45))
        }
        .border(.primary)
        .padding()
    }
}
