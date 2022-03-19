import SwiftUI

struct ChessboardView: View {
    @State var vm = ViewModule()
    @State var scale: CGFloat
    @State var pieces: Pieces
    var body: some View {
        ZStack {
            VStack (spacing:0) {
                ForEach(vm.chessBoard, id: \.self) { row in
                    HStack (spacing:0) {
                        ForEach(row) { each in
                            ZStack {
                                Image(each.image)
                                    .resizable()
                                    .frame (
                                        width:
                                            ["TopLeft","TopRight","BottomLeft","BottomRight"].contains(each.image) ? scale :
                                            ["Top","Bottom"].contains(each.image) ? scale * 2 :
                                            ["Right","Left"].contains(each.image) ? scale :
                                            scale * 2,
                                        height:
                                            ["TopLeft","TopRight","BottomLeft","BottomRight"].contains(each.image) ? scale :
                                            ["Top","Bottom"].contains(each.image) ? scale :
                                            ["Right","Left"].contains(each.image) ? scale * 2 :
                                            scale * 2
                                    )
                            }
                        }
                    }
                }
            }
            if pieces.status != "" {
                Circle()
                    .foregroundColor(pieces.status == "w" ? .white : .black)
                    .frame(width: scale, height: scale)
                    .shadow(radius: 2)
            }
        }
        .onTapGesture {
            pieces.status = "w"
        }
    }
}
