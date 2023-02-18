//
//  File.swift
//  Metric Conversion
//
//  Created by 老房东 on 2022-01-01.
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
        Form{
            MetricConversionUnitView(
                froms: froms[0],
                exchange: exchanges[0],
                unitName: unitNames[0]
            )
            
            MetricConversionUnitView(
                froms: froms[1],
                exchange: exchanges[1],
                unitName: unitNames[1]
            )
            
            MetricConversionUnitView(
                froms: froms[2],
                exchange: exchanges[2],
                unitName: unitNames[2]
            )
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
    var toUnit: Double{
        let from = fromUnit / exchange[fromSelect]
        let toUnit = from * exchange[toSelect]
        return toUnit
    }
    
    var body: some View {
        Section{
            HStack{
                Text("From")
                Picker("", selection: $fromSelect){
                    ForEach(0..<froms.count){
                        Text(froms[$0])
                    }
                }
                .pickerStyle(.segmented)
            }
            HStack{
                Text("How")
                TextField("Input from unit", value: $fromUnit, format: .number)
            }
            HStack{
                Text("To")
                Picker("", selection: $toSelect){
                    ForEach(0..<froms.count){
                        Text(froms[$0])
                    }
                }
                .pickerStyle(.segmented)
            }
            HStack{
                Text("Is \(toUnit)")
            }
        }header: {
            Text(unitName)
        }
    }
}
