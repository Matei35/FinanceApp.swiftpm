import SwiftUI

struct GroceryView: View {
    @State var numberOfPeople: Int = 0
    @State var GroceryCostsPerMonth: Double = 0
    @Binding var savingsAfterHousing: Double
    @Binding var Tax: Double
    @Binding var retirementAccount: Double
    @Binding var HousingCostsPerMonth: Double
    @State var savingsAfterGroceries: Double = 0

    var body: some View {
        let costPerPerson = 350
        let totalGroceryCost = numberOfPeople * costPerPerson
        let remainingAfterGroceries = savingsAfterHousing - Double(totalGroceryCost)

        VStack {
            TextField("How many people are in your family?", value: $numberOfPeople, format: .number)
                .padding()
                .keyboardType(.numberPad)

            if numberOfPeople < 0 {
                Text("Sorry! You can't have a negative number of people!")
                    .font(.custom("Times New Roman", size: 12))
            } else if numberOfPeople == 0 {
                Text("You need more people than this!")
                    .font(.custom("Times New Roman", size: 12))
            } else {
                Text("This is how much money you will spend on groceries per month: \(totalGroceryCost)")
                    .font(.custom("Times New Roman", size: 12))
            }

            Text("You have \(remainingAfterGroceries, specifier: "%.2f") left to spend on other things!")
                .font(.custom("Times New Roman", size: 12))

            NavigationStack {
                NavigationLink(
                    "Go to the final page",
                    destination: conclusionView(savingsAfterGroceries: $savingsAfterGroceries, Tax: $Tax, retirementAccount: $retirementAccount, HousingCostsPerMonth: $HousingCostsPerMonth, totalGroceryCost: $GroceryCostsPerMonth)
                )
                .padding()
            }
        }
        .onChange(of: numberOfPeople) { newValue in
            if newValue >= 0 {
                GroceryCostsPerMonth = Double(newValue * costPerPerson)
                savingsAfterGroceries = savingsAfterHousing - Double(GroceryCostsPerMonth)
            }
        }
    }
}
