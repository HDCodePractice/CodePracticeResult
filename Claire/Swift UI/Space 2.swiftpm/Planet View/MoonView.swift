import SwiftUI

struct Moon: View {
    var body: some View {
        Text("The Moon is the fifth largest natural satellite in our solar system, and it is the largest relative to the size of its host planet. In fact, the Moon is about one quarter the size of Earth, while some of the other planets' moons are less than 1/100th the size of their host planet.")
        
        Text("The Moon has no atmosphere, which means that there is no weather or wind on its surface. As a result, footprints and other marks made by astronauts who visited the Moon during the Apollo missions in the 1960s and 1970s are still visible today, as there is no wind or rain to erase them.")
    }
}

struct Moon_Previews: PreviewProvider {
    static var previews: some View {
        Moon()
    }
}
