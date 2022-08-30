import SwiftUI

struct DiceSample: View {
    @State var dot1 : Alignment = .center
    @State var dot2 : Alignment = .center
    @State var dot3 : Alignment = .center
    @State var dot4 : Alignment = .center
    @State var dot5 : Alignment = .center
    @State var dot6 : Alignment = .center
    @State var number = 1
    func moveDots(){
        if number == 1{
            dot1 = .center
            dot2 = .center
            dot3 = .center
            dot4 = .center
            dot5 = .center
            dot6 = .center
        }
        if number == 2{
            dot1 = .topLeading
            dot2 = .topLeading
            dot3 = .topLeading
            dot4 = .bottomTrailing
            dot5 = .bottomTrailing
            dot6 = .bottomTrailing
        }
        if number == 3{
            dot1 = .topLeading
            dot2 = .topLeading
            dot3 = .center
            dot4 = .center
            dot5 = .bottomTrailing
            dot6 = .bottomTrailing
        }
        if number == 4{
            dot1 = .topLeading
            dot2 = .topLeading
            dot3 = .topTrailing
            dot4 = .bottomLeading
            dot5 = .bottomTrailing
            dot6 = .bottomTrailing
        }
        if number == 5{
            dot1 = .topLeading
            dot2 = .center
            dot3 = .topTrailing
            dot4 = .bottomLeading
            dot5 = .center
            dot6 = .bottomTrailing
        }
        if number == 6{
            dot1 = .topLeading
            dot2 = .leading
            dot3 = .topTrailing
            dot4 = .bottomLeading
            dot5 = .trailing
            dot6 = .bottomTrailing
        }
        
    }
    var body: some View {
        VStack{
        ZStack(){
            RoundedRectangle(cornerRadius: 50)
                .fill(.red)
                .frame(width: 425, height: 425)
            ZStack(alignment: dot1){
                RoundedRectangle(cornerRadius: 50)
                    .fill(.clear)
                    .frame(width: 350, height: 350)
                Circle()
                    .frame(width: 75, height: 75)
            }
            
            ZStack(alignment: dot2){
                RoundedRectangle(cornerRadius: 50)
                    .fill(.clear)
                    .frame(width: 350, height: 350)
                Circle()
                    .frame(width: 75, height: 75)
            }
            ZStack(alignment: dot3){
                RoundedRectangle(cornerRadius: 50)
                    .fill(.clear)
                    .frame(width: 350, height: 350)
                Circle()
                    .frame(width: 75, height: 75)
            }
            ZStack(alignment: dot4){
                RoundedRectangle(cornerRadius: 50)
                    .fill(.clear)
                    .frame(width: 350, height: 350)
                Circle()
                    .frame(width: 75, height: 75)
            }
            ZStack(alignment: dot5){
                RoundedRectangle(cornerRadius: 50)
                    .fill(.clear)
                    .frame(width: 350, height: 350)
                Circle()
                    .frame(width: 75, height: 75)
            }
            ZStack(alignment: dot6){
                RoundedRectangle(cornerRadius: 50)
                    .fill(.clear)
                    .frame(width: 350, height: 350)
                Circle()
                    .frame(width: 75, height: 75)
            }
            
        }
            Rectangle()
                .fill(.clear)
                .frame(width: 2000, height: 25)
            
            HStack{
            Button("1"){
                withAnimation{
                    number = 1
                    moveDots()
                }
            }.buttonStyle(.borderedProminent)
            Button("2"){
                withAnimation{
                    number = 2
                    moveDots()
                }
            }.buttonStyle(.borderedProminent)
            Button("3"){
                withAnimation{
                    number = 3
                    moveDots()
                }
            }.buttonStyle(.borderedProminent)
            Button("4"){
                withAnimation{
                    number = 4
                    moveDots()
                }
            }.buttonStyle(.borderedProminent)
            Button("5"){
                withAnimation{
                    number = 5
                    moveDots()
                }
            }.buttonStyle(.borderedProminent)
            Button("6"){
                withAnimation{
                    number = 6
                    moveDots()
                }
            }.buttonStyle(.borderedProminent)
            }
            Button("Random"){
                withAnimation{
                    number = [1,2,3,4,5,6].randomElement()!
                    moveDots()
                }
            }.buttonStyle(.borderedProminent)
        }
    }
    
}


struct DiceSample_Previews: PreviewProvider {
    static var previews: some View {
        DiceSample()
    }
}
