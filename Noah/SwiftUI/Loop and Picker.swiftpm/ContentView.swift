import SwiftUI

struct ContentView: View {
    let mass1 = ["g","kg","ounce","lb"]
    let mass2 = ["g","kg","ounce","lb"]
    let length1 = ["km","dcm","m","dm","cm","mm","mile","yard","foot","inch"]
    let length2 = ["km","dcm","m","dm","cm","mm","mile","yard","foot","inch"]
    let area1 = ["km²","m²","mi²","ac"]
    let area2 = ["km²","m²","mi²","ac"]

    @State var c1 = "g"
    @State var c2 = "kg"
    @State var c3 = "km"
    @State var c4 = "m"
    @State var c5 = "km²"
    @State var c6 = "m²"
    
    @State var tax : Double = 15.00
    let unitPrices = [2,500,2000000]
    @State var unitPrice = 2000000
    
    @FocusState var f1 : Bool
    @FocusState var f2 : Bool
    @FocusState var f3 : Bool
    @FocusState var f4 : Bool
    @FocusState var f5 : Bool
    @FocusState var f6 : Bool
//    var totalPrice: Double {
//        return Double(unitPrice)*Double(daters)*(1+tax)
//    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack {
                        Picker("Mass1", selection: $c1) {
                            ForEach(mass1,id: \.self) { m in
                                Text(m)
                            }
                        }.pickerStyle(.segmented)
                        Picker("Mass2", selection: $c2) {
                            ForEach(mass2,id: \.self) { m in
                                Text(m)
                            }
                        }.pickerStyle(.segmented)
                        TextField("How many \(c1)", value: $tax, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($f1)
                        TextField("How many \(c2)", value: $tax, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($f2)
                        Text("\(c1)")
                    }
                    
                } header: {
                    HStack {
                        Image(systemName: "person.fill.questionmark")
                        Text("Choose Girlfriend")
                    }
                }
                Section {
                    Picker("number", selection: $c1) {
                        ForEach(1..<11) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.automatic)
                    HStack {
                        Text("Unit Price:")
                        Picker("Unit Price", selection: $unitPrice) {
                            ForEach(unitPrices,id: \.self) { i in
                                Text("\(i)")
                            }
                        }.pickerStyle(.automatic)
                    }
                    HStack {
                        Text("Tax %:")
                        TextField("Tax", value: $tax, format: .number)
                            .keyboardType(.decimalPad)l
                    }
                    HStack {
                        Text("Total Price: ")
                        
                        
                    }
                    
                } header: {
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                        Text("Dating Price")
                    }
                }
            }
            .navigationTitle("Metric Conversion")
        }
    }
}
