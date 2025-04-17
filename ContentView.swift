import SwiftUI

struct ContentView: View {
    @State var totalSavings: Int!
    @State var retirementAccount: Int!
    @State var salary1: Int!
    @State var Tax: Int!
    var body: some View {
            TextField("Enter your salary!", value: $salary1, format: .number)
                .multilineTextAlignment(.center)
        
    }
}
