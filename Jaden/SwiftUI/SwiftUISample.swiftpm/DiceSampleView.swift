import SwiftUI

import SwiftUI

struct DiceSampleView: View {
    @State var alignment1 : Alignment = .center
    @State var alignment2 : Alignment = .center
    @State var alignment3 : Alignment = .center
    @State var alignment4 : Alignment = .center
    @State var alignment5 : Alignment = .center
    @State var alignment6 : Alignment = .center
    @State var random = Int.random(in: 1...6)

    var allAlignment : [Alignment] = []
    func diceMaker(){
        if random == 1{
            alignment1 = .center
            alignment2 = .center
            alignment3 = .center
            alignment4 = .center
            alignment5 = .center
            alignment6 = .center
        }else if random == 2{
            alignment1 = .topLeading
            alignment2 = .topLeading
            alignment3 = .topLeading
            alignment4 = .bottomTrailing
            alignment5 = .bottomTrailing
            alignment6 = .bottomTrailing
        }else if random == 3{
            alignment1 = .topLeading
            alignment2 = .topLeading
            alignment3 = .center
            alignment4 = .center
            alignment5 = .bottomTrailing
            alignment6 = .bottomTrailing
        }else if random == 4{
            alignment1 = .topLeading
            alignment2 = .topLeading
            alignment3 = .topTrailing
            alignment4 = .bottomLeading
            alignment5 = .bottomTrailing
            alignment6 = .bottomTrailing
        }else if random == 5{
            alignment1 = .topLeading
            alignment2 = .center
            alignment3 = .topTrailing
            alignment4 = .bottomLeading
            alignment5 = .bottomTrailing
            alignment6 = .bottomTrailing
        }else{
            alignment1 = .topLeading
            alignment2 = .leading
            alignment3 = .topTrailing
            alignment4 = .bottomLeading
            alignment5 = .trailing
            alignment6 = .bottomTrailing
        }
    }
    var body: some View {
        VStack{
            ZStack(alignment: alignment1){
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 200, height: 200)
                Circle()
                    .fill(.white)
                    .frame(width: 35, height: 35)
                    .padding()
                ZStack(alignment: alignment2){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 35, height: 35)
                        .padding()
                }
                ZStack(alignment: alignment3){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 35, height: 35)
                        .padding()
                }
                ZStack(alignment: alignment4){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 35, height: 35)
                        .padding()
                }
                ZStack(alignment: alignment5){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 35, height: 35)
                        .padding()
                }
                ZStack(alignment: alignment6){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width: 200, height: 200)
                    Circle()
                        .fill(.white)
                        .frame(width: 35, height: 35)
                        .padding()
                }
            }
//            ForEach(0...1, id:\.self){ index in
//                ZStack(alignment: allAlignment[index]){
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(.red)
//                        .frame(width: 200, height: 200)
//                    Circle()
//                        .fill(.white)
//                        .frame(width: 35, height: 35)
//                        .padding()
//                }
//            }
        
        HStack{
            Button("1"){
                random = 1
                withAnimation{
                    diceMaker()
                }
            }.buttonStyle(.borderedProminent)
            Button("2"){
                random = 2
                withAnimation{
                    diceMaker()
                }
            }.buttonStyle(.borderedProminent)
            Button("3"){
                random = 3
                withAnimation{
                    diceMaker()
                }
            }.buttonStyle(.borderedProminent)
            Button("4"){
                random = 4
                withAnimation{
                    diceMaker()
                }
            }.buttonStyle(.borderedProminent)
            Button("5"){
                random = 5
                withAnimation{
                    diceMaker()
                }
            }.buttonStyle(.borderedProminent)
            Button("6"){
                random = 6
                withAnimation{
                    diceMaker()
                }
            }.buttonStyle(.borderedProminent)
            Button("Random"){
                random = Int.random(in: 1...6)
                withAnimation{
                    diceMaker()
                }
            }.buttonStyle(.borderedProminent)
        }
    }
    }
}

struct DiceSampleView_Previews: PreviewProvider {
    static var previews: some View {
        DiceSampleView()
    }
}
