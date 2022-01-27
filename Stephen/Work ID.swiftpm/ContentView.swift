import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Image("logo")
                .resizable()
                .padding(/*@START_MENU_TOKEN@*/.horizontal, 10.0/*@END_MENU_TOKEN@*/)
                .frame(width: /*@START_MENU_TOKEN@*/80.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/220.0/*@END_MENU_TOKEN@*/)
                .scaledToFit()
            VStack {
                Text("S&V Information")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Image("avatar")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/170.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/)
                    .scaledToFit()
                HStack{
                    Image(systemName:"person.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Stephen")
                }
                HStack{
                    Image(systemName: "phone.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("35792468")
                }
                HStack{
                    Image(systemName: "envelope.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("stephen@hdsv.com")
                }
                Image("code")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    .scaledToFit()
            }
        }
    }
}
