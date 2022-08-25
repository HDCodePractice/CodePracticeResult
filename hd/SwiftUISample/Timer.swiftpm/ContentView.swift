import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink{
                    TimerView()
                }label: {
                    Text("计时")
                }
                NavigationLink{
                    StopWatchView()
                }label: {
                    Text("倒计时")
                }
            }
        }
    }
}
