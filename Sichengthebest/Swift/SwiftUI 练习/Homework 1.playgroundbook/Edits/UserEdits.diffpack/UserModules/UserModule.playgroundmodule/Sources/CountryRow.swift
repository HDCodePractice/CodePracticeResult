
import SwiftUI

struct CountryRow: View {
    var country: Country
    var body: some View {
        VStack {
            Text(country.name)
        }
    }
}
