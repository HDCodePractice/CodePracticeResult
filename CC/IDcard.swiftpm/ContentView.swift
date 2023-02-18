import SwiftUI

struct ContentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(width: 370, height: 230)
            .foregroundColor(Color.blue)
            //.padding(.top, -100)

        HStack{
            
            Text("squirrel company")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color.white)
                //.multilineTextAlignment(.trailing)
                .padding(.top, -120.0)
                .padding(.trailing, -80.0)
                
            
        }
        ZStack{
//            Circle()
//                .fill(Color.green)
//                .frame(width: 175, height: 175)
//                .padding(.top,-100.0)
            Image("s6")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/160.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/160.0/*@END_MENU_TOKEN@*/)
                .scaledToFit()
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.green, lineWidth: 4)
                }
                .padding(.top, -100.0)
        }
        
        Text("squirrel")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.black)
        Text("master of yard")
            .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
        HStack{
            VStack(alignment: .leading){
                Text("ID No:")
                    .padding(.top, 10.0)
                Text("Blood:")
                    .padding(.top, 5.0)
                Text("Email:")
                    .padding(.top, 5.0)
                Text("Phone:")
                    .padding(.top, 5.0)
            }
            VStack(alignment: .leading){
                Text("98754321")
                    .padding(.top, 10.0)
                Text("011-2333")
                    .padding(.top, 5.0)
                Text("dd@gmail.com")
                    .padding(.top, 5.0)
                Text("000-000-0000")
                    .padding(.top, 5.0)
            }
        }
        Image("txm")
            .resizable()
 
            .frame(width: 220, height: 120, alignment: .center)

                
    }

}

