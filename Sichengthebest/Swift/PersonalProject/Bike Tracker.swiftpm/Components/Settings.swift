//
//  Settings.swift
//  Biking Tracker
//
//  Created by Sicheng Jiang on 2023-02-25.
//

import SwiftUI

struct Settings: View {
    @AppStorage("sex") var sex = ""
    @AppStorage("weight") var weight = 0
    @AppStorage("age") var age = 0
    @State var pound = "kg"
    let sexes = ["Male", "Female"]
    let pounds = ["kg", "pound"]
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Sex assigned at birth")
                Picker("Sex", selection: $sex) {
                    ForEach(sexes, id: \.self) {
                        Text($0)
                    }
                }
            }
            HStack {
                if pound == "pound" {
                    Text("Weight")
                    Picker("Weight", selection: $weight) {
                        ForEach(25 ..< 201) { i in
                            Text(String(Int(Double(i)*2.2)))
                        }
                    }
                } else if pound == "kg" {
                    Text("Weight")
                    Picker("Weight", selection: $weight) {
                        ForEach(25 ..< 201) { i in
                            Text(String(i))
                        }
                    }
                }
                Picker("Pound", selection: $pound) {
                    ForEach(pounds, id: \.self) {
                        Text($0)
                    }
                }
            }
            HStack {
                Text("Age")
                Picker("Age", selection: $age) {
                    ForEach(10 ..< 101) { i in
                        Text(String(i))
                    }
                }
            }
        } .padding()
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

public func calcCals(sex: String, weight: Int, age: Int, time: Int, speed: Double) -> Int {
    let three = Double(time)/60
    let four = speed/2.5-1.5
    if sex == "Male" {
        let five = 1+(0.01*Double(age-35))
        if !four.isNaN {
            return Int(four*Double(weight)*three*five/10)
        } else {
            return Int(7*Double(weight)*three*five/10)
        }
    } else if sex == "Female" {
        let six = 0.91+(0.01*Double(age-35))
        if !four.isNaN {
            return Int(four*Double(weight)*three*six/10)
        } else {
            return Int(7*Double(weight)*three*six/10)
        }
    } else {
        return 1
    }
}
