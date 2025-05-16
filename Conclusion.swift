import SwiftUI

struct conclusionView: View {
    @Binding var savingsAfterHousing: Double
    @Binding var Tax: Double
    @Binding var retirementAccount: Double
    @Binding var HousingCostsPerMonth: Double
    
    var body: some View {
        VStack {
            Text("Your annual tax payment: $\(Tax)")
                .font(.custom("Times New Roman", size: 17))
                .padding()
            Text("Your annual 401k investment: $\(retirementAccount)")
                .font(.custom("Times New Roman", size: 17))
                .padding()
            Text("Your monthly housing costs: $\(HousingCostsPerMonth)")
                .font(.custom("Times New Roman", size: 17))
                .padding()
            Text("Your final balance is: $\(savingsAfterHousing)")
                .font(.custom("Times New Roman", size: 17))
        }
    }
    
    
}
