
import SwiftUI

struct PokemonList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    var filteredPokemon: [Pokemon] {
        modelData.pokemons.filter { pokemon in
            (!showFavoritesOnly || pokemon.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredPokemon) { pokemon in
                    NavigationLink(destination: PageDetail(pokemon: pokemon)) {
                        PokemonRow(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokemon")
        }
    }
}
