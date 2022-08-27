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
                    TextFontSample()
                }
                NavigationLink("VStackSample"){
                    VStackSampleView()
                }
            }
        }
    }
}
