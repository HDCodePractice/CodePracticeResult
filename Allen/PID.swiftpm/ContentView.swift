import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Allen Yang")
                .font(.headline)
                .fontWeight(.black)
                .foregroundColor(Color.gray)
            Image("allen")
                .resizable()
                .scaledToFit()
            HStack{
                Image("Add")
                Text("Address")
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    
                Text("1600 Pennsylvania Avenue NW, Washington, DC 20500")
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .padding(.leading, 50.0)
            }
            HStack{
                Image("email")
                    VStack{
                        Text("Email")
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            
                        Text("Address")
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            
                    }
                Text("xxxxx@xxxx.xxx")
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
            }
            HStack{
                Image("phone")
                VStack{
                    Text("Phone")
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        
                    Text("Number")
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        
                }
                Text("+86 10086")
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
            }
                Image("QR Code")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
            Text("欢迎勾搭～")
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
        }
    }
}
