
import SwiftUI
struct BoardGrid{
    var grids : [[String]]=[]
    init(){
        grids = []
        for _ in 0..<10{
            var line : [String]  = []
            for _ in 0..<10{
                line.append("cross")
            }
            grids.append(line)
        }
        for i in 0..<10{
            grids[0][i]="top"
            grids[5][i]="top"
            grids[4][i]="bot"
            grids[9][i]="bot"
            grids[i][0]="left"
            grids[i][8]="right"
        }
        grids[0][0] = "tl"
        grids[0][8] = "tr"
        grids[9][0] = "bl"
        grids[9][8] = "br"
        grids[5][0] = "tl"
        grids[5][8] = "tr"
        grids[4][0] = "bl"
        grids[4][8] = "br"
    }
}

struct Board: View {
    var grid : String
    var body: some View {
        if grid == "cross"{
            CrossGrid()
        }else if grid == "top"{
            TopGrid()
        }else if grid == "bot"{
            BotGrid()
        }else if grid == "tl"{
            TopLeftGrid()
        }else if grid == "tr"{
            TopRightGrid()
        }else if grid == "left"{
            LeftGrid()
        }else if grid == "right"{
            RightGrid()
        }else if grid == "br" {
            BotRightGrid()
        }else if grid == "bl" {
            BotLeftGrid()
        }
    }
}
struct TopGrid: View {
    var body: some View {
        VStack(spacing:0){
            Rectangle()
                .fill(.clear)
            
            Rectangle()
                .fill(.black)
                .frame(height:10)
            
            HStack(spacing:0){
                Rectangle()
                    .fill(.yellow)
                Rectangle()
                    .frame(width:10)
                Rectangle()
                    .fill(.yellow)
            }
        }
    }
}
struct BotGrid: View {
    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
                Rectangle()
                    .fill(.yellow)
                Rectangle()
                    .frame(width:10)
                Rectangle()
                    .fill(.yellow)
            }
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
struct LeftGrid: View {
    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
                Rectangle()
                    .fill(.clear)
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                VStack(spacing:0){
                    Rectangle()
                        .fill(.yellow)
                    Rectangle()
                        .frame(height:10)
                    Rectangle()
                        .fill(.yellow)
                }
            }
        }
    }
}
struct RightGrid: View {
    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
                VStack(spacing:0){
                    Rectangle()
                        .fill(.yellow)
                    Rectangle()
                        .frame(height:10)
                    Rectangle()
                        .fill(.yellow)
                }
                Rectangle()
                    .fill(.black)
                    .frame(width: 10)
                Rectangle()
                    .fill(.clear)
                
            }
            
            
        }
    }
}
struct TopLeftGrid: View {
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
struct TopRightGrid: View {
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
struct BotLeftGrid: View {
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
struct BotRightGrid: View {
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
        TopGrid()
        BotGrid()
        LeftGrid()
        RightGrid()
        TopLeftGrid()
        TopRightGrid()
        BotLeftGrid()
        BotRightGrid()
    }
}
