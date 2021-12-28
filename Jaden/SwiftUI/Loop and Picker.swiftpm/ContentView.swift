import SwiftUI
struct ContentView: View {
    @State var memberNumber = 1
    let unitPrices = [200,300,400]
    @State var unitPrice = 300
    @State var tax: Double = 0.15
    @FocusState var unitFocused: Bool
    @State var lb:Double = 1
    @State var kg:Double = 0.453592
    var lbkg:Double{
        return Double(lb)/2.205
    }
    var kglb:Double{
        return Double(kg)*2.205
    }
    @State var c:Double = 0
    @State var f:Double = 32
    var cf:Double{
        return Double(c)*9/5+32
    }
    var fc:Double{
        return Double((f)-32)*5/9
    }
    var totalPrice:Double{
        return Double(unitPrice)*Double(memberNumber)*(1+tax)
    }
    var body: some View {
//        NavigationView{
            Form{
                Section{
                    HStack{
                        Text("Amount of People Attending:")
                        TextField("People Attending", value:$memberNumber, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($unitFocused)
                    }
                    HStack{
                        Text("Ticket Price:")
                        Picker("Unit Price",selection:$unitPrice){
                            ForEach(unitPrices,id: \.self){ i in
                                Text("\(i)")
                            }
                        }.pickerStyle(.segmented)
                    }
                    HStack{
                        Text("Tax Percentage:")
                        TextField("Tax", value:$tax, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($unitFocused)
                    }
                    HStack{
                        Text("Total Price:")
                        Text(totalPrice,format: .currency(code: "CAD"))
                    }
                }header: {
                    HStack{
                        Spacer()
                        Image(systemName: "dollarsign.circle.fill")
                        Text("Metric Conversion")
                        Spacer()
                    }.font(.largeTitle)
                    HStack{
                        Spacer()
                        Text("Tax")
                        Spacer()
                    }.font(.title)
                }
                Section{
                    HStack{
                        Text("Celsius:")
                        TextField("Celsius", value:$c, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($unitFocused)
                    }
                    HStack{
                        Text("Farenheit:")
                        TextField("Farenheit", value:$f, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($unitFocused)
                    }
                    HStack{
                        Text("Celsius: \(c) to Farenheit:")
                        Text(cf,format: .currency(code: ""))
                    }
                    HStack{
                        Text("Farenheit: \(f) to Celsius:")
                        Text(fc,format: .currency(code: ""))
                    }
                }header: {
                    HStack{
                        Spacer()
                        Text("Temperature")
                        Spacer()
                    }.font(.title)
                }
                Section{
                    HStack{
                        Text("Pounds:")
                        TextField("Pounds", value:$lb, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($unitFocused)
                    }
                    HStack{
                        Text("Kilograms:")
                        TextField("Kilograms", value:$kg, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($unitFocused)
                    }
                    HStack{
                        Text("Kilogranms: \(kg) to Pounds:")
                        Text(kglb,format: .currency(code: ""))
                    }
                    HStack{
                        Text("Pounds: \(lb) to Kilograms:")
                        Text(lbkg,format: .currency(code: ""))
                    }
                }header: {
                    HStack{
                        Spacer()
                        Text("Weight")
                        Spacer()
                    }.font(.title)
                }
                
                
                
                
                .toolbar(){
                    ToolbarItemGroup(placement: . keyboard){
                        Button("Done"){
                            unitFocused = false

                        }
                    }
                }
        }
    }
}
