import SwiftUI

struct ContentView: View {
    let froms = [
        ["kg","lb","g","oz"],
        ["km","mi","yd","m"],
        ["km²","mi²","ac"]
    ]
    let exchanges = [
        [1.0,2.20462262,1000.0,35.27],
        [1.0,0.621371192,1093.6133,1000.0],
        [1,1000000,247.105381]
    ]
    let unitNames = [
        "Mass",
        "Length",
        "Area"
    ]
    var body: some View {
        NavigationView{
            Form{
                NavigationLink("\(unitNames[0])"){
                    MetricConversionUnitView(
                        froms: froms[0],
                        exchange: exchanges[0],
                        unitName: unitNames[0]
                    )
                }
                NavigationLink("\(unitNames[1])"){
                    MetricConversionUnitView(
                        froms: froms[1],
                        exchange: exchanges[1],
                        unitName: unitNames[1]
                    )
                }
                NavigationLink("\(unitNames[2])"){
                    MetricConversionUnitView(
                        froms: froms[2],
                        exchange: exchanges[2],
                        unitName: unitNames[2]
                    )
                }
            }

        }
    }
}

struct MetricConversionUnitView: View {
    let froms : [String]
    let exchange : [Double]
    let unitName : String
    @State var fromSelect = 0
    @State var toSelect = 0
    @State var fromUnit = 1.0
    @State var x = 0
    @State var total = 0
    @State var z = 0
    var toUnit: Double{
        let from = fromUnit / exchange[fromSelect]
        let toUnit = from * exchange[toSelect]
        return toUnit
    }
    func pow (_ base:Int, _ power:Int) -> Int {
      var answer : Int = 1
      for _ in 0..<power { answer *= base }
      return answer
    }

    var body: some View {
        NavigationView{
            Form{
                Section{
                    HStack{
                        Text("Current Unit")
                        Spacer()
                        Text("Final Unit")

                    }
                    HStack{
                        Picker("", selection: $fromSelect){
                            ForEach(0..<froms.count){
                                Text(froms[$0])
                            }
                        }
                        .pickerStyle(.)
//                        Spacer()
//                        Spacer()
//                        Spacer()
//                        Spacer()
//                        Picker("", selection: $toSelect){
//                            ForEach(0..<froms.count){
//                                Text(froms[$0])
//                            }
//                        }
//                        .pickerStyle(.automatic)

                    }
                    HStack{
                        Text("How Much:")
                        Text("\(total)")
                    }
                    Button("1"){
                        z = pow(10, x)
                        total += 1*z
                        x += 1
                        
                    }
                    HStack{
                        Text("Is \(toUnit)")
                    }
                    
                    Text("\(fromSelect)")
                }header: {
                    Text(unitName)
                }
            }

        }
    }
        
}
