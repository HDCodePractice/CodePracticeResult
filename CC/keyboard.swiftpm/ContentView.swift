import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          Button() {
              print("do something!")
          } label: {
              VStack(alignment: .center, spacing: 1.0){
                  Text("1")
                      .font(.system(size:12))
                  Text(" Q ")
              }
 
          }
        }.buttonStyle(MyButtonStyle(color:.cyan))
    }
}

struct MyButtonStyle: ButtonStyle {
    var color: Color = .green
    
    public func makeBody(configuration: MyButtonStyle.Configuration) -> some View {
        MyButton(configuration: configuration, color: color)
    }
    
    struct MyButton: View {
        let configuration: MyButtonStyle.Configuration
        let color: Color
        
        var body: some View {
            
            return configuration.label
                .foregroundColor(.white)
                .padding(15)
                .background(RoundedRectangle(cornerRadius: 5).fill(color).frame(width: 50, height: 50))
                .compositingGroup()
                .shadow(color: .black, radius: 3)
                .opacity(configuration.isPressed ? 0.5 : 1.0)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
