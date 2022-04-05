import SwiftUI

struct ContentView: View {
    
    let fromsExpanded = [
        ["Kilogram","Pound","Gram","Ounce"],
        ["Kilometre","Mile","Yard","Metre"],
        ["Square Kilometre","Square Mile","Acre"],
        ["Celsius","fahrenheit"]
    ]
    let froms = [
        ["kg","lb","g","oz"],
        ["km","mi","yd","m"],
        ["km²","mi²","ac"],
        ["°C","°F"]
    ]
    let exchanges = [
        [1.0,2.20462262,1000.0,35.27],
        [1.0,0.621371192,1093.6133,1000.0],
        [1,1000000,247.105381],
        [1,1.8+32]
    ]
    let unitNames = [
        "Mass",
        "Length",
        "Area",
        "temperature"
    ]
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                LinearGradient(colors: [.purple,.blue], startPoint: .top, endPoint: .bottom)
                
                HStack {
                    VStack(alignment: .leading, spacing: 20){
                        ForEach(0..<froms.count) { each in
                            NavigationLink("\(unitNames[each])") {
                                MetricConversionUnitView(expanded: fromsExpanded[each], froms: froms[each], exchange: exchanges[each], unitName: unitNames[each])
                            }.font(.title)
                        }
                    }.padding()
                    Spacer()
                }.padding()
                .navigationTitle("Metric Conversion")
                .foregroundColor(.white)
                    
            }.ignoresSafeArea()
            
            
        }
    }
}
