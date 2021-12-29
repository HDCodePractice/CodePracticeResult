import SwiftUI
struct ContentView: View {
    @State var memberNumber = 1
    let unitPrices = [200,300,400]
    @State var unitPrice = 300
    @State var tax: Double = 0.15
    @FocusState var unitFocused: Bool
    @State var lb:Double = 1
    @State var kg:Double = 0.453592
    @State var o:Double = 16
    var kgo:Double{
        return Double(kg)*35.274
    }
    var lbo:Double{
        return Double(lb)*16
    }
    var lbkg:Double{
        return Double(lb)/2.205
    }
    var kglb:Double{
        return Double(kg)*2.205
    }
    @State var c:Double = 0
    @State var f:Double = 32
    @State var k:Double = 273.15
    var fk:Double{
        return Double((f)-32)*5/9+273.15
    }
    var kf:Double{
        return Double((k)-273.15)*9/5+32
    }
    var kc:Double{
        return Double(k) - 273.15
    }
    var ck:Double{
        return Double(c) + 273.15
    }
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
            Form{
                Section{
                    HStack{
                        Text("Celsius:")
                        TextField("Celsius", value:$c, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($unitFocused)
                    }
                    HStack{
                        Text("From: \(c)")
                    }
                    HStack{
                        
                        Text("How: \(c) * 9/5 + 32")
                    }
                    HStack{
                        Text("To: \(cf)")
                    }
                    HStack{
                        Text("Is: Celsius: \(c) to Farenheit:")
                        Text(cf,format: .currency(code: ""))
                    }
                    HStack{
                        Text("From: \(c)")
                    }
                    HStack{
                        
                        Text("How: \(c) + 273.15")
                    }
                    HStack{
                        Text("To: \(ck)")
                    }
                    HStack{
                        Text("Is: Celsius: \(c) to Kelvin:")
                        Text(ck,format: .currency(code: ""))
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
                        Text("Temperature")
                        Spacer()
                    }.font(.headline)
                }
                Section{
                    HStack{
                        Text("Farenheit:")
                        TextField("Farenheit", value:$f, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($unitFocused)
                    }
                    HStack{
                        Text("From: \(f)")
                    }
                    HStack{
                        Text("How: (\(f) - 32) * 5/9")
                    }
                    HStack{
                        Text("To: \(fc)")
                    }
                    HStack{
                        Text("Is: Farenheit: \(f) to Celsius:")
                        Text(fc,format: .currency(code: ""))
                    }
                    HStack{
                        Text("From: \(f)")
                    }
                    HStack{
                        
                        Text("How: \(f) * 9/5 + 32")
                    }
                    HStack{
                        Text("To: \(fk)")
                    }
                    HStack{
                        Text("Is: Farenheit: \(c) to Kelvin:")
                        Text(ck,format: .currency(code: ""))
                    }
                }header:{
                    HStack{
                        Spacer()
                        Text("Temperature Cont")
                        Spacer()
                    }.font(.headline)
                }
                Section{
                    HStack{
                        Text("Pounds:")
                        TextField("Pounds", value:$lb, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($unitFocused)
                    }
                    HStack{
                        Text("From: \(lb)")
                    }
                    HStack{
                        
                        Text("How: \(lb) / 2.205")
                    }
                    HStack{
                        Text("To: \(lbkg)")
                    }
                    HStack{
                        Text("Pounds: \(lb) to Kilograms:")
                        Text(lbkg,format: .currency(code: ""))
                    }
                    HStack{
                        Text("From: \(lb)")
                    }
                    HStack{
                        
                        Text("How: \(lb) * 16")
                    }
                    HStack{
                        Text("To: \(lbo)")
                    }
                    HStack{
                        Text("Pounds: \(lb) to Ounces:")
                        Text(lbo,format: .currency(code: ""))
                    }
                }header: {
                        HStack{
                        Spacer()
                        Text("Weight")
                        Spacer()
                    }.font(.headline)
                }
                    Section{
                        HStack{
                            Text("Kilograms:")
                            TextField("Kilograms", value:$kg, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($unitFocused)
                        }
                        HStack{
                            Text("From: \(kg)")
                        }
                        HStack{
                            
                            Text("How: \(kg) * 2.205")
                        }
                        HStack{
                            Text("To: \(kglb)")
                        }
                        HStack{
                            Text("Kilograms: \(kg) to Pounds:")
                            Text(kglb,format: .currency(code: ""))
                        }
                        HStack{
                            Text("From: \(kg)")
                        }
                        HStack{
                            
                            Text("How: \(kg) * 35.274")
                        }
                        HStack{
                            Text("To: \(kgo)")
                        }
                        HStack{
                            Text("Kilograms: \(kg) to Ounces:")
                            Text(kgo,format: .currency(code: ""))
                        }
                        
                    }header: {
                        HStack{
                            Spacer()
                            Text("Weight Cont")
                            Spacer()
                        }.font(.headline)
                    }
                    
                
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

