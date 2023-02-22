import SwiftUI

struct Dog: View {
    var body: some View {
        VStack{
            Button() {
                
            } label: {
                ZStack {
                    Color(red: 0, green: 0.8, blue: 0.6)
                    Text("Australian Shepherd")
                        .font(.system(size: 40, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                }
                .frame(width: 400, height: 200)
                .cornerRadius(20)
                
            }
            Button() {
                
            } label: {
                ZStack {
                    Color(red: 0, green: 0.8, blue: 0.6)
                    Text("Golden Retreiver")
                        .font(.system(size: 40, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                }
                .frame(width: 400, height: 200)
                .cornerRadius(20)
                
            }
            Button() {
                
            } label: {
                ZStack {
                    Color(red: 0, green: 0.8, blue: 0.6)
                    Text("German Shepherd")
                        .font(.system(size: 40, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                }
                .frame(width: 400, height: 200)
                .cornerRadius(20)
                
            }
            Button() {
                
            } label: {
                ZStack {
                    Color(red: 0, green: 0.8, blue: 0.6)
                    Text("Labradoodle")
                        .font(.system(size: 40, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                }
                .frame(width: 400, height: 200)
                .cornerRadius(20)
                
            }
        }
        
    }
}

struct Dog_Previews: PreviewProvider {
    static var previews: some View {
        Dog()
    }
}
