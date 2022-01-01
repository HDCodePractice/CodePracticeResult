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
    @State var fromUnit = "1"
    @State var andUnit = "1"
    let inputOrder = [["1","2","3"],["4","5","6"],["7","8","9"],["C","0","."]]
    var toUnit: String {
        let from = (Double(fromUnit) ?? 1.0) / (exchange[fromSelect])
        let Unit1 = from * exchange[toSelect]
        let Unit2 = forTrailingZero(temp: Unit1)
        return Unit2
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
                VStack(spacing: -29) {
                    ForEach(inputOrder, id: \.self) { column in
                        HStack (spacing: 3){
                            ForEach(column, id: \.self) { row in
                                Button() {
                                    if row == "C" {
                                        fromUnit = "0"
                                    } else {
                                        if row == "." && fromUnit.contains(".") {
                                            return
                                        }
                                        var SDConverter = ""
                                        if fromUnit.contains("."){
                                            SDConverter = fromUnit
                                        } else {
                                            SDConverter = String(forTrailingZero(temp: Double(fromUnit) ?? 0.0))
                                        }
                                        SDConverter.append(row)
                                        fromUnit = SDConverter
                                    }
                                } label: {
                                    ZStack{
                                        Color.blue
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
}
