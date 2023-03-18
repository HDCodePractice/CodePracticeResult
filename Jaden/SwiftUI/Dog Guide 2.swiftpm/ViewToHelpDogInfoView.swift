import SwiftUI

struct HelpWithDogView: View {
    @State var a = 0
    @State var width = 400.0
    @State var height = 200.0
    var choice : [String]
    var body: some View {
        Button() {
            if a == 4{
                a = 0
            }else{
                a += 1
            }
            
            if a > 0{
                width = 1200
                height = 800
            }else{
                width = 400
                height = 200
            }
            
            print(a)
        } label: {
            ZStack {
                Color(red: 0, green: 0.8, blue: 0.6)
                Text(choice[a])
                    .font(.system(size: 40, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
            }
            .frame(width: width, height: height)
            .cornerRadius(20)
        }
    }
}

struct HelpWithDogView_Previews: PreviewProvider {
    static var previews: some View {
        HelpWithDogView(choice: ["Stuff"])
    }
}
