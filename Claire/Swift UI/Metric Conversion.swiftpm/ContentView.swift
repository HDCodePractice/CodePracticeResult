import SwiftUI

struct ContentView: View {
    
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
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [.purple,.blue], startPoint: .top, endPoint: .bottom)
                
                VStack(spacing:20){
                    NavigationLink(){
                        ConversionView(
                            expanded: fromsExpanded[0],
                            froms: froms[0],
                            exchange: exchanges[0],
                            unitName: unitNames[0]
                        )
                    }label: {
                        ZStack{
                            Text(unitNames[0])
                                .font(.title)
                                .padding()
                        }
                        .frame(width:300)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    
                    NavigationLink(){
                        ConversionView(
                            expanded: fromsExpanded[1],
                            froms: froms[1],
                            exchange: exchanges[1],
                            unitName: unitNames[1]
                        )
                    }label: {
                        ZStack{
                            Text(unitNames[1])
                                .font(.title)
                                .padding()
                        }
                        .frame(width:300)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    
                    NavigationLink(){
                        ConversionView(
                            expanded: fromsExpanded[2],
                            froms: froms[2],
                            exchange: exchanges[2],
                            unitName: unitNames[2]
                        )
                    }label: {
                        ZStack{
                            Text(unitNames[2])
                                .font(.title)
                                .padding()
                        }
                        .frame(width:300)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(10)
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
    
    let weight1 = ["g","kg","ounce","lb"]
    let length1 = ["km","dcm","m","dm","cm","mm","mile","yard","foot","inch"]
    let area1 = ["km²","m²","mi²","ac"]
    
    @State var choice1 = "g"
    @State var choice2 = "kg"
    @State var choice3 = "km"
    @State var choice4 = "m"
    @State var choice5 = "km²"
    @State var choice6 = "m²"
    
    @State var fromSelect = 0
    @State var toSelect = 0
    @State var andSelect = 0
    @State var fromUnit = "0"
    @State var toUnit = "0"
    let inputOrder = [["1","2","3","+"],["4","5","6","-"],["7","8","9","×"],["C","0",".","÷"]]
    
    var findUnit: Double{
        let dfrom = (fromUnit as NSString).doubleValue
        let from = dfrom / exchange
        let tosUnit = from * exchange
        return tosUnit
    }
    
    var body: some View {
        VStack(spacing:20){
            Text(unitName)
                .font(.title)
            HStack{
                Text("   Your Input")
                    .foregroundColor(Color.gray)
                Spacer()
                Text("Return Value    ")
                    .foregroundColor(Color.gray)
            }
            if unitName == "Mass"{
                HStack{
                    Picker("before", selection: $choice1){
                        ForEach(weight1, id:\.self) { m1 in
                            Text(m1)
                        }.pickerStyle(.wheel)
                    }
                    Spacer()
                    HStack{
                        Picker("after", selection: $choice2){
                            ForEach(weight1, id:\.self) { m2 in
                                Text(m2)
                            }.pickerStyle(.wheel)
                        }
                    }
                }
            } else if unitName == "Length" {
                HStack{
                    Picker("before", selection: $choice3){
                        ForEach(length1, id:\.self) { l1 in
                            Text(l1)
                        }.pickerStyle(.wheel)
                    }
                    Spacer()
                    Picker("after", selection: $choice4){
                        ForEach(length1, id:\.self) { l2 in
                            Text(l2)
                        }.pickerStyle(.wheel)
                    }
                }
            } else if unitName == "Area" {
                HStack{
                    Picker("before", selection: $choice5){
                        ForEach(area1, id:\.self) { a1 in
                            Text(a1)
                        }.pickerStyle(.wheel)
                    }
                    Spacer()
                    Picker("after", selection: $choice6){
                        ForEach(area1, id:\.self) { a2 in
                            Text(a2)
                        }.pickerStyle(.wheel)
                    }
                }
            }
            HStack{
                Spacer()
                Image(systemName: "repeat")
                    .resizable()
                    .foregroundColor(Color("AccentColor"))
                    .frame(width: 25.0, height: 25.0)
                Spacer()
            }
            
            HStack{
                Text("  \(fromUnit)")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                Spacer()
                Text("\(findUnit)  ")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
            }
            Spacer()
            VStack{
                ForEach(inputOrder,id:\.self){ row in
                    HStack{
                        ForEach(row,id:\.self){ item in
                            Button{
                                if item == "C" {
                                    fromUnit = "0"
                                } else if item == "0" && fromUnit.contains("0"){
                                    return
                                } else if item != "0" && fromUnit.contains("0"){
                                    fromUnit = item
                                } else if item == "." && fromUnit.contains("."){
                                    return
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
            .padding()
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
        .frame(width:.infinity)
        .cornerRadius(5)
        .shadow(radius: 5)
    }
}
