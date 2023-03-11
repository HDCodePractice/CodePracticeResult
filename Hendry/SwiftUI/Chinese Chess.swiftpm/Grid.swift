
import SwiftUI

struct topGrid: View {
    var body: some View {
        VStack(spacing:0){
            Rectangle()
                .fill(.clear)
            
            Rectangle()
                .fill(.black)
                .frame(height:10)
                
            
                Rectangle()
                    .fill(.yellow)
        }
    }
}
struct botGrid: View {
    var body: some View {
        VStack(spacing:0){
            Rectangle()
                .fill(.yellow)
            
            Rectangle()
                .fill(.black)
                .frame(height:10)
                
            
                Rectangle()
                    .fill(.clear)
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
struct leftGrid: View {
    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
                Rectangle()
                    .fill(.clear)
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                Rectangle()
                    .fill(.yellow)
                
            }
            
            
        }
    }
}
struct rightGrid: View {
    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
                Rectangle()
                    .fill(.yellow)
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                Rectangle()
                    .fill(.clear)
                
            }
            
            
        }
    }
}
struct topLeftGrid: View {
    var body: some View {
        VStack(spacing:0){
            
           Rectangle()
                .fill(.clear)
            HStack(spacing:-10){
                Rectangle()
                    .fill(.clear)
                    .frame(height:10)
                Rectangle()
                    .fill(.black)
                    .frame(height:10)
            }
            HStack(spacing:0){
                Rectangle()
                    .fill(.clear)
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
                .fill(.clear)
            HStack(spacing:-10){
                Rectangle()
                    .fill(.black)
                    .frame(height:10)
                Rectangle()
                    .fill(.clear)
                    .frame(height:10)
                
            }
            HStack(spacing:0){
                Rectangle()
                    .fill(.yellow)
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                Rectangle()
                    .fill(.clear)
            }
        }
    }
}
struct botLeftGrid: View {
    var body: some View {
        VStack(spacing:0){
           
            HStack(spacing:0){
                Rectangle()
                    .fill(.clear)
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                Rectangle()
                    .fill(.yellow)
            }
            HStack(spacing:-10){
                Rectangle()
                    .fill(.clear)
                    .frame(height:10)
                Rectangle()
                    .fill(.black)
                    .frame(height:10)
            }
            
           Rectangle()
                .fill(.clear)
           
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
                Rectangle()
                    .fill(.clear)
            }
            HStack(spacing:-10){
                Rectangle()
                    .fill(.black)
                    .frame(height:10)
                Rectangle()
                    .fill(.clear)
                    .frame(height:10)
                
            }
            Rectangle()
                 .fill(.clear)
             
        }
    }
}
struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        CrossGrid()
        topGrid()
        botGrid()
        leftGrid()
        rightGrid()
        topLeftGrid()
        topRightGrid()
        botLeftGrid()
        botRightGrid()
    }
}
