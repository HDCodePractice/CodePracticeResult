
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
                Spacer()
                    .padding()
                    
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
            
            Spacer()
                .padding()
            HStack(spacing:-10){
                Spacer()
                    .padding(0)
                Rectangle()
                    .fill(.black)
                    .frame(height:10)
            }
            HStack(spacing:0){
               Spacer()
                    .padding()
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
            Spacer()
                .padding()
            HStack(spacing:-10){
                Rectangle()
                    .fill(.black)
                    .frame(height:10)
                Spacer()
                    .padding(0)
            }
            HStack(spacing:0){
                Rectangle()
                    .fill(.yellow)
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                Spacer()
                    .padding()
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
        topGrid()
        leftGrid()
        topLeftGrid()
        topRightGrid()
        botLeftGrid()
        botRightGrid()
    }
}
