import SwiftUI
struct TextSizeSample: View {
    var body: some View {
        VStack{
            VStack(alignment:.center){
                Text("body").font(.body)
                Text("largeTITLE").font(.largeTitle)
                Text("TITLE").font(.title)
                Text("TITLE2").font(.title2)
                Text("TITLE3").font(.title3)
            }
            Text("SubHeadline").font(.subheadline)
            Text("Headline").font(.headline)
            Text("callout").font(.callout)
            Text("footnote").font(.footnote)
            Text("caption").font(.caption)
            Text("caption2").font(.caption2)
        }
    }
}

struct TextSizeSample_Previews: PreviewProvider {
    static var previews: some View {
        TextSizeSample()
    }
}
