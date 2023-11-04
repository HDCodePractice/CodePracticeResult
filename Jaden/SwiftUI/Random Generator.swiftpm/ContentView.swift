import SwiftUI

struct ContentView: View {
    let keypad = [
        ["1","2","3"],
        ["4","5","6"],
        ["7","8","9"],
        ["+/-","0"],
        ["Add","Clear"],
    ]
    
    @State var inputNumber = 0
    @State var toggle = true
    @State var numbers: [Int] = []
    @State var result = 0
    
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.accentColor)
                Text(String(result))
                    .font(.largeTitle)
            }
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(toggle ? 0 : 360))
            .padding()
            Text("Number List:")
                .font(.title2)
            let ns = numbers.reduce(" ", { x, y in
                "\(x) \(y)"
            })
            Text(ns)
                .font(.title2)
            HStack{
                Button{
                    if let r = numbers.randomElement(){
                        withAnimation(.easeInOut(duration: 0.3).repeatCount(3)) { 
                            toggle.toggle()
                            result = r
                        }
                    }
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                        Text("Random")
                            .foregroundColor(.primary)
                    }
                }
                Button{
                    numbers = []
                    result = 0
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                        Text("Reset")
                            .foregroundColor(.primary)
                    }
                }
            }
            Divider()
            Text("Number:\(inputNumber)")
                .font(.largeTitle)
            ForEach(keypad,id:\.self){ row in
                HStack{
                    ForEach(row,id:\.self){ key in
                        Button{
                            if key=="Clear"{
                                inputNumber = 0
                            }else if key=="+/-"{
                                inputNumber = inputNumber * -1
                            }else if key=="Add"{
                                numbers.append(inputNumber)
                                inputNumber = 0
                            }else if let intKey=Int(key), inputNumber < 100 && inputNumber > -100 {
                                inputNumber = inputNumber*10+intKey
                            }
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                Text(key)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                }
            }
        }
        .padding(20)
    }
}
