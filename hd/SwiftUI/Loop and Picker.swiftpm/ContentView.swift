import SwiftUI

// ForEach
// ForEach中的变量使用
// ForEach from Array，id的使用
// NavigationView
// Picker
// SF Symbols 3
// 使用函数返回值定义Variable
// @FocusState 设置光标
// 为键盘加入toolbar

// 作业：写一个APP给我们自己使用，实现常见的Metric Conversions
// lb-kg、ft-m、in-cm、°C-°F、m²-ft²
// 相信这个小工具会成为你和家人日常的好帮手的

struct ContentView: View {
    let actors = ["rock","bean","carrey"]
    @State var choiceActor = "rock"
    @State var memberNumber = 1
    let unitPrices = [200,300,400]
    @State var unitPrice = 200
    @State var tax: Double = 0.15
    @FocusState var taxFocused: Bool
    
    var totalPrice:Double{
        return Double(unitPrice)*Double(memberNumber)*(1+tax)
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    ForEach(0..<2){
                        Text("Hello, world!\($0)")
                    }
                    ForEach(2..<4){i in
                        Text("Hello, world!\(i)")
                    }
                }header: {
                    Text("Demo")
                }
                
                Section{
                    Image(choiceActor)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    Picker("Your choice",selection: $choiceActor){
                        ForEach(actors,id: \.self){ actor in
                            Text(actor)
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    HStack{
                        Image(systemName: "person.fill.questionmark")
                        Text("Choose Actor")
                    }
                }
                
                Section{
                    Picker("Number:",selection: $memberNumber){
                        ForEach(0..<51){
                            Text("\($0)")
                        }
                    }.pickerStyle(.automatic)
                    HStack{
                        Text("Unit Price:")
                        Picker("Unit Price",selection: $unitPrice){
                            ForEach(unitPrices,id: \.self){ i in
                                Text("\(i)")
                            }
                        }.pickerStyle(.segmented)
                    }
                    HStack{
                        Text("Tax:")
                        TextField("Tax", value: $tax, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($taxFocused)
                    }
                    HStack{
                        Text("Total price:")
                        Text(totalPrice,format: .currency(code: "CAD"))
                    }
                    
                }header: {
                    HStack{
                        Image(systemName: "dollarsign.circle.fill")
                        Text("Price")
                    }
                    
                }
            }
            .navigationTitle("Ticket price")
            .toolbar(){
                ToolbarItemGroup(placement: .keyboard){
                    Button("Done"){
                        taxFocused = false
                    }
                }
            }
        }
    }
}
