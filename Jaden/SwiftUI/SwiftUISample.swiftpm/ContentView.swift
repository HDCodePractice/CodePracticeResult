import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink("TextSampleView"){
                    TextSampleView()
                }
                NavigationLink("TextDateStyleSample"){
                    TextDateStyleSample()
                }
                NavigationLink("TextFontSample"){
                    TextDateStyleSample()
                }
                NavigationLink("VStackSample"){
                    VStackSampleView()
                }
            }
        }
    }
}
