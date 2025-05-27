import SwiftUI

struct GroceryView: View {
    @State var numberOfPeople: Int = 0
    @State var GroceryCostsPerMonth: Double = 0
    @Binding var savingsAfterHousing: Double
    @Binding var Tax: Double
    @Binding var retirementAccount: Double
    @Binding var HousingCostsPerMonth: Double
    @State var savingsAfterGroceries: Double = 0
    @State var selectedGrocerySpending: String = "Low"
    
    let groceryOptions = ["Low", "Medium", "High"]
    
    var baseCostPerPerson = 350.0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Calculating your grocery costs per month")
                    .font(.custom("Times New Roman", size: 25))
                    .padding()
                
                TextField("How many people are in your family?", value: $numberOfPeople, format: .number)
                    .padding()
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                
                Text("Select the level of grocery spending")
                    .font(.custom("Times New Roman", size: 18))
                
                Picker("Grocery Spending", selection: $selectedGrocerySpending) {
                    ForEach(groceryOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Button("Calculate grocery costs") {
                    let baseCost = Double(numberOfPeople) * baseCostPerPerson
                    switch selectedGrocerySpending {
                        case "Low":
                            GroceryCostsPerMonth = baseCost * 0.75
                        case "Medium":
                            GroceryCostsPerMonth = baseCost
                        case "High":
                            GroceryCostsPerMonth = baseCost * 1.25
                        default:
                            GroceryCostsPerMonth = baseCost
                    }
                    savingsAfterGroceries = savingsAfterHousing - GroceryCostsPerMonth
                }
                .padding()
                .buttonStyle(.borderedProminent)

                if numberOfPeople < 0 {
                    Text("Sorry! You can't have a negative number of people!")
                        .font(.custom("Times New Roman", size: 18))
                        .foregroundColor(.red)
                } else if numberOfPeople == 0 {
                    Text("You need more people than this!")
                        .font(.custom("Times New Roman", size: 18))
                        .foregroundColor(.orange)
                } else {
                    Text("This is how much money you will spend on groceries per month: $\(GroceryCostsPerMonth, specifier: "%.2f")")
                        .font(.custom("Times New Roman", size: 18))
                    
                    Text("You have $\(savingsAfterGroceries, specifier: "%.2f") left to spend on other things!")
                        .font(.custom("Times New Roman", size: 18))
                }

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
            if numberOfPeople >= 10{
                Text("Holy moly! You have a lot people! Maybe you should consider buying groceries in bulk!")
                    .font(.custom("Times New Roman", size: 12))
            }

            Text("You have \(remainingAfterGroceries, specifier: "%.2f") left to spend on other things!")
                .font(.custom("Times New Roman", size: 12))

            NavigationStack {
                NavigationLink(
                    "Go to the final page",
                    destination: conclusionView(
                        savingsAfterGroceries: $savingsAfterGroceries,
                        Tax: $Tax,
                        retirementAccount: $retirementAccount,
                        HousingCostsPerMonth: $HousingCostsPerMonth,
                        totalGroceryCost: $GroceryCostsPerMonth
                    )
                )
                .padding()
            }
            .padding()
        }
    }
}
