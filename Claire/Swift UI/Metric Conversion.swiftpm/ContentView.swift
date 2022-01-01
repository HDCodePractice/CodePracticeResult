import SwiftUI

struct ContentView: View {
    
    let froms = [
        ["kg", "lb", "g", "oz"],
        ["km", "mi", "yd", "m"],
        ["km²", "mi²", "ac"]
    ]
    let exchanges = [
        [1.0, 2.20462262, 1000.0, 35.27],
        [1.0, 0.621371192, 1093.6133, 1000.0],
        [1, 1000000, 247.105281]
    ]
    let unitNames = [
        "Mass",
        "Length",
        "Area"
    ]
//
//    var body: some View {
//        Form{
//            ForEach(0..<froms.count){
//                MetricConversionUnitView(
//                    froms: froms[$0],
//                    exchange: exchanges[$0],
//                    unitName: unitNames[$0]
//                )
//            }
//        }
//    }
    var body: some View {
//        VStack{
//            HStack{
//                Text("Hello                  ")
//                Image(systemName: "repeat")
//                    .foregroundColor(.accentColor)
//                Text("                 Hello")
//            }
//
//            HStack{
//                // Picker
//                Text("USD")
//                    .multilineTextAlignment(.trailing)
//                Text("                                         ")
//                // Picker
//                Text("USA")
//                    .multilineTextAlignment(.leading)
//            }
//        }
        
        NavigationView{
            List{
                NavigationLink("Weight Conversion", destination: MetricConversionUnitView(froms: froms[0], exchange: exchanges[0], unitName: unitNames[0]))
                NavigationLink("Length Conversion", destination: MetricConversionUnitView(froms: froms[1], exchange: exchanges[1], unitName: unitNames[1]))
                NavigationLink("Area Conversion", destination: MetricConversionUnitView(froms: froms[2], exchange: exchanges[2], unitName: unitNames[2]))
            }
            .navigationTitle("Metric Conversion")
        }
        
    }
}

struct MetricConversionUnitView: View {
    let froms : [String]
    let exchange : [Double]
    let unitName : String
    @State var fromSelect = 1
    @State var toSelect = 0
    @State var toSelect1 = 0
    @State var fromUnit = 1.0
    @State var inputValue = 0
    
    var toUnit: Double{
        let from = fromUnit / exchange[fromSelect]
        let toUnit = from * exchange[toSelect]
        return toUnit
    }
    
    var toUnit2: Double{
        let from = fromUnit / exchange[fromSelect]
        let toUnit = from * exchange[toSelect1]
        return toUnit
    }
    
    var body: some View {
//            Section{
//                    Picker("", selection: $fromSelect){
//                        ForEach(0..<froms.count){
//                            Text(froms[$0])
//                        }
//                    }
//                    .pickerStyle(.wheel)
//                HStack{
//                    Text("How:")
//                    TextField("Input from unit", value: $fromUnit, format: .number)
//                }
//                HStack{
//                    Text("To")
//                    Picker("", selection: $toSelect){
//                        ForEach(0..<froms.count){
//                            Text(froms[$0])
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                }
//                HStack{
//                    Text("Is \(toUnit)")
//                }
//            }header: {
//                Text(unitName)
//            }
        
        VStack{
            HStack{
                TextField("\(inputValue)", value: $inputValue, format: .number)
                    .keyboardType(.decimalPad)
                Image(systemName: "repeat")
                    .foregroundColor(.accentColor)
                Text("                       \(toUnit2)")
            }
            
            HStack{
                Picker("Select converter", selection: $toSelect){
                    ForEach(0..<froms.count){
                        Text(froms[$0])
                    }
                }
                .pickerStyle(.wheel)
                
                Picker("Select to convert", selection: $toSelect1){
                    ForEach(0..<froms.count){
                        Text(froms[$0])
                    }
                }
                .pickerStyle(.wheel)

            }
        }
    }
}

//struct BodyView: View {
//    let froms : [String]
//    let exchange : [Double]
//    let fromUnit : String
//    @State var fromSelect = 0
//    @State var toSelect = 0
//    @State var fromUnits = 1.0
//
//    @State var inputValue = 0
//
//    var toUnit: Double{
//        let from = fromUnits / exchange[fromSelect]
//        let toUnit = from * exchange[toSelect]
//        return toUnit
//    }
//
//    var bodys: some View {
//        VStack{
//            HStack{
//                TextField("Hello \(inputValue)", value: $inputValue, format: .number)
//                    .keyboardType(.decimalPad)
//                Image(systemName: "repeat")
//                    .foregroundColor(.accentColor)
//                Text("Hello \(toUnit)")
//            }
//
//            HStack{
//                Picker("Select converter", selection: $toSelect){
//                    ForEach(0..<froms.count){
//                        Text(froms[$0])
//                    }
//                }
//                .pickerStyle(.wheel)
//
//                Picker("Select to convert", selection: $toSelect){
//                    ForEach(0..<froms.count){
//                        Text(froms[$0])
//                    }
//                }
//                .pickerStyle(.wheel)
//
//            }
//        }
//    }
//
//
//}
//
//
