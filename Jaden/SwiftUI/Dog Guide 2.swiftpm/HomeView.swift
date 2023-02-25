import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            Button() {
                
            } label: {
                ZStack {
                    Color(red: 0, green: 0.8, blue: 0.6)
                    Text("Take Quiz")
                        .font(.system(size: 40, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                }
                .frame(width: 300, height: 100)
                .cornerRadius(20)
                
            }
            Button() {
                
            } label: {
                ZStack {
                    Color(red: 0, green: 0.8, blue: 0.6)
                    Text("Dog Guide")
                        .font(.system(size: 40, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                }
                .frame(width: 300, height: 100)
                .cornerRadius(20)
                
            } 
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

