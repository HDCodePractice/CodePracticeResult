import SwiftUI
import MapKit

struct ShowLocation: View {
    @State var vm = ShowLocationViewModel()
    var body: some View {
        VStack {
            Spacer()
            Text("Your coordinates: \(LocationManager.currentLocation.latitude),\( LocationManager.currentLocation.longitude)")
                .font(.title)
            Map(coordinateRegion: $vm.region)
        }
    }
}

struct ShowLocationViewModel {
    @StateObject var lm = LocationManager.shared
    @State var region = MKCoordinateRegion(
        center: LocationManager.currentLocation, span: MKCoordinateSpan(
            latitudeDelta: 0.05, longitudeDelta: 0.05
        )
    )
}

struct ShowLocation_Previews: PreviewProvider {
    static var previews: some View {
        ShowLocation()
    }
}
