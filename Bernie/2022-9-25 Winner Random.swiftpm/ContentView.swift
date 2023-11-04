import SwiftUI

struct ContentView: View {
    @State var inputNum = 0
    @State var numList  = [Int]()
    @State var result = 0
    @State var toggle = true
    
    let keypad = [["1","2","3"],
                  ["4","5","6"],
                  ["7","8","9"],
                  ["+/-","0"],
                  ["Add","Clear"]
    ]
    
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.accentColor)
                
                Text("\(result)")
                    .font(.largeTitle)
            }
            .frame(width: 200, height: 200)
            .padding()
            .rotationEffect(.degrees(toggle ? 720 : 0))
            Text("Number List:")
                .font(.title2)
            HStack{
                ForEach(numList, id:\.self){element in 
                    Text("\(element) ")
                }
            }
            .font(.title2)
            HStack{
                Button { 
                    if let r = numList.randomElement(){
                        withAnimation(.easeInOut(duration: 1.00)
                            .speed(5.00)
                            .delay(0.00)
                            .repeatCount(3)) { 
                                
                                toggle.toggle()
                                result = r
                            }
                    }
                    
                    
                    
                    
                } label: { 
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                        Text("Random")
                            .foregroundColor(.primary)
                    }
                }
                Button { 
                    numList = []
                    result = 0
                } label: { 
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                        Text("Reset")
                            .foregroundColor(.primary)
                    }
                }
            }
            Divider()
            Text("Number:  \(inputNum)")
                .font(.largeTitle)
            
            
            ForEach(keypad, id:\.self){row in 
                HStack{
                    ForEach (row, id:\.self){key in
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                            Button{
                                if key == "Clear"{
                                    inputNum = 0
                                }else if key == "+/-"{
                                    if inputNum != 0 {
                                        inputNum = inputNum * -1
                                    }
                                }else if key == "Add"{
                                    numList.append(inputNum)
                                    inputNum = 0
                                }else if let intKey = Int(key),inputNum < 100 && inputNum > -100 {
                                    
                                    inputNum = inputNum*10 + intKey
                                    
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
        }
        .padding(20)
    }
}

