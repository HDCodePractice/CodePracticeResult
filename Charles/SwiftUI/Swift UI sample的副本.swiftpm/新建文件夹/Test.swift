import SwiftUI
struct asdf: View {
    var body: some View {
        VStack{
            ZStack(alignment: .center){
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 200, height: 200)
                Circle()
                    .fill(.white)
                    .frame(width: 50, height: 50)
                    .padding()
            }
            ZStack{
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.red)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                        .padding()
                }
                ZStack(alignment: .bottomTrailing){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                        .padding()
                }
            }
            ZStack{
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.red)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                        .padding()
                }
                ZStack(alignment: .bottomTrailing){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                        .padding()
                }
                ZStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                        .padding()
                }
            }
            ZStack{
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.red)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                        .padding()
                }
                ZStack(alignment: .bottomTrailing){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                        .padding()
                }
                ZStack(alignment: .bottomLeading){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                        .padding()
                }
                ZStack(alignment: .topTrailing){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                        .padding()
                }
            }
        }
    }
}
struct asdf_Previews: PreviewProvider {
    static var previews: some View {
        asdf()
    }
}
