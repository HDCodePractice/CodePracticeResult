import SwiftUI

struct ContentView: View {
    @State var numbers = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    @State var suits = ["♠️","♣️","♥️","♦️"]
    var body: some View {
        VStack {
            Button("Random"){
                Card(number:numbers.randomElement(), suit:suits.randomElement())
            }
        }
    }
}
