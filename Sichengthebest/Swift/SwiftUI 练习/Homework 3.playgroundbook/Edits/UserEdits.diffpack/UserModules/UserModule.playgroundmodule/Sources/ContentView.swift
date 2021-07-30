
import SwiftUI

public struct ContentView: View {
    public init(){}
    public var body : some View {
        StarList().environmentObject(ModelData())
    }
}
