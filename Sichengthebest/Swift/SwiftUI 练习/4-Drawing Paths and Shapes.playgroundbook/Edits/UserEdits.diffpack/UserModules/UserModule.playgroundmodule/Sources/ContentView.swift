import SwiftUI

public struct ContentView: View {
    public init(){}
    public var body : some View {
        BadgeBackground()
    }
}

public struct ContentView2: View {
    public init(){}
    public var body : some View {
        BadgeSymbol()
    }
}

public struct ContentView3: View {
    public init(){}
    public var body : some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 35))
    }
}

public struct ContentView4: View {
    public init(){}
    public var body : some View {
        Badge()
    }
}
