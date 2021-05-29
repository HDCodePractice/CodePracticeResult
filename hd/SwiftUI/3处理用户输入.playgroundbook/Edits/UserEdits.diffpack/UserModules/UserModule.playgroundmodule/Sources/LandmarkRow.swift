
import SwiftUI

public struct LandmarkRow:View {
    var landmark: Landmark
    
    public init(landmark : Landmark){
        self.landmark = landmark
    }
    
    public var body: some View{
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite{
                Image(systemName:"star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

