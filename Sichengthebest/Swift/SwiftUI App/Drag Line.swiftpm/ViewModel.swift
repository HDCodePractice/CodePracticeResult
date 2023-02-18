import Foundation
import SwiftUI

struct ViewModel{
    var drag : some Gesture{
        DragGesture()
            .onChanged{ value in
                print("Change \(value)")
            }
            .onEnded{value in
                print("End \(value)")
            }
    }
}
