import SwiftUI

struct conclusionView: View {
    @Binding var savingsAfterHousing: Double
    @Binding var Tax: Double
    @Binding var retirementAccount: Double
    @Binding var HousingCostsPerMonth: Double
    
    var body: some View {
        VStack {
            Text("Your annual tax payment: \(Tax.formatted(.currency(code: "USD")))")
                .font(.custom("Times New Roman", size: 17))
                .padding()
            Text("Your annual 401k investment: \(retirementAccount.formatted(.currency(code: "USD")))")
                .font(.custom("Times New Roman", size: 17))
                .padding()
            Text("Your monthly housing costs: \(HousingCostsPerMonth.formatted(.currency(code: "USD")))")
                .font(.custom("Times New Roman", size: 17))
                .padding()
            Text("Your final balance is: \(savingsAfterHousing.formatted(.currency(code: "USD")))")
                .font(.custom("Times New Roman", size: 17))
        }
    }
    
    
}
