
import SwiftUI

struct horiGrid: View {
    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
                Rectangle()
                    .fill(.yellow)
                
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
                    .fill(.yellow)
            }
        }
    }
}
struct CrossGrid: View {
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
struct vertiGrid: View {
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
struct topLeftGrid: View {
    var body: some View {
        VStack(spacing:0){
            
            Rectangle()
                .fill(.black)
                .frame(height:10)
            
            HStack(spacing:0){
               
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                Rectangle()
                    .fill(.yellow)
            }
        }
    }
}
struct topRightGrid: View {
    var body: some View {
        VStack(spacing:0){
            
            Rectangle()
                .fill(.black)
                .frame(height:10)
            
            HStack(spacing:0){
                Rectangle()
                    .fill(.yellow)
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                
            }
        }
    }
}
struct botLeftGrid: View {
    var body: some View {
        VStack(spacing:0){
            
            
            
            HStack(spacing:0){
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                Rectangle()
                    .fill(.yellow)
                
                
            }
            Rectangle()
                .fill(.black)
                .frame(height:10)
        }
    }
}
struct botRightGrid: View {
    var body: some View {
        VStack(spacing:0){
            
           
            
            HStack(spacing:0){
                Rectangle()
                    .fill(.yellow)
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                
            }
            Rectangle()
                .fill(.black)
                .frame(height:10)
        }
    }
}
struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        CrossGrid()
        horiGrid()
        vertiGrid()
        topLeftGrid()
        topRightGrid()
        botLeftGrid()
        botRightGrid()
    }
}
