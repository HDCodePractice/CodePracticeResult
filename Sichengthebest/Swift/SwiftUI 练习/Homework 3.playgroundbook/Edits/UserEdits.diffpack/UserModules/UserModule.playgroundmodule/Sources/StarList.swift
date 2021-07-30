
import SwiftUI

struct StarList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    var filteredStars: [Star] {
        modelData.stars.filter { star in
            (!showFavoritesOnly || star.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredStars) { star in
                    NavigationLink(destination: PageDetail(star: star)) {
                        StarRow(star: star)
                    }
                }
            }
            .navigationTitle("Stars")
        }
    }
}
