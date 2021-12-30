import SwiftUI

struct ContentView: View {
    var weightunits = ["kilograms", "grams", "pounds", "ounces"]
    @State private var InputUnit = "kilograms"
    @State private var OutputUnit = "grams"
    @State private var InputNumber = 1
    @FocusState var InputAmountFocus: Bool
    
    var body: some View {
        VStack {
            Text("Weight").font(.system(size: 60))
            HStack{
                Text("From:")
                    .font(.system(size: 30))
                HStack{
                    TextField("Number:", value: $InputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($InputAmountFocus)
                        .font(.system(size: 30))
                }
                Picker("InputUnit:",selection: $InputUnit){
                    ForEach(weightunits,id: \.self){ unit in
                        Text(unit)
                            .font(.system(size: 30))
                    }
                }
            HStack{
                Text("Formula:")
                    .font(.system(size: 30))
                Text("Formula (Text Display)")
                    .font(.system(size: 30))
            }
            HStack{
                Text("To:")
                    .font(.system(size: 30))
                Picker("OutputUnit:",selection: $OutputUnit){
                    ForEach(weightunits,id: \.self){ unit in
                        Text(unit)
                    }
                }
            }
            HStack{
                Text("Answer:")
                    .font(.system(size: 30))
                Text("answer (text display )")
                    .font(.system(size: 30))
            }
            
        }.toolbar(){
            ToolbarItemGroup(placement: .keyboard){
                Button("Done"){
                    InputAmountFocus = false
                }
            }
        }
    }
}
