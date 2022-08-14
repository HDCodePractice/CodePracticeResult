

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    Rectangle()
                        .stroke(.mint)
                        .border(Color.mint,width:15)
                    Circle()
                        .stroke(.mint)
                        .frame(width: 150, height: 150)
                }
                Rectangle()
                    .stroke(.mint)
                    .border(Color.mint,width:15)
                ZStack{
                    Rectangle()
                        .stroke(.mint)
                        .border(Color.mint,width:15)
                    Circle()
                        .fill(.black)
                        .frame(width: 150, height: 150)
                }
            }
            HStack{
                ZStack{
                    Rectangle()
                        .stroke(.mint)
                        .border(Color.mint,width:15)
                    Circle()
                        .fill(.black)
                        .frame(width: 150, height: 150)
                }
                ZStack{
                    Rectangle()
                        .stroke(.mint)
                        .border(Color.mint,width:15)
                    Circle()
                        .stroke(.mint)
                        .frame(width: 150, height: 150)
                }
                ZStack{
                    Rectangle()
                        .stroke(.mint)
                        .border(Color.mint,width:15)
                    Circle()
                        .stroke(.mint)
                        .frame(width: 150, height: 150)
                }
            }
            HStack{
                Rectangle()
                .stroke(.mint)
                .border(Color.mint,width:15)
                Rectangle()
                    .stroke(.mint)
                    .border(Color.mint,width:15)
                ZStack{
                    Rectangle()
                        .stroke(.mint)
                        .border(Color.mint,width:15)
                    Circle()
                        .fill(.black)
                        .frame(width: 150, height: 150)
                }
            }
        }
        .padding()
    }
}
