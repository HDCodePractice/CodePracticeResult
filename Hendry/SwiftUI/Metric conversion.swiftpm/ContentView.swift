import SwiftUI

func forTrailingZero(temp: Double) -> String {
    let tempVar = String(format: "%g", temp)
    return tempVar
}



public struct MetricConversionUnitView: View {
        let expanded: [String]
        let froms: [String]
        let exchange: [Double]
        let unitName: String
        @State var fromSelect = 0
        @State var toSelect = 0
        @State var andSelect = 0
        @State var fromUnit = ""
        @State var andUnit = "1"
        @State var history = ""
        @State var endResult = 0.0
        @State var operators = ""
        var fromUnitNumber : Double{
            return Double(fromUnit) ?? 0
        }
        
        func calculation(op : String){
            if op == "+" {
                endResult += fromUnitNumber
            }else if op == "-"{
                endResult -= fromUnitNumber
            }else if op == "×"{
                endResult *= fromUnitNumber
            }else if op == "÷"{
                endResult /= fromUnitNumber
            }
        }
        
        let inputOrder = [["1","2","3","+"],["4","5","6","-"],["7","8","9","×"],["C","0",".","÷"]]
        
    public var body: some View {
            VStack(spacing:20){
                Text(unitName)
                    .font(.title)
                HStack{
                    Text("History")
                    Spacer()
                    Text(history)
                }
                .padding()
                HStack{
                    Text("Input")
                    Spacer()
                    Text(fromUnit)
                }
                .padding()
                Spacer()
                VStack{
                    ForEach(inputOrder,id:\.self){ row in
                        HStack{
                            ForEach(row,id:\.self){ item in
                                Button{
                                    if item == "C" {
                                        fromUnit = "0"
                                        history = ""
                                        endResult = 0.0
                                    }else if item == "+"{
                                        if history.count == 0{
                                            endResult += fromUnitNumber
                                            history += "\(fromUnit)+"
                                        }else{
                                            calculation(op: operators)
                                            history += "\(fromUnit)=\(endResult)\n\(endResult)+"
                                        }
                                        operators = item
                                        fromUnit = ""
                                    }else if item == "-"{
                                        endResult -= fromUnitNumber
                                        if history.count == 0{
                                            endResult += fromUnitNumber
                                            history += "\(fromUnit)-"
                                        }else{
                                            calculation(op: operators)
                                            history += "\(fromUnit)=\(endResult)\n\(endResult)-"
                                        }
                                        operators = item
                                        fromUnit = ""
                                    }else if item == "×"{
                                        endResult = endResult * fromUnitNumber
                                        if history.count == 0{
                                            endResult += fromUnitNumber
                                            history += "\(fromUnit)×"
                                        }else{
                                            calculation(op: operators)
                                            history += "\(fromUnit)=\(endResult)\n\(endResult)×"
                                        }
                                        operators = item
                                        fromUnit = ""
                                    }else if item == "÷"{
                                        endResult /= fromUnitNumber
                                        if history.count == 0{
                                            endResult += fromUnitNumber
                                            history += "\(fromUnit)÷"
                                        }else{
                                            calculation(op: operators)
                                            history += "\(fromUnit)=\(endResult)\n\(endResult)÷"
                                        }
                                        operators = item
                                        fromUnit = ""
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
        
        public var body: some View {
                VStack {
                    HStack {
                        Text("Current Unit")
                            .font(.body)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Final Unit")
                            .font(.body)
                            .foregroundColor(.gray)
                    }.padding()
                    HStack {
                        Picker("", selection: $fromSelect) {
                            ForEach(0..<froms.count) {
                                Text(expanded[$0])
                            }
                        }.font(.title)
                        Spacer()
                        Picker("", selection: $toSelect) {
                            ForEach(0..<froms.count) {
                                Text(expanded[$0])
                            }
                        }.font(.title)
                    }.padding()
                    HStack {
                        Button("\(Image(systemName: "arrow.left.arrow.right.circle.fill"))") {
                            andSelect = fromSelect
                            fromSelect = toSelect
                            toSelect = andSelect
                        }.font(.title)
                    }
                    HStack {
                        if fromUnit.contains("."){
                            Text("\(fromUnit)")
                                .font(.largeTitle)
                                .foregroundColor(.red)

                        } else {
                            Text("\(String(forTrailingZero(temp: Double(fromUnit) ?? 0.0)))")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                        }
                        Spacer()
                        Text("\(toUnit)")
                            .font(.largeTitle)
                    }.padding()
                    HStack {
                        Text("(\(froms[fromSelect]))")
                            .font(.body)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("(\(froms[toSelect]))")
                            .font(.body)
                            .foregroundColor(.gray)
                    }.padding()
                    Spacer()
                }
        }
    }
        }
    

    struct ConversionView_Previews: PreviewProvider {
        static var previews: some View {
            MetricConversionUnitView(
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

