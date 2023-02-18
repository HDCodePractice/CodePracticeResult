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
                        NavigationLink(){
                            ConversionView(expanded: fromsExpanded[0], froms: froms[0], exchange: exchanges[0], unitName: unitNames[0])
                        }label: {
                            ZStack{
                                Text("Mass")
                                    .font(.title)
                                    .padding()
                            }
                            .frame(width:300)
                            .foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                        NavigationLink(){
                            ConversionView(expanded: fromsExpanded[1], froms: froms[1], exchange: exchanges[1], unitName: unitNames[1])
                        }label: {
                            ZStack{
                                Text("Length")
                                    .font(.title)
                                    .padding()
                            }
                            .frame(width:300)
                            .foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                        NavigationLink(){
                            ConversionView(expanded: fromsExpanded[2], froms: froms[2], exchange: exchanges[2], unitName: unitNames[2])
                        }label: {
                            ZStack{
                                Text("Area")
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
    let equations : Equations = Equations()
    let equation : Equation = Equation()
    @State var fromSelect = 0
    @State var toSelect = 0
    @State var andSelect = 0
    @State var fromUnit = ""
//    let fromsUnit = Double(fromUnit)
    @State var andUnit = "1"
    @State var total = ""
    @State var totals = ""
    @State var operate = ""
    @State var sum = 1.0
    @State var historyCount = 0
    let inputOrder = [["7","8","9","/"],["4","5","6","*"],["1","2","3","-"],["C","0",".","+"]]
    var toUnit: Double{
        let from = sum / exchange[fromSelect]
        let toUnit = from * exchange[toSelect]
        return toUnit
    }
    
    var history : String {
        return equations.text
    }
    
    var body: some View {
        VStack(spacing:20){
            Text(unitName)
                .font(.title)
                .foregroundColor(Color.blue)
            HStack{
                Text("Input")
                    .font(.headline)
                    .foregroundColor(Color.gray)
                Spacer()
                Text("Outcome")
                    .font(.headline)
                    .foregroundColor(Color.gray)

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
                HStack {
                    Button("\(Image(systemName: "arrow.left.arrow.right"))") {
                        andSelect = fromSelect
                        fromSelect = toSelect
                        toSelect = andSelect
                    }.font(.title)
                }
                Spacer()
                Picker("", selection: $toSelect){
                    ForEach(0..<froms.count){
                        Text(froms[$0])
                            .font(.title)
                    }
                }
                .pickerStyle(MenuPickerStyle())

            }
            HStack{
                Text("\(total)")
                Spacer()
            }.padding()
                   
            Spacer()
            VStack{
                ForEach(inputOrder,id:\.self){row in
                    HStack{
                        ForEach(row,id:\.self){ item in
                            Button{
                                if item == "C"{
                                    sum = 1.0
                                    fromUnit = ""
                                    total = ""
                                    totals = ""
                                    operate = ""
                                    historyCount += 1
                                    
                                    if historyCount == 4 {
                                        total = ""
                                    }
                                }else if item == "." && fromUnit.contains(".") {
                                    historyCount += 1
                                    if historyCount == 4 {
                                        total = ""
                                    }
                                    return
                                }else if item == "*"{
                                    operate = "*"
                                    historyCount += 1
                                    if historyCount == 4 {
                                        total = ""
                                    }
                                    if total.count == 0{
                                        totals = fromUnit
                                        total += "\(fromUnit)\(operate)"
                                        fromUnit = ""
                                    }else{
                                        totals = String(sum)
                                        total += "\(fromUnit)=\(sum)\n\(sum)*"
                                        fromUnit = ""
                                    }
                                    fromUnit = ""
                                }else if item == "/"{
                                    operate = "/"
                                    historyCount += 1
                                    if historyCount == 4 {
                                        total = ""
                                    }
                                    if total.count == 0{
//                                        endResult += fromUnitNumber
                                        totals = fromUnit
                                        total += "\(fromUnit)\(operate)"
                                        fromUnit = ""
                                    }else{
                                        totals = String(sum)
                                        total += "\(fromUnit)=\(sum)\n\(sum)/"
                                        fromUnit = ""
                                    }
                                    fromUnit = ""


                                }else if item == "-"{
                                    operate = "-"
                                    historyCount += 1
                                    if historyCount == 4 {
                                        total = ""
                                    }
                                    if total.count == 0{
                                        totals = fromUnit
                                        total += "\(fromUnit)\(operate)"
                                        fromUnit = ""
                                    }else{
                                        totals = String(sum)
                                        total += "\(fromUnit)=\(sum)\n\(sum)-"
                                        fromUnit = ""
                                    }
                                }else if item == "+"{
                                    operate = "+"
                                    historyCount += 1
                                    if historyCount == 4 {
                                        total = ""
                                    }
                                    if total.count == 0{
                                        totals = fromUnit
                                        total += "\(fromUnit)\(operate)"
                                        fromUnit = ""
                                    }else{
                                        totals = String(sum)
                                        total += "\(fromUnit)=\(sum)\n\(sum)+"
                                        fromUnit = ""
                                    }
                                    fromUnit = ""
                                }else{
                                    fromUnit += item
                                    sum = Double(fromUnit) ?? 0
                                }
                                let sums = Double(fromUnit) ?? 0
                                let summed = Double(totals) ?? 0
                                if sum == 0.000000 && operate == "/"{
                                    sum = 1
                                }
                                if operate == "+"{
                                    sum = sums + summed
                                }else if operate == "*"{
                                    sum = sums * summed
                                }else if operate == "-"{
                                    sum = summed - sums
                                }else if operate == "/"{
                                    sum = summed / sums
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
