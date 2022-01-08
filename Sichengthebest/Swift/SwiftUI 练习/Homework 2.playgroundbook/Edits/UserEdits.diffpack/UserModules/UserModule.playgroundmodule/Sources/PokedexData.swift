
import SwiftUI

struct PokedexData: View {
    var pokemon: Pokemon
    var body: some View {
        HStack {
            pokemon.image
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            VStack(alignment: .leading) {
                Text("Pokedex data")
                    .font(.title)
                    .bold()
                Divider()
                HStack {
                    Text("ID")
                        .bold()
                    Spacer()
                    Text("\(pokemon.id)")
                }
                HStack {
                    Text("Type")
                        .bold()
                    Spacer()
                    ForEach(pokemon.type, id: \.self) { type in
                        ZStack {
                            RoundedRectangle(cornerRadius:5).frame(width:60,height:20).foregroundColor(Color(UIColor.systemGray))
                            Text(type)
                        }
                    }
                }
                HStack {
                    Text("Height")
                        .bold()
                    Spacer()
                    Text("\(pokemon.height)")
                }
                HStack {
                    Text("Weight")
                        .bold()
                    Spacer()
                    Text("\(pokemon.weight)")
                }
                Divider()
                HStack {
                    Text("Abilities")
                        .bold()
                    Spacer()
                    VStack(alignment: .trailing) {
                        ForEach(pokemon.abilities, id: \.self) { ab in
                            Text(ab)
                        }
                        ForEach(pokemon.hiddenabilities, id: \.self) { hab in
                            Text("\(hab) (hidden ability)")
                                .font(.callout)
                        }
                    }
                }
            }
        }
    }
}

