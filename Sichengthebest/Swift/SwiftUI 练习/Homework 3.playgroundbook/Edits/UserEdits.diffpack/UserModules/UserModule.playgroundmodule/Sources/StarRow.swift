
import SwiftUI

struct StarRow: View {
    @EnvironmentObject var modelData: ModelData
    var star: Star
    var starIndex: Int {
        modelData.stars.firstIndex(where: { $0.id == star.id })!
    }
    var body: some View {
        HStack {
            Text(star.name)
            FavoriteButton(isSet: $modelData.stars[starIndex].isFavorite)
        }
    }
}
