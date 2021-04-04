import Foundation

import SwiftUI

import PlaygroundSupport

struct ContentView: View {
    var name: String = " Siri"
    var body: some View {
    
        VStack{
            Text("Hello,\(self.name)")
                .font(.system(.largeTitle))
                .foregroundColor(.green)
            Text("You have a stupid head")
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
