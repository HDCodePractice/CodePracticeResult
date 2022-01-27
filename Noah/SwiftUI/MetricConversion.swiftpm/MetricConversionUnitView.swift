import SwiftUI

func forTrailingZero(temp: Double) -> String {
    let tempVar = String(format: "%g", temp)
    return tempVar
}

func solveForEquation(fromUnit: String) -> String {
    var EndsWithNumber = true
    if fromUnit.suffix(1) == " " {
        EndsWithNumber = false
    }
    var tempVar = fromUnit
    if (EndsWithNumber == false) {
        tempVar.removeLast()
        tempVar.removeLast()
    }
    let each = tempVar.split(separator: " ")
    var ret = ""
    
    for i in each {
        ret += i
    }
    
    ret = ret
        .replacingOccurrences(of: ". ", with: " ")
        .replacingOccurrences(of: "×", with: "*")
        .replacingOccurrences(of: "÷", with: "/")
    
    let expression = NSExpression(format:ret)
    var value : Double? = expression.expressionValue(with: nil, context: nil) as? Double
    value = Double(round(1000 * value!) / 1000)
    return "\(value!)"
}

public struct MetricConversionUnitView: View {
    let expanded: [String]
    let froms: [String]
    let exchange: [Double]
    let unitName: String
    @State var fromSelect = 0
    @State var toSelect = 0
    @State var andSelect = 0
    @State var fromUnit = "1"
    @State var equation = ""
    @State var lastAction = ""
    let inputOrder = [["1","2","3","÷"],["4","5","6","×"],["7","8","9","-"],["C","0",".","+"]]
    var toUnit: String {
        let answer = solveForEquation(fromUnit: equation)
        let from = (Double(answer) ?? 1.0) / (exchange[fromSelect])
        let to = from * exchange[toSelect]
        let final = forTrailingZero(temp: to)
        return final
    }
    
    public var body: some View {
            VStack {
                VStack(spacing: -20) {
                    Heading
                    Pickers
                }
                ExchangeButton
                Calculation
                Unit
                ShortenedUnits
                Spacer()
                Buttons
            }
            
    }
    
    var Heading: some View {
        HStack {
            Text("Current Unit")
                .font(.body)
                .foregroundColor(.gray)
            Spacer()
            Text("Final Unit")
                .font(.body)
                .foregroundColor(.gray)
        }.padding()
    }
    
    var Pickers: some View {
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
    }
    
    var ExchangeButton: some View {
        HStack {
            Button("\(Image(systemName: "arrow.left.arrow.right.circle.fill"))") {
                andSelect = fromSelect
                fromSelect = toSelect
                toSelect = andSelect
            }.font(.title)
        }
    }
    
    var Calculation: some View {
        HStack {
            Text(equation)
                .foregroundColor(.gray)
                .font(.body)
            Spacer()
        }.padding()
    }
    
    var Unit: some View {
        HStack {
            if equation.contains("."){
                Text("\(equation)")
                    .font(.largeTitle)
                    .foregroundColor(.red)

            } else {
                let answer = solveForEquation(fromUnit: equation)
                Text("\(String(forTrailingZero(temp: Double(answer) ?? 0.0)))")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
            Spacer()
            Text("\(toUnit)")
                .font(.largeTitle)
        }.padding()
    }
    
    var ShortenedUnits: some View {
        HStack {
            Text("(\(froms[fromSelect]))")
                .font(.body)
                .foregroundColor(.gray)
            Spacer()
            Text("(\(froms[toSelect]))")
                .font(.body)
                .foregroundColor(.gray)
        }.padding()
    }
    
    var Buttons: some View {
        VStack(spacing: -29) {
            ForEach(inputOrder, id: \.self) { column in
                HStack (spacing: 3){
                    ForEach(column, id: \.self) { row in
                        Button() {
                            if row == "C" {
                                fromUnit = "0"
                                equation = "0"
                            } else if ["+","-","×","÷"].contains(row) {
                                if equation.last == " " {
                                    return
                                }
                                equation.append(" \(row) ")
                            } else {
                                if row == "." && fromUnit.contains(".") {
                                    return
                                }
                                var SDConverter = ""
                                if fromUnit.contains("."){
                                    SDConverter = fromUnit
                                }
                                else {
                                    SDConverter = String(forTrailingZero(temp: Double(fromUnit) ?? 0.0))
                                }
                                SDConverter.append(row)
                                fromUnit = SDConverter
                                if equation.first != "0" {
                                    equation.append(row)
                                } else {
                                    equation = row
                                }
                                
                            }
                        } label: {
                            ZStack{
                                if ["C","+","-","×","÷"].contains(row) {
                                    Color.init(red: 0.0, green: 0.0, blue: 250.0)
                                } else {
                                    Color.blue
                                }
                                Text("\(row)")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .frame(width: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .shadow(radius: 5)
                        }
                    }
                }.padding()
            }
        }
    }
}
