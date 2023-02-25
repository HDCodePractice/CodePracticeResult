
import SwiftUI

struct Grid: View {
    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
                Rectangle()
                    .fill(.yellow)
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                Rectangle()
                    .fill(.yellow)
                
            }
            
            Rectangle()
                .fill(.black)
                .frame(height:10)
                
            HStack(spacing:0){
                Rectangle()
                    .fill(.yellow)
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                Rectangle()
                    .fill(.yellow)
            }
        }
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}