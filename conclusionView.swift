import SwiftUI

struct conclusionView: View {
    @Binding var savingsAfterGroceries: Double
    @Binding var Tax: Double
    @Binding var retirementAccount: Double
    @Binding var HousingCostsPerMonth: Double
    @Binding var childcosts: Double
    @Binding var savingsAfterChildren: Double
    @Binding var GroceryCostsPerMonth: Double
    //Test
    var body: some View {
        VStack {
            Text("J.M.C. Finance App")
                .font(.largeTitle)
                .foregroundStyle(.green)
                .padding(50)
            
            Text("Your annual tax payment: \(Tax.formatted(.currency(code: "USD")))")
                .font(.custom("Times New Roman", size: 17))
                .padding()
            Text("Your annual 401k investment: \(retirementAccount.formatted(.currency(code: "USD")))")
                .font(.custom("Times New Roman", size: 17))
                .padding()
            Text("Your monthly housing costs: \(HousingCostsPerMonth.formatted(.currency(code: "USD")))")
                .font(.custom("Times New Roman", size: 17))
                .padding()
            Text("Your monthly grocery costs: \(GroceryCostsPerMonth.formatted(.currency(code: "USD")))")
                .font(.custom("Times New Roman", size: 17))
                .padding()
            Text("Your monthly child care costs: \(childcosts.formatted(.currency(code: "USD")))")
                .font(.custom("Times New Roman", size: 17))
                .padding()
            Text("Your final balance is: \(savingsAfterChildren.formatted(.currency(code: "USD")))")
                .font(.custom("Times New Roman", size: 17))
        }
    }
    
    
}
