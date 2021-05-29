
import SwiftUI

public struct FavoriteButton: View {
    @Binding var isSet: Bool
    public init(isSet : Binding<Bool>){
        self._isSet = isSet
    }
    public var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}
