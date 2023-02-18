import SwiftUI

 struct ContentView: View {
     @State var vm = ViewModel()
     var body: some View {
         ZStack{
             Color.black
             VStack{
                 HStack{
                     Text("World Clock")
                         .font(.largeTitle)
                     Spacer()
                 }
                 ForEach ($vm.items){item in
                     HStack{
                         VStack{
                             Text(item.timeDifference).font(.footnote)
                             Text(item.name)
                                 .font(.title)
                         }
                         Spacer()
                         VStack{
                             Spacer()
                             Text(item.time)
                                 .font(.title)
                         }
                     }
                     Divider()
                 }
             }
         }
     }
 }

 struct ViewModel{
   func Items = [
         City(name: "Montreal", timeDifference: "Today,+0HRS", time: "11:50AM"),
         City(name: "London", timeDifference: "Today,+5HRS", time: "4:50PM"),
         City(name: "Beijing", timeDifference: "Today,+13HRS", time: "12:50AM"),
         City(name: "San Francisco", timeDifference: "Today,-3HRS", time: "8:50AM"),
         City(name: "Vancouver", timeDifference: "Today,+3HRS", time: "12:50AM"),
         City(name: "Toronto", timeDifference: "Today,+0HRS", time: "12:50AM"),
     ]
 }

 struct City: Identifiable{
     let id : UUID = UUID()
     var name:String
     var timeDifference:String
     var time:String
 }
