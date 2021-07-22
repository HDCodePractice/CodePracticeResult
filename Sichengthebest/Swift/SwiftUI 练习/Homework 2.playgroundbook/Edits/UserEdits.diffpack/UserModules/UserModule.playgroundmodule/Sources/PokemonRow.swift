
import SwiftUI

struct PokemonRow: View {
    @EnvironmentObject var modelData: ModelData
    var pokemon: Pokemon
    var pokeIndex: Int {
        modelData.pokemons.firstIndex(where: { $0.id == pokemon.id })!
    }
    var body: some View {
        HStack {
            pokemon.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(pokemon.name)
            Spacer()
            FavoriteButton(isSet: $modelData.pokemons[pokeIndex].isFavorite)
        }
    }
}
