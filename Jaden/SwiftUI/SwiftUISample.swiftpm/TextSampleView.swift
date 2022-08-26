import SwiftUI

struct TextSampleView: View {
    var body: some View {
        VStack{
            Text("Hello World!")
                .italic()
                .font(.largeTitle)
                .foregroundColor(.red)
                .underline(true, color: .black)
            Text("Hello World!")
                .bold()
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundColor(.red)
                .strikethrough(true, color: .blue)
            Text("11111")
                .monospacedDigit()
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("23456")
                .monospacedDigit()
                .font(.largeTitle)
                .foregroundColor(.red)
            
            Text("Hello World2!")
                .font(.custom("PilGi", size: 33))
        }
    }
}

struct TextSampleView_Previews: PreviewProvider {
    static var previews: some View {
        TextSampleView()
    }
}

struct TextDateStyleSample: View {
    let now = Date()
    var body: some View {
        VStack{
            Text("\(now)")
            Text("Date: ").bold() + Text(now,style: .date)
            Text("Time: ").bold() + Text(now,style: .time)
            Text("Offset: ").bold() + Text(now,style: .offset)
            Text("Timer: ").bold() + Text(now,style: .timer)
            Text("Relative: ").bold() + Text(now,style: .relative)
        }
    }
}


struct TextFontSample: View {
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("1234  Large Title").font(.largeTitle)
                Text("1234  Title").font(.title)
                Text("1234  Title2").font(.title2)
                Text("1234  Title3").font(.title3)
                Text("1234  Headline").font(.headline)
                
            }
            Text("1234  Body").font(.body)
            Text("1234  Callout").font(.callout)
            Text("1234  Subheadline").font(.subheadline)
            Text("1234  Footnote").font(.footnote)
            Text("1234  Caption").font(.caption)
            Text("1234  Caption2").font(.caption2)
        }
    }
}


struct TextFontWeightSample: View {
    var body: some View {
        VStack {
            VStack {
                Text("ultraLight").fontWeight(Font.Weight.ultraLight)
                Text("thin").fontWeight(Font.Weight.thin)
                Text("light").fontWeight(Font.Weight.light)
                Text("regular").fontWeight(Font.Weight.regular)
                Text("medium").fontWeight(Font.Weight.medium)
                Text("semibold").fontWeight(Font.Weight.semibold)
                Text("bold").fontWeight(Font.Weight.bold)
                Text("heavy").fontWeight(Font.Weight.heavy)
                Text("black").fontWeight(Font.Weight.black)
            }.font(.title)
        }
    }
}
