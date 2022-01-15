import SwiftUI

struct CountryDetail: View {
    var country: Country
    
    var body: some View {
        VStack {
            Text(country.name)
                .font(.title)
                .foregroundColor(.primary)
                .bold()
            Divider()
            Text("Capital: \(country.yes)")
                .font(.title3)
            Divider()
            Text("Wrong answers:")
                .font(.headline)
            ForEach(country.no, id: \.self) { ans in
                Text(ans)
            }
            Divider()
            Text("Funny answers:")
                .font(.headline)
            ForEach(country.haha, id: \.self) { ans in
                Text(ans)
            }
        }
    }
}
