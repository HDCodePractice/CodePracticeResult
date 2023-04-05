import SwiftUI

struct Plato: View {
    var body: some View {
        Text("Pluto was discovered in 1930 by American astronomer Clyde Tombaugh. At the time, it was considered the ninth planet in our solar system, but it was later reclassified as a 'dwarf planet' in 2006 due to its small size and irregular orbit.")
        
        Text("Pluto has five known moons: Charon, Nix, Hydra, Kerberos, and Styx. Charon is the largest and closest of these moons, and it is so big relative to Pluto that the two objects actually orbit around a point between them, rather than Pluto being the center of Charon's orbit.")
    }
}

struct Plato_Preview: PreviewProvider {
    static var previews: some View {
        Plato()
    }
}
