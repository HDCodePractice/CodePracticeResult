import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView{
                List{
                    NavigationLink("TextSample"){
                        TextSampleView()
                    }
                    NavigationLink("VStackSample"){
                        VStackSampleView()
                    }
                    NavigationLink("TextDateStyleSample"){
                        TextDateStyleSample()
                    }
                    NavigationLink("TextFontSample"){
                        TextFontSample()
                    }
                    NavigationLink("TextSizeSample"){
                        TextSizeSample()
                    }
                    NavigationLink("ZStackSample"){
                        ZStackSampleView()
                    }
                    NavigationLink("DiceSample"){
                        DiceSample()
                    }
                }
            }
        }
    }
}
