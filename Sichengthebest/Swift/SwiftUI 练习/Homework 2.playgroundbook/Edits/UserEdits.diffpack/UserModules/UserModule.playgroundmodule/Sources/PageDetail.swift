import SwiftUI

struct PageDetail: View {
    @EnvironmentObject var modelData: ModelData
    var pokemon: Pokemon
    var pokeIndex: Int {
        modelData.pokemons.firstIndex(where: { $0.id == pokemon.id })!
    }
    var body: some View {
        VStack {
            HStack {
                Text(pokemon.name)
                    .font(.largeTitle)
                    .bold()
                FavoriteButton(isSet: $modelData.pokemons[pokeIndex].isFavorite)
            }
            PokedexData(pokemon: pokemon)
            BaseStats(pokemon: pokemon, hpValue: $modelData.pokemons[pokeIndex].hp, atkValue: $modelData.pokemons[pokeIndex].atk, defValue: $modelData.pokemons[pokeIndex].def, spatkValue: $modelData.pokemons[pokeIndex].spatk, spdefValue: $modelData.pokemons[pokeIndex].spdef, spdValue: $modelData.pokemons[pokeIndex].speed)
        }
    }
}

