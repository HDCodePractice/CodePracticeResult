import SwiftUI
struct ContentView: View {
    var body: some View {
        VStack(spacing:0) {
            ForEach(0..<8,id:\.self){ a in
                HStack(spacing:0) {
                    ForEach(0..<8,id:\.self){ b in
                        ZStack{
                            Rectangle()
                                .fill((a+b)%2==1 ? .black : .white)
                            if (a+b)%2==1 && a<3{
                                Circle()
                                    .fill(.gray)
                                    .padding()
                            }else if (a+b)%2==1 && a>4{
                                Circle()
                                    .fill(.white)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}
