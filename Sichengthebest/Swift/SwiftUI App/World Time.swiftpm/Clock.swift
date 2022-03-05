//
//  File.swift
//  World Time
//
//  Created by Sicheng Jiang on 2022-03-02.
//

import SwiftUI

struct City: Identifiable{
    let id : UUID = UUID()
    var name:String
    var timeDifference:String
    var time:String
    var ampm:String
}

struct ClockView: View {
    var title:String
    var timeDifference:String
    var time:String
    var ampm:String
    var body: some View {
        HStack {
            VStack {
                Text(timeDifference)
                    .font(.system(size:15))
                    .foregroundColor(.gray)
                Text(title)
                    .font(.system(size:25))
            }
            Spacer()
            HStack(alignment: .lastTextBaseline, spacing: 0) {
                Text(time)
                    .font(.system(size:35))
                Text(ampm)
                    .font(.system(size:20))
            }
        }
    }
}



//struct Clock_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack(spacing:5){
//            HStack(spacing:2){
//                ForEach(ViewModel().items, id: \.self){
//                    city in
//                    ClockView(title: "0", background: .gray, size:50.0,size2:50.0)
//                }
//            }
//        }
//    }
//}

struct ViewModel{
    let items = [
        City(name: "Montreal", timeDifference: "Today, +0HRS", time: "11:50",ampm:"AM"),
        City(name: "London", timeDifference: "Today, +5HRS", time: "4:50",ampm:"PM"),
        City(name: "Montreal", timeDifference: "Today, +0HRS", time: "11:50",ampm:"AM"),
        City(name: "Montreal", timeDifference: "Today, +0HRS", time: "11:50",ampm:"AM"),
        City(name: "Montreal", timeDifference: "Today, +0HRS", time: "11:50",ampm:"AM"),
        City(name: "Montreal", timeDifference: "Today, +0HRS", time: "11:50",ampm:"AM"),
        City(name: "Montreal", timeDifference: "Today, +0HRS", time: "11:50",ampm:"AM"),
        
        City(name: "Montreal", timeDifference: "Today, +0HRS", time: "11:50",ampm:"AM"),
        
        City(name: "Montreal", timeDifference: "Today, +0HRS", time: "11:50",ampm:"AM"),

        City(name: "London", timeDifference: "Today, +5HRS", time: "4:50",ampm:"PM")
        
    ]
}
