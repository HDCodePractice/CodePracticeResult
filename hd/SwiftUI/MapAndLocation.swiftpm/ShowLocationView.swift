import SwiftUI
import MapKit

struct ShowLocationView: View {
    @State var vm = ShowLocationViewModel()

    var body: some View {
        VStack{
            Text("你的坐标是：\(vm.location.latitude),\(vm.location.longitude)")
            Map(coordinateRegion: $vm.coordinateRegion)
        }
    }
}

struct ShowLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ShowLocationView()
    }
}

struct ShowLocationViewModel{
    let lm = LocationManager.shared
    
    var location : CLLocationCoordinate2D = LocationManager.currentLocation
    var coordinateRegion = MKCoordinateRegion(
        center: LocationManager.currentLocation, 
        span: MKCoordinateSpan(
            latitudeDelta: 0.02, 
            longitudeDelta: 0.02
        )
    )
}
