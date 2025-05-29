import SwiftUI
//Test
struct ChildView: View {
    @State var averageAge: Double = 0
    @State var numberOfChildren: Double = 0
    @Binding var Tax: Double
    @Binding var retirementAccount: Double
    @Binding var HousingCostsPerMonth: Double
    @Binding var savingsAfterGroceries: Double
    @Binding var GroceryCostsPerMonth: Double
    @State var childcosts: Double = 0
    @State var savingsAfterChildren: Double = 0
    
    var body: some View {
        VStack {
            Text("Disclaimer: Only if you have children from 1-5 years old.")
            Text("Enter the average age of your children.")
            TextField("Enter the average age of your children", value: $averageAge, format: .number)
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .frame(width:300)
            Text("Enter the amount of children you have")
            TextField("Enter the amount of children you have", value: $numberOfChildren, format: .number)
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .frame(width:300)
            Button("Calculate Money Post Child Care Costs") {
                Calculatechildcosts()
            }
            Text("Your monthly takehome pay after child costs: \(savingsAfterChildren.formatted(.currency(code: "USD")))")
        }
        NavigationStack{
            NavigationLink("Go to the conclusion", destination: conclusionView(savingsAfterGroceries: $savingsAfterGroceries, Tax: $Tax, retirementAccount: $retirementAccount, HousingCostsPerMonth: $HousingCostsPerMonth, childcosts: $childcosts, savingsAfterChildren: $savingsAfterChildren, GroceryCostsPerMonth: $GroceryCostsPerMonth))
        }
    }
    func Calculatechildcosts(){
        childcosts = (averageAge*numberOfChildren*950)
        savingsAfterChildren = savingsAfterGroceries - childcosts
    }
}
