import SwiftUI

struct ContentView: View {
    @State var words = ["call","way","do","hold","good"]
    @State var carX = 0.0
    @State var offsetX : [Double] = [0,10,20,30,40]
    @State var offsetY : [Double] = [0,10,20,30,40]
    @State var start = -700.0
    @State var color = Color.black
    @State var points = 0
    func genPosition(){
        offsetX = []
        offsetY = []
        for _ in 0..<words.count{
            offsetX.append(Double.random(in: -240..<240))
            offsetY.append(Double.random(in: -780..<start))
        }
    }
    var body: some View {
        VStack{
            HStack{
                Text("Points: \(points)")
            }
            ZStack(alignment: .bottom){
                Rectangle()
                    .fill(.blue)
                ForEach(0..<words.count,id:\.self){ word in
                    Image(systemName: "dollarsign.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .offset(x:offsetX[word], y:offsetY[word])
                        .foregroundColor(color)
                    
                }
                
                Image(systemName: "car")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .offset(x: carX, y: 0)
            }
            .frame(width: 500, height: 800)
            .onAppear{
                genPosition()
            }
            HStack{
                Button{
                    if carX >= -224{
                        carX -= 15
                        print(carX)
                    }
                    for i in 0..<offsetY.count{
                        print(carX,offsetX[i],offsetY[i])
                        if carX >= offsetX[i] - 20 && carX <= offsetX[i] + 20 && offsetY[i] >= -9 && offsetY[i] <= 10{
                            points += 2
                        }
                    }
                    
                }label: {
                    Image(systemName: "arrow.backward.square")
                        .foregroundColor(.primary)
                        .font(.largeTitle)
                }.buttonStyle(.bordered)
                Button("Drop"){
                    genPosition()
                    color = Color.black
                    withAnimation{
                        for i in 0..<offsetY.count{
                            for j in 1...15{
                                withAnimation(.easeInOut(duration: 4.0)){
                                    offsetY[i] += 50
                                    
                                }
                            }
                            
                            //                        offsetY[i] += 50
                        }
                    }
                    withAnimation(.easeInOut(duration: 0.1).delay(5.0)){
                        color = Color.clear
                        //                genPosition()
                    }
                }.buttonStyle(.bordered)
                Button{
                    if carX <= 224{
                        carX += 15
                        print(carX)
                    }
                    for i in 0..<offsetY.count{
                        print(carX,offsetX[i],offsetY[i])
                        if carX >= offsetX[i] - 20 && carX <= offsetX[i] + 20 && offsetY[i] >= -9 && offsetY[i] <= 15{
                            points += 2
                        }
                    }
                }label: {
                    Image(systemName: "arrow.forward.square")
                        .foregroundColor(.primary)
                        .font(.largeTitle)
                }.buttonStyle(.bordered)
            }
            HStack{
                Button("Reset Score"){
                    points = 0
                }.buttonStyle(.bordered)
            }

        }
    }
}


