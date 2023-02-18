import SwiftUI

struct GridView: View {
    
    var text: String
    var text2 : String
    var selected : Bool
    
    var body: some View {
        GeometryReader{g in
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                if selected == false {
                    Text(text)
                        .font(.system(size: g.size.height > g.size.width ? g.size.width-72 : g.size.height-72))
                        .foregroundColor(.primary)
                } else {
                    Text(text.uppercased())
                        .font(.system(size: g.size.height > g.size.width ? g.size.width-72 : g.size.height-72))
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

struct GridListView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            GridListView()
            GridListView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
