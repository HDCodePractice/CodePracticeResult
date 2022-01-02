import SwiftUI

struct ContentView: View{
    
    let fromsExpanded = [
        ["Kilogram","Pound","Gram","Ounce"],
        ["Kilometre","Mile","Yard","Metre"],
        ["Square Kilometre","Square Mile","Acre"]
    ]
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
    var body: some View{
        NavigationView{
            ZStack{
                LinearGradient(colors: [.purple,.blue], startPoint: .top, endPoint: .bottom)
                VStack(spacing:20){
                    ForEach(unitNames,id: \.self){unitName in
                        NavigationLink(){
                            ConversionView(expanded: fromsExpanded[0], froms: froms[0], exchange: exchanges[0], unitName: unitNames[0])
                        }label: {
                            ZStack{
                                Text(unitName)
                                    .font(.title)
                                    .padding()
                            }
                            .frame(width:300)
                            .foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .navigationTitle("Metric Conversion")
        }
    }
}
struct ConversionView: View {
    let expanded: [String]
    let froms: [String]
    let exchange: [Double]
    let unitName: String
    @State var fromSelect = 0
    @State var toSelect = 0
    @State var andSelect = 0
    @State var fromUnit = "1"
    @State var andUnit = "1"
    let inputOrder = [["1","2","3"],["4","5","6"],["7","8","9"],["C","0","."]]
    var body: some View {
        VStack(spacing:20){
            Text(unitName)
                .font(.largeTitle)
            HStack{
                Text("Current Unit")
                    .font(.title)
                Spacer()
                Text("Final Unit")
                    .font(.title)

            }
            .padding()
            HStack{
                Picker("", selection: $fromSelect){
                    ForEach(0..<froms.count){
                        Text(froms[$0])
                            .font(.title)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Picker("", selection: $toSelect){
                    ForEach(0..<froms.count){
                        Text(froms[$0])
                            .font(.title)
                    }
                }
                .pickerStyle(MenuPickerStyle())

            }
            HStack(){
                Text("Input")
                Spacer()
                Text(fromUnit)
            }
            .padding()
            Spacer()
            VStack{
                ForEach(inputOrder,id:\.self){row in
                    HStack{
                        ForEach(row,id:\.self){ item in
                            Button{
                                if item == "C"{
                                    fromUnit = "0"
                                }else{
                                    fromUnit += item
                                }

                            }label: {
                                ButtonView(item: item)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView(
            expanded: ["Kilogram","Pound","Gram","Ounce"],
            froms: ["kg","lb","g","oz"],
            exchange: [1.0,2.20462262,1000.0,35.27],
            unitName: "Mass")
    }
}

struct ButtonView: View {
    var item : String
    var body: some View {
        ZStack{
            Color.blue
            Text("\(item)")
                .font(.title)
                .foregroundColor(.white)
        }
        .frame(width: .infinity)
        .cornerRadius(20)
        .shadow(radius: 5)
        
    }
}


