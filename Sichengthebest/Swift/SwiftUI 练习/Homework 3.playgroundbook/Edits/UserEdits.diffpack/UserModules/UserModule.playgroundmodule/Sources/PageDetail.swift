import SwiftUI

struct PageDetail: View {
    @EnvironmentObject var modelData: ModelData
    var star: Star
    var starIndex: Int {
        modelData.stars.firstIndex(where: { $0.id == star.id })!
    }
    var body: some View {
        VStack {
            HStack {
                Text("Favorite?")
                FavoriteButton(isSet: $modelData.stars[starIndex].isFavorite)
            }
            Divider()
            Path { path in
                var width: CGFloat = 100.0
                let height = width
                path.move(
                    to: CGPoint(
                        x: 300,
                        y: 0
                    )
                )
                
                star.points.forEach { coords in
                    path.addLine(
                        to: CGPoint(
                            x: width * StarParameters.Segment(line: CGPoint(x: coords[0], y: coords[1])).line.x,
                            y: height * StarParameters.Segment(line: CGPoint(x: coords[0], y: coords[1])).line.y
                        )
                    )
                }
            }
            .fill(Color.blue)
        }
    }
}
