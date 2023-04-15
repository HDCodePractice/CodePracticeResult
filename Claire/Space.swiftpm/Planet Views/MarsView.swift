import SwiftUI

struct Mars: View {
    var body: some View {
        Text("Mars is home to the largest volcano in the solar system. Olympus Mons is a shield volcano located on the Martian surface, and it stands at a height of nearly 22 km (14 miles), making it almost three times the height of Mount Everest, the tallest mountain on Earth.")
        
        Text("Mars has a very thin atmosphere that is mostly made up of carbon dioxide. The thin atmosphere means that Mars has a weaker greenhouse effect than Earth, which makes it a much colder planet. However, despite the cold temperatures, it's possible for water to exist on the planet in the form of ice or in underground reservoirs.")
    }
}

struct Mars_Preview: PreviewProvider {
    static var previews: some View {
        Mars()
    }
}
