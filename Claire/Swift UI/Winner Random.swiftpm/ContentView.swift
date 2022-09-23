import SwiftUI

struct ContentView: View {
    @State var labels = [
        ["1","2","3"],
        ["4","5","6"],
        ["7","8","9"],
        ["+/-","0"],
        ["Add","Clear"],
    ]
    @State var number : Int = 0
    @State var scores : [Int] = []
    
    var body: some View {
        VStack{
            
            Text("000")
                .padding()
            
            HStack{
                ForEach(0..<scores.count,id:\.self){ index in
                    Text("\(scores[index])")
                }
            }
            HStack{
                Button("Random"){
                    scores = scores.shuffled()
                    Text("YOU GOT: \(scores[0])")
                    
                }.buttonStyle(.bordered)
                Button("Reset"){
                    scores = []
                }.buttonStyle(.bordered)
            }
            Divider()
            Text("Number:\(number)")
                .font(.title2)
            ForEach(0..<labels.count, id:\.self){ row in
                HStack{
                    ForEach(0..<labels[row].count, id:\.self){ column in
                        Button(labels[row][column]){
                            if let input = Int(labels[row][column]){
                                if number < 999 && number > -999{
                                    number = number*10+input
                                }
                            }else{
                                if labels[row][column] == "+/-"{
                                    number = number * -1
                                }else if labels[row][column] == "Clear"{
                                    number = 0
                                }else if labels[row][column] == "Add"{
                                    scores.append(number)
                                    number = 0
                                }
                            }
                        }.buttonStyle(.bordered)
                    }
                }
            }
        }
        .padding()
    }
}
