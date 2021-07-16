import SwiftUI

struct CountryList: View {
    var body: some View {
        NavigationView {
            List(countries) { country in
                NavigationLink(destination: CountryDetail(country: country)) {
                    CountryRow(country: country)
                }
            }
            .navigationTitle("Countries")
        }
    }
}
