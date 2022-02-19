import SwiftUI

struct ContentView: View {
    let function = ["AC", "+/-", "%", "/"]
    let row1 = ["7", "8", "9", "x"]
    let row2 = ["4", "5", "6", "-"]
    let row3 = ["1", "2", "3", "+"]
    let row4 = ["0", "", ".", "="]
    @State var number : Double = 0
    func tapIn(tapedContent : String) {
        if Int(tapedContent) != nil {
            number = number*10 + Double(tapedContent)!
        }else if tapedContent == "+/-"{
            number = number * -1
        }else if tapedContent == "%"{
            number = number / 100
        }
    }
    var body: some View {
        VStack(spacing: 0){
            Rectangle().fill(Color.white).frame(width: .infinity)
            Rectangle().fill(Color.white).frame(width: .infinity)
            ZStack(alignment:.trailing){
                Rectangle().fill(Color.white).frame(width: .infinity)
                Text("\(number)").font(.title).foregroundColor(Color.black).padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
            }
            HStack(spacing: 0){
                ForEach(function,id: \.self)
                               { i in
                                   ZStack {
                                       Circle().padding(/*@START_MENU_TOKEN@*/.all, 4.0/*@END_MENU_TOKEN@*/).foregroundColor(String(i) == "/" ? Color.gray : Color.orange)
                                       Text("\(i)")
                                           .font(.title).foregroundColor(Color.white)
                                    }
                                   .onTapGesture{
                                       tapIn(tapedContent: i)
                                   }
                               }
            }

            
            HStack(spacing: 0){
                ForEach(row1,id:\.self){ n in
                    ZStack {
                        Circle().padding(/*@START_MENU_TOKEN@*/.all, 4.0/*@END_MENU_TOKEN@*/).foregroundColor(Int(n) == nil ? Color.gray : Color.pink)
                        Text("\(n)")
                            .font(.title).foregroundColor(Color.white)
                     }
                    .onTapGesture{
                        tapIn(tapedContent: n)
                    }
                }
            }
            
            HStack(spacing: 0){
                ForEach(row2,id:\.self){ n in
                    ZStack {
                        Circle().padding(/*@START_MENU_TOKEN@*/.all, 4.0/*@END_MENU_TOKEN@*/).foregroundColor(Int(n) == nil ? Color.gray : Color.pink)
                        Text("\(n)")
                            .font(.title).foregroundColor(Color.white)
                     }
                    .onTapGesture{
                        tapIn(tapedContent: n)
                    }
                }
            }
            
            HStack(spacing: 0){
                ForEach(row3,id:\.self){ n in
                    ZStack {
                        Circle().padding(/*@START_MENU_TOKEN@*/.all, 4.0/*@END_MENU_TOKEN@*/).foregroundColor(Int(n) == nil ? Color.gray : Color.pink)
                        Text("\(n)")
                            .font(.title).foregroundColor(Color.white)
                     }
                    .onTapGesture{
                        tapIn(tapedContent: n)
                    }
                }
            }
            
            HStack(spacing: 0){
                ForEach(row4,id:\.self){ n in
                    ZStack {
                        Circle().padding(/*@START_MENU_TOKEN@*/.all, 4.0/*@END_MENU_TOKEN@*/).foregroundColor(Int(n) == nil ? Color.gray : Color.pink)
                        Text("\(n)")
                            .font(.title).foregroundColor(Color.white)
                     }
                    .onTapGesture{
                        tapIn(tapedContent: n)
                    }
                }
            }
            

            
        }


    }
}
