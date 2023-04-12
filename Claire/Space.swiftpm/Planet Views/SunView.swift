import SwiftUI

struct Sun: View {
    var body: some View {
        Text("The sun is so big that if it were hollow, over a million Earths could fit inside it! The sun's diameter is about 1.39 million kilometers, which is about 109 times the diameter of Earth.")
        
        Text("The sun is not a solid object like Earth or other planets. It is actually made up of gas, mostly hydrogen (about 74% of its mass) and helium (about 24% of its mass), with small amounts of other elements. The gas is so hot and energetic that it is in a plasma state, meaning the particles are stripped of their electrons and the gas behaves like a fluid rather than a solid or a gas.")
    }
}

struct Sun_Preview: PreviewProvider {
    static var previews: some View {
        Sun()
    }
}
