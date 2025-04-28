import SwiftUI

struct HousingView: View {
    @State var Housing: String = ""
    var body: some View {
        TextField("Enter the type of resident you want to live in", text: $Housing)
    }
}

