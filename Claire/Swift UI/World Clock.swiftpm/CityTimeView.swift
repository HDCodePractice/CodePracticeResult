//
//  CityTimeView.swift
//  World Clock
//
//  Created by Qianji Yao on 2022/3/2.
//

import SwiftUI

struct City: Identifiable{
    let id : UUID = UUID()
    var name:String
    var timeDifference:String
    var time:String
}

struct ViewModel{
    let items = [
        City(name: "Montreal", timeDifference: "Today,+0HRS", time: "11:50AM"),
        City(name: "London", timeDifference: "Today,+5HRS", time: "4:50PM")
    ]
}

struct CityTimeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CityTimeView_Previews: PreviewProvider {
    static var previews: some View {
        CityTimeView()
    }
}
