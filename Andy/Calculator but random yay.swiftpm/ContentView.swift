import SwiftUI

struct ContentView: View {
    @State var symbol = [["1","2","3"],["4","5","6"],["7","8","9"],["0","+ / -"],["Add","Clear"]]
    @State var result = 0
    @State var result1 = 0
    @State var result2 = 0
    @State var tru = false
    @State var tru1 = false
    @State var tru2 = false
    
    @State var number : Int = 0
    @State var score : [String] = []
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .fill(tru==true ? .white : .clear)
                    .frame(width:40,height:40)
                Text(tru==true ? String(result) : "0")
                    .foregroundColor(tru==true ? .accentColor : .clear)
                Rectangle()
                    .fill(tru1==true ? .white : .clear)
                    .frame(width:40,height:40)
                Text(tru1==true ? String(result1) : "0")
                    .foregroundColor(tru1==true ? .accentColor : .clear)
                Rectangle()
                    .fill(tru2==true ? .white : .clear)
                    .frame(width:40,height:40)
                Text(tru2==true ? String(result2) : "0")
                    .foregroundColor(tru2==true ? .accentColor : .clear)
            }
            
            HStack{
                ForEach(0..<score.count,id:\.self){ l in
                    Text(score[l])
                }
            }
            HStack{
                Button("Random"){
                    result = 0
                    result1 = 0
                    result2 = 0
                    tru = false
                    tru1 = false
                    tru2 = false
                    if score.count > 0{
                        withAnimation(.linear(duration: 1).delay(1)){
                        result = Int(score[Int.random(in:0...score.count-1)])!
                            tru = true
                        }
                        withAnimation(.linear(duration: 1).delay(5)){
                        result1 = Int(score[Int.random(in:0...score.count-1)])!
                            tru1 = true
                        }
                        withAnimation(.linear(duration: 1).delay(9)){
                        result2 = Int(score[Int.random(in:0...score.count-1)])!
                            tru2 = true
                        }
                    }
                }.buttonStyle(.bordered)
                Button("Reset"){
                    score = []
                }.buttonStyle(.bordered)
            }
            Divider()
            Text("Number: \(number)")
                .font(.title2)
            ForEach(0..<symbol.count,id:\.self){ i in
                HStack{
                    ForEach(0..<symbol[i].count,id:\.self){ j in
                        Button(symbol[i][j]){
                            if let b = Int(symbol[i][j]){
                                if number < 999 && number > -999{
                                    number = number*10+b
                                    if number > 999{
                                        number = 999
                                    }else if number < -999{
                                        number = -999
                                    }
                                }
                            }else{
                                if symbol[i][j] == "+ / -"{
                                    number = number * -1
                                }else if symbol[i][j] == "Clear"{
                                    number = 0
                                }else if symbol[i][j] == "Add"{
                                    score.append("\(number)")
                                    number = 0
                                }
                            }
                        }.buttonStyle(.bordered)
                    }
                }
            }
        }
    }
}
