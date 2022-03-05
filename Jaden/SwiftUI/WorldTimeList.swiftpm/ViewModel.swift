//
//  ViewModel.swift
//  WorldTimeList
//
//  Created by Jaden Cheung on 2/28/22.
//

import Foundation

struct ViewModel{
    let items = [
        City(name: "Montreal", timeDifference: "Today, +0HRS", times: "11:50", check : 0),
        City(name: "London", timeDifference: "Today, +5HRS", times: "4:50", check : 5),
        City(name: "Beijing", timeDifference: "Tommorow, +13HRS", times: "12:50", check : 13),
        City(name: "San Francisco", timeDifference: "Today, -3HRS", times: "8:50", check : -3),
        City(name: "San Francisco", timeDifference: "Today, -3HRS", times: "8:50", check : -3),
        City(name: "San Francisco", timeDifference: "Today, -3HRS", times: "8:50", check : -3),
        City(name: "San Francisco", timeDifference: "Today, -3HRS", times: "8:50", check : -3),
        City(name: "San Francisco", timeDifference: "Today, -3HRS", times: "8:50", check : -3),
        City(name: "San Francisco", timeDifference: "Today, -3HRS", times: "8:50", check : -3),
        City(name: "San Francisco", timeDifference: "Today, -3HRS", times: "8:50", check : -3),
        City(name: "San Francisco", timeDifference: "Today, -3HRS", times: "8:50", check : -3),
        City(name: "San Francisco", timeDifference: "Today, -3HRS", times: "8:50", check : -3)
    ]
}

struct City: Identifiable{
    let id : UUID = UUID()
    var name:String
    var timeDifference:String
    var times:String
    var check : Int
    
}
