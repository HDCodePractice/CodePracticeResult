import SwiftUI

struct ContentView: View {
    @State var lands = [
        ["","Jaden","Jaden","Jaden","4","Claire","6","Claire","8","Claire",""],
        ["","1","2","3","4","5","6","7","8","9",""],
        ["","1","2","3","4","5","6","7","8","9",""],
        ["","1","2","3","4","5","6","7","8","9",""]
    ]
    @State var landscolor : [Color] = [.red,.blue,.cyan,.brown,.gray]
    @State var corners : [String] = ["got to jail", "just visiting","parking",""]
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<11){ y in
                HStack(spacing: 0) {
                    ForEach(0..<11){ x in
                        ZStack{
                            Rectangle()
                                .fill(isClear(x: x, y: y) ? .white : .cyan)
                                .overlay{
                                    if !isClear(x: x, y: y){
                                        Rectangle()
                                            .stroke(.black,lineWidth: 2)
                                    }
                                }
                            Text(getText(x: x, y: y))
                            if !isClear(x: x, y: y){
                                VStack{
                                    Rectangle()
                                        .fill(.red)
                                    Rectangle()
                                        .fill(.clear)
                                    Rectangle()
                                        .fill(.clear)
                                    Rectangle()
                                        .fill(.clear)
                                    Rectangle()
                                        .fill(.clear)
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    func getText(x: Int,y:Int)->String{
        if y==0{
            return lands[0][x]
        }
        if x==0 {
            return lands[1][y]
        }
        if x==10{
            return lands[2][y]
        }
        if y==10{
            return lands[3][x]
        }
        return ""
    }
    
    func isClear(x: Int, y: Int)->Bool{
        if x == 0 || y==0 || x==10 || y==10 {
            return false
        }
        return true
    }
}
