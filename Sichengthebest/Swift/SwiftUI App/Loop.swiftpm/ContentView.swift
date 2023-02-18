import SwiftUI

struct ContentView: View {
    let actors = ["rock","carrey","bean"]
    let unitPrices = [200,300,450]
    @State var chosenActor = "rock"
    @State var chosenNumber = 4
    @State var chosenPrice = 200
    @State var tax = 0.13
    @FocusState var taxFocus: Bool
    
    var calculatePrice: Double {
        return Double(chosenNumber)*Double(chosenPrice)*(1+Double(tax))
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    ForEach(0..<3) {i in
                        Text("Hello, world!\(i)")
                    }
                } header: {
                    Text("Loop")
                }
                Section {
                    Image("\(chosenActor)")
                        .resizable()
                        .scaledToFit()
                    Picker("Choose actor",selection: $chosenActor) {
                        ForEach(actors, id: \.self) {actor in
                            Text(actor)
                        }
                    }
                    .pickerStyle(.automatic)
                } header: {
                    HStack {
                        Image(systemName: "trash.slash.square")
                        Text("Choose actor")
                    }
                }
                Section {
                    Picker("Number of tickets",selection: $chosenNumber) {
                        ForEach(1..<101) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.automatic)
                    Picker("Unit Price",selection: $chosenPrice) {
                        ForEach(unitPrices, id: \.self) {price in
                            Text("\(price)")
                        }
                    }.pickerStyle(.segmented)
                    TextField("Tax",value: $tax, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($taxFocus)
                }header: {
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                        Text("Buy tickets")
                    }
                }
                Section {
                    Text(calculatePrice,format: .currency(code: "CAD"))
                }
            }
            .navigationTitle("2022 New Year Show")
            .toolbar() {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        taxFocus = false
                    }
                }
            }
        }
    }
}
