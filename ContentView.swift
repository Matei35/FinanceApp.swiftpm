import SwiftUI

struct ContentView: View {
    @State var salary1: Int!
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            TextField("Enter your salary!", value: $salary1, format: .number)
                .multilineTextAlignment(.center)
        }
    }
}
