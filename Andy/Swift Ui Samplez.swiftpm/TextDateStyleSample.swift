import SwiftUI
struct TextDateStyleSample: View {
    let now = Date()
    var body: some View {
        VStack{
            Text("\(now)")
            Text("Date:").bold() + Text(now,style: .date)
            Text("Time: ").bold() + Text(now,style: .time)
            Text("Offset: ").bold() + Text(now,style: .offset)
            Text("Timer: ").bold() + Text(now,style: .timer)
            Text("Relative: ").bold() + Text(now,style: .relative)
            
        }
    }
}

struct TextDateStyleSample_Previews: PreviewProvider {
    static var previews: some View {
        TextDateStyleSample()
    }
}
