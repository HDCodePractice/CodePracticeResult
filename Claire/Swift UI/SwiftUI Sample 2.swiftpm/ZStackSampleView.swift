import SwiftUI

// func

struct ZStackSampleView: View {
    @State var movethings : Alignment = .topLeading
    @State var currentNumber = 0
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.red)
                    .frame(width: 200, height: 200)
                if currentNumber == 1{
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                } else if currentNumber == 2{
                    withAnimation{
                        ZStack(alignment: .topLeading){
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.red)
                                .frame(width: 200, height: 200)
                            Circle()
                                .foregroundColor(.yellow)
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        ZStack(alignment: .bottomTrailing){
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.clear)
                                .frame(width: 200, height: 200)
                            Circle()
                                .foregroundColor(.yellow)
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                    }
                } else if currentNumber == 3{
                    ZStack(alignment: .topLeading){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.red)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .bottomTrailing){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                } else if currentNumber == 4{
                    ZStack(alignment: .topLeading){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.red)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .bottomTrailing){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .topTrailing){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .bottomLeading){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                } else if currentNumber == 5{
                    ZStack(alignment: .topLeading){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.red)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .bottomTrailing){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .topTrailing){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .bottomLeading){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                } else if currentNumber == 6{
                    ZStack(alignment: .topLeading){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.red)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .bottomTrailing){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .topTrailing){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .bottomLeading){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    ZStack(alignment: .trailing){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 200)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                }
            }
            
            HStack{
                Button("1"){
                    withAnimation {
                        currentNumber = 1
                    }
                }.buttonStyle(.borderedProminent)
                Button("2"){
                    withAnimation {
                        currentNumber = 2
                    }
                }.buttonStyle(.borderedProminent)
                Button("3"){
                    withAnimation {
                        currentNumber = 3
                    }
                }.buttonStyle(.borderedProminent)
                Button("4"){
                    withAnimation {
                        currentNumber = 4
                    }
                }.buttonStyle(.borderedProminent)
                Button("5"){
                    withAnimation {
                        currentNumber = 5
                    }
                }.buttonStyle(.borderedProminent)
                Button("6"){
                    withAnimation {
                        currentNumber = 6
                    }
                }.buttonStyle(.borderedProminent)
                Button("Random"){
                    withAnimation {
                        currentNumber = Int.random(in: 1...6)
                    }
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

struct ZStackSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackSampleView()
    }
}
