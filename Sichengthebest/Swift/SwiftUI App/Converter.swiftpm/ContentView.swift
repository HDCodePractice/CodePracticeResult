import SwiftUI

struct ContentView: View {
    @State var chosenMassUnit = "g"
    @State var chosenMassUnit2 = "lb"
    @State var massNumber = 10
    let massunits = ["g","kg","oz","lb"]
    let massMultiply = [1,1000,28.35,454]
    @State var chosenLengthUnit = "m"
    @State var chosenLengthUnit2 = "ft"
    @State var lengthNumber = 13
    let lengthunits = ["cm","m","km","in","ft","yd","mi"]
    let lengthMultiply = [1,100,1000,2.54,30.48,91.44,1609]
    @State var chosenAreaUnit = "sq.m"
    @State var chosenAreaUnit2 = "sq.ft"
    @State var areaNumber = 16.5
    let areaunits = ["sq.m","ha","sq.in","sq.ft","sq.yd","acres"]
    let areaMultiply = [1,10000,0.00064516,0.0929,0.836127,4047]
    @State var chosenTempUnit = "°C"
    @State var chosenTempUnit2 = "°F"
    @State var tempNumber = 32
    
    var massCalculator: Double {
        return Double(massNumber)*massMultiply[massunits.firstIndex(of: chosenMassUnit)!]/massMultiply[massunits.firstIndex(of: chosenMassUnit2)!]
    }
    var lengthCalculator: Double {
        return Double(lengthNumber)*lengthMultiply[lengthunits.firstIndex(of: chosenLengthUnit)!]/lengthMultiply[lengthunits.firstIndex(of: chosenLengthUnit2)!]
    }
    
    var areaCalculator: Double {
        return Double(areaNumber)*areaMultiply[areaunits.firstIndex(of: chosenAreaUnit)!]/areaMultiply[areaunits.firstIndex(of: chosenAreaUnit2)!]
    }
    var tempCalculator: Double {
        if chosenTempUnit == "°C" && chosenTempUnit2 == "°F" {
            return Double((tempNumber * 9/5) + 32)
        } else if chosenTempUnit == "°F" && chosenTempUnit2 == "°C" {
            return Double((tempNumber - 32) * 5/9)
        } else {
            return Double(tempNumber)
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Start unit:")
                            .font(.caption)
                        Picker("Unit Price",selection: $chosenMassUnit) {
                            ForEach(massunits, id: \.self) {unit in
                                Text("\(unit)")
                            }
                        }.pickerStyle(.segmented)
                    }
                    HStack {
                        Text("End unit:")
                            .font(.caption)
                        Picker("Unit Price",selection: $chosenMassUnit2) {
                            ForEach(massunits, id: \.self) {unit in
                                Text("\(unit)")
                            }
                        }.pickerStyle(.segmented)
                    }
                    HStack {
                        Text("Number of \(chosenMassUnit):")
                        TextField("Tax",value: $massNumber, format: .number)
                            .keyboardType(.decimalPad)
                    }
                    HStack {
                        Text("Number of \(chosenMassUnit2): \(massCalculator)")
                    }
                } header: {
                    Text("Mass")
                }
                Section {
                    HStack {
                        Text("Start unit:")
                            .font(.caption2)
                        Picker("Unit Price",selection: $chosenLengthUnit) {
                            ForEach(lengthunits, id: \.self) {unit in
                                Text("\(unit)")
                            }
                        }.pickerStyle(.segmented)
                    }
                    HStack {
                        Text("End unit:")
                            .font(.caption2)
                        Picker("Unit Price",selection: $chosenLengthUnit2) {
                            ForEach(lengthunits, id: \.self) {unit in
                                Text("\(unit)")
                            }
                        }.pickerStyle(.segmented)
                    }
                    HStack {
                        Text("Number of \(chosenLengthUnit):")
                        TextField("Tax",value: $lengthNumber, format: .number)
                            .keyboardType(.decimalPad)
                    }
                    HStack {
                        Text("Number of \(chosenLengthUnit2): \(lengthCalculator)")
                    }
                } header: {
                    Text("Length")
                }
                Section {
                    HStack {
                        Text("Start unit:")
                        Picker("",selection: $chosenAreaUnit) {
                            ForEach(areaunits, id: \.self) {unit in
                                Text("\(unit)")
                            }
                        }.pickerStyle(.automatic)
                    }
                    HStack {
                        Text("End unit:")
                        Picker("",selection: $chosenAreaUnit2) {
                            ForEach(areaunits, id: \.self) {unit in
                                Text("\(unit)")
                            }
                        }.pickerStyle(.automatic)
                    }
                    HStack {
                        Text("Number of \(chosenAreaUnit):")
                        TextField("Tax",value: $areaNumber, format: .number)
                            .keyboardType(.decimalPad)
                    }
                    HStack {
                        Text("Number of \(chosenAreaUnit2): \(areaCalculator)")
                    }
                } header: {
                    Text("Area")
                }
                Section {
                    HStack {
                        Text("Start unit:")
                        Picker("",selection: $chosenTempUnit) {
                            ForEach(["°C","°F"], id: \.self) {unit in
                                Text("\(unit)")
                            }
                        }.pickerStyle(.segmented)
                    }
                    HStack {
                        Text("End unit:")
                        Picker("",selection: $chosenTempUnit2) {
                            ForEach(["°C","°F"], id: \.self) {unit in
                                Text("\(unit)")
                            }
                        }.pickerStyle(.segmented)
                    }
                    HStack {
                        Text("Number of \(chosenTempUnit):")
                        TextField("Tax",value: $tempNumber, format: .number)
                            .keyboardType(.decimalPad)
                    }
                    HStack {
                        Text("Number of \(chosenTempUnit2): \(tempCalculator)")
                    }
                } header: {
                    Text("Temperature")
                }
            }
        }
    }
}

struct ConversionView: View {
    var body: some View {
        Text("Hello")
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
