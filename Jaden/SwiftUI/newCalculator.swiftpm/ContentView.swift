import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            VStack {
                    Spacer()
                    ButtonView(title: "AC", background: .red, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "7", background: .blue, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "4", background: .blue, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "1", background: .blue, size: CGSize(width: 100, height: 100))
                Spacer()
                
            }
            VStack {
                    ButtonView(title: "+/-", background: .red, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "8", background: .blue, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "5", background: .blue, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "2", background: .blue, size: CGSize(width: 100, height: 100))
                ButtonView(title: "0", background: .blue, size: CGSize(width: 150, height: 100))
                
            }
            VStack {
                    ButtonView(title: "%", background: .red, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "9", background: .blue, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "6", background: .blue, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "3", background: .blue, size: CGSize(width: 100, height: 100))
                ButtonView(title: ".", background: .blue, size: CGSize(width: 100, height: 100))
                
            }
            VStack {
  
                    ButtonView(title: "÷", background: .yellow, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "x", background: .yellow, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "-", background: .yellow, size: CGSize(width: 100, height: 100))
                    ButtonView(title: "+", background: .yellow, size: CGSize(width: 100, height: 100))
                ButtonView(title: "=", background: .yellow, size: CGSize(width: 100, height: 100))
                
            }
        }
        
    }
}
