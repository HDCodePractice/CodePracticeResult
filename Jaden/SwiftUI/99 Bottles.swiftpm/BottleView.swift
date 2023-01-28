import SwiftUI

struct BottleView: View {
    var height : Int
    var liquid: Int
    var cap : Int
    var body: some View {
        VStack(spacing: 0){
            Color(.clear)
                .frame(height: CGFloat(100*(3-height)))
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(.secondary)
                    .frame(width: 150, height: 50)
                    .border(Color.black, width: 3)
                RoundedRectangle(cornerRadius: 5)
                    .fill(.black)
                    .opacity([1,0.5,0][cap-1])
                    .frame(width: 140, height: 40)
            }
            
            
            Rectangle()
                .frame(width: 100, height: 70)
            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 40)
                Rectangle()
                    .frame(height: CGFloat(100*liquid))
                    .padding()
            }
            
        }
        
    }
}

struct BottleView_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            BottleView(height: 1,liquid: 8, cap: 3)
            BottleView(height: 2, liquid: 12, cap: 1)
            BottleView(height: 3, liquid: 4, cap: 2)
        }
        
    }
}
