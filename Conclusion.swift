import SwiftUI

struct conclusionView: View {
    @State var finalBalance: Double
    @Binding var savingsAfterHousing: Double
    @Binding var Tax: Double
    @Binding var retirementAccount: Double
    @Binding var HousingCostsPerMonth: Double
    
    var body: some View {
        VStack {
            Text("Your annual tax payment: \(Tax)")
            Text("Your annual 401k investment: \(retirementAccount)")
            Text("Your monthly housing costs: \(HousingCostsPerMonth")
            Text("Your final balance is:  \(savingsAfterHousing)")
        }
    }
    
    
}
