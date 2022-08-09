import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.red, lineWidth: 10)
            }
            Rectangle().stroke(.green, lineWidth: 10)
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.green, lineWidth: 10)
            }
        }
        HStack {
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.green, lineWidth: 10)
            }
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.red, lineWidth: 10)
            }
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.red, lineWidth: 10)
            }
        }
        HStack {
            Rectangle().stroke(.green, lineWidth: 10)
            Rectangle().stroke(.green, lineWidth: 10)
            
            ZStack{
                Rectangle().stroke(.green, lineWidth: 10)
                Circle().stroke(.green, lineWidth: 20)
            }
            
            
        }
    }
}
