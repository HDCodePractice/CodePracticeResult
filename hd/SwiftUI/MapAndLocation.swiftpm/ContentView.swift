import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink("显示地图") { 
                    ShowMapView()
                }
                NavigationLink("显示并获取当前位置") { 
                    ShowLocationView()
                }
                NavigationLink("在地图上打点") { 
                    ShowAnnotationItemsView()
                }
            }
        }
    }
}
