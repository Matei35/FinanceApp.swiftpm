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
    //test
    let groceryOptions = ["Low", "Medium", "High"]
    let baseCostPerPerson = 350.0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("J.M.C. Finance App")
                    .font(.largeTitle)
                    .foregroundStyle(.green)
                    .padding(60)
                
                TextField("How many people are in your family?", value: $numberOfPeople, format: .number)
                    .padding()
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                
                
                if numberOfPeople < 0 {
                    Text("Sorry! You can't have a negative number of people!")
                        .font(.custom("Times New Roman", size: 18))
                        .foregroundColor(.red)
                } else if numberOfPeople == 0 {
                    Text("You need more people than this!")
                        .font(.custom("Times New Roman", size: 18))
                        .foregroundColor(.orange)
                } else {
                    if numberOfPeople >= 10 {
                        Text("Holy moly! You have a lot people! Maybe you should consider buying groceries in bulk!")
                            .font(.custom("Times New Roman", size: 12))
                    }
                    
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
                    
                    Text("This is how much money you will spend on groceries per month: $\(GroceryCostsPerMonth, specifier: "%.2f")")
                        .font(.custom("Times New Roman", size: 18))
                    
                    Text("You have $\(savingsAfterGroceries, specifier: "%.2f") left to spend on other things!")
                        .font(.custom("Times New Roman", size: 18))
                    
                    NavigationLink(
                        "Go to child care costs",
                        destination: ChildView(
                            Tax: $Tax,
                            retirementAccount: $retirementAccount,
                            HousingCostsPerMonth: $HousingCostsPerMonth,
                            savingsAfterGroceries: $savingsAfterGroceries,
                            GroceryCostsPerMonth: $GroceryCostsPerMonth
                        )
                    )
                    .padding()
                }
            }
            .padding()
        }
    }
}
