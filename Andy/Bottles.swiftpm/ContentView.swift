import SwiftUI
var click = clicks()
func games()->[Bottle]{
    return click.newRound()
}
func target()->[Int]{
    return click.newTarget()
}
struct ContentView: View {
    @State var objectif : [Int] = target()
    @State var click = clicks()
    @State var game : [Bottle] = games()
    @State var color : [Color] = [.clear,.white,.gray,.black]
    @State var Sort = ["Cap","Height","Liquid"]
    @State var Order = [["darkest","lightest"],["Highest", "Lowest"],["full","empty"]]
    var body: some View {
        VStack{
            Text("Sort by \(Sort[objectif[0]]), from \(Order[objectif[0]][objectif[1]]) to \(Order[objectif[0]].reversed()[objectif[1]])")
            HStack{
                ZStack(alignment: .bottom){
                    Rectangle()
                        .fill(.clear)
                        .frame(height:800)
                    HStack(alignment: .bottom){
                        ForEach(0...2,id:\.self){ bottlee in
                            ZStack(alignment:.bottom){
                                Rectangle()
                                    .fill(color[game[bottlee].cap])
                                    .frame(height:CGFloat(game[bottlee].height+50))
                                Rectangle()
                                    .fill(.yellow)
                                    .frame(height:CGFloat(game[bottlee].height))
                                Rectangle()
                                    .fill(.brown)
                                    .frame(height:CGFloat(game[bottlee].liquid))
                            }
                            .onTapGesture{
                                //                    print("\(click.tapBottle(bottles: game, target:objectif,tap: bottlee))") 
                                if click.tapBottle(bottles: game, target:objectif,tap: bottlee) == true{
                                    game[bottlee] = Bottle(cap: 0, height: 0, liquid: 0)
                                }
                                if (game[0].cap+game[0].height+game[0].liquid)==0{
                                    if (game[1].cap+game[1].height+game[1].liquid)==0{
                                        if (game[2].cap+game[2].height+game[2].liquid)==0{
                                            game = games()
                                            objectif = target()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
