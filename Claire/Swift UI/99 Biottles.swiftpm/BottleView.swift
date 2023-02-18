import SwiftUI

struct BottleView: View {
    var  height : CGFloat
    var liquid : CGFloat
    var cap : Int
    
    func tapAction(){
        
    }
    var body: some View {
        VStack(spacing: 0){
            Color(.clear)
                .frame(height: 150*(3-height))
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(.secondary)
                    .frame(width: 150, height: 50)
                RoundedRectangle(cornerRadius: 5)
                    .fill(.black)
                    .opacity([1,0.5,0][cap-1])
                    .frame(width: 140, height: 40)
            }
            Rectangle()
                .fill(.secondary)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 70)
            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 20)
                    .fill(.secondary)
                Rectangle()
                    .frame(height: 100*liquid )
                    .padding()
            }
        }
    }
}

struct BottleView_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            BottleView(height: 1,liquid: 1,cap: 1)
            BottleView(height: 2,liquid: 2,cap: 2)
            BottleView(height: 3,liquid: 3,cap: 3)
        }
    }
}
