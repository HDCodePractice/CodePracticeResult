import SwiftUI



struct ContentView: View {
    @State var board : [[String]] = [["X","_", "O"],
                              ["O","X","X"],
                              ["_","_","O"]]
    var body: some View {
        HStack {
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.red, lineWidth: 10).padding()
            }
            Rectangle().stroke(.green, lineWidth: 10)
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.green, lineWidth: 10).padding()
            }
        }
        HStack {
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.green, lineWidth: 10).padding()
            }
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.red, lineWidth: 10).padding()
            }
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.red, lineWidth: 10).padding()
            }
        }
        HStack {
            Rectangle().stroke(.green, lineWidth: 10)
            Rectangle().stroke(.green, lineWidth: 10)
            
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.green, lineWidth: 10).padding()
            }
            
            
        }
    }
}
