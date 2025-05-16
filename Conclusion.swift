import SwiftUI

struct conclusionView: View {
    @State var finalBalance: Double
    @Binding var savingsAfterHousing: Double
    @Binding var Tax: Double
    
    var body: some View {
        VStack {
            Text("Your tax payment: \(Tax)")
            Text("Your final balance is:  \(savingsAfterHousing)")
        }
    }
    
    
}
