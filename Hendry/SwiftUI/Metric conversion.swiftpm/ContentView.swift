import SwiftUI

struct ContentView: View {
    let froms = [["kg","lb","g","oz"],["km","mi","yd","m"],
        ["km","mi","ac"]]
    let exchanges = [
        [1.0,2.20462262,1000.0,35.27],
        [1.0]
    ]
    let unitName = ["Mass","length","Area"]
    var body: some View {
        Form{
            ForEach(0..<froms.count)
            MetricConversionView(
                froms : froms[$0],
                exchanges: [1.0,2.20462262,1000.0,35.27],
                unitName :"Mass"
            )
        }
    }
}
struct MetricConversionView: View {
    let froms : [String]
    let exchanges : [Double]
    let unitName : String
    @State var fromselect = 0
    @State var toselect = 0
    @State var fromunit = 1.0
    var toUnit : Double{
        let from = fromunit/exchanges[fromselect]
        let toUnit = from * exchanges[toselect]
        return toUnit
    }
    var body: some View {
        Form{
            Section{
                HStack{
                    Text("From")
                    Picker("",selection: $fromselect){
                        ForEach(0..<froms.count){
                            Text(froms[$0])
                        }
                    }.pickerStyle(.automatic)
                }
                HStack{
                    Text("How")
                    TextField("Input from unit",value:$fromunit,format:.number)
                }
                HStack{
                    Text("To")
                    Picker("",selection: $toselect){
                        ForEach(0..<froms.count){
                            Text(froms[$0])
                        }
                    }.pickerStyle(.segmented)
                }
                HStack{
                    Text("Is \(toUnit)")
                }
            }header:{
                Text(unitName)
            }
        }
    }
}

