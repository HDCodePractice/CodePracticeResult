//
//  File.swift
//  Metric Conversion
//
//  Created by Jaden Cheung on 1/1/22.
//

import SwiftUI

struct OneView: View {
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
                        .pickerStyle(MenuPickerStyle())
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Picker("", selection: $toSelect){
                            ForEach(0..<froms.count){
                                Text(froms[$0])
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                    }
                    HStack{
                        Text("\(total)")
                        Spacer()
                        Text("\(toUnit)")
                    }
                }header: {
                    Text(unitName)
                }
                Section{
                    
                    Button("1"){
                        z = pow(10, x)
                        total = total*10+1
                      fromUnit = Double(total)
                        x += 1
                        
                    }
                    Button("2"){
                        z = pow(10, x)
                        total = total*10+2
                      fromUnit = Double(total)
                        x += 1
                        
                    }
                    Button("3"){
                        z = pow(10, x)
                        total = total*10+3
                      fromUnit = Double(total)
                        x += 1
                        
                    }
                    Button("4"){
                        z = pow(10, x)
                        total = total*10+4
                      fromUnit = Double(total)
                        x += 1
                        
                    }
                    Button("5"){
                        z = pow(10, x)
                        total = total*10+5
                      fromUnit = Double(total)
                        x += 1
                        
                    }
                    Button("6"){
                        z = pow(10, x)
                        total = total*10+6
                      fromUnit = Double(total)
                        x += 1
                        
                    }
                    Button("7"){
                        z = pow(10, x)
                        total = total*10+7
                      fromUnit = Double(total)
                        x += 1
                        
                    }
                    Button("8"){
                        z = pow(10, x)
                        total = total*10+8
                        fromUnit = Double(total)
                        x += 1
                        
                    }
                    Button("9"){
                        z = pow(10, x)
                        total = total*10+9
                      fromUnit = Double(total)
                        x += 1
                        
                    }
                    Button("0"){
                        z = pow(10, x)
                        total += total*10-total
                      fromUnit = Double(total)
                        
                    }
                }header: {
                    Text("Buttons")
                }
                Section{
                   
                    Button("C"){
                        z = pow(10, x)
                        total = 0
                      fromUnit = Double(total)
                        x = 0
                    }

                }header: {
                    Text("Buttons Cont")
                }
            }

        }
    }
        
}
