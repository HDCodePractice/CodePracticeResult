
import SwiftUI

struct BaseStats: View {
    var pokemon: Pokemon
    @Binding var hpValue: Int
    @Binding var atkValue: Int
    @Binding var defValue: Int
    @Binding var spatkValue: Int
    @Binding var spdefValue: Int
    @Binding var spdValue: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Base stats")
                .font(.title)
                .bold()
            Divider()
            HStack {
                Text("               HP")
                ProgressBar(value:$hpValue).frame(height: 15)
                Text("\(pokemon.hp)")
            }
            HStack {
                Text("         Attack")
                ProgressBar(value:$atkValue).frame(height: 15)
                Text("\(pokemon.atk)")
            }
            HStack {
                Text("      Defence")
                ProgressBar(value:$defValue).frame(height: 15)
                Text("\(pokemon.def)")
            }
            HStack {
                Text("   Sp. Attack")
                ProgressBar(value:$spatkValue).frame(height: 15)
                Text("\(pokemon.spatk)")
            }
            HStack {
                Text("Sp. Defence")
                ProgressBar(value:$spdefValue).frame(height: 15)
                Text("\(pokemon.spdef)")
            }
            HStack {
                Text("          Speed")
                ProgressBar(value:$spdValue).frame(height: 15)
                Text("\(pokemon.speed)")
            }
            Divider()
            HStack {
                Text("             Total")
                    .bold()
                Spacer()
                Text("\(pokemon.total)")
            }
        }
        .padding()
    }
}
