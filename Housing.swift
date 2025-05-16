import SwiftUI

struct HousingView: View {
    @Binding var moneyPost401k: Double
    @State var Housing: String = ""
    @State var HousingCostsPerMonth: Double = 0
    @State var savingsAfterHousing: Double = 0
    @State var selectedHousing: String = "Apartment"
    let housingOptions = ["Apartment", "Condo", "House", "Mansion"]
    
    var body: some View {
        Text("Select the type of resident you want to live in:")
        Picker("Housing Type", selection: $selectedHousing) {
            ForEach(housingOptions, id: \.self) { option in
                Text(option)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        Button("Calculate for housing costs per month") {
            switch selectedHousing {
            case "Condo":
                HousingCostsPerMonth = 1500
            case "Apartment":
                HousingCostsPerMonth = 1000
            case "House":
                HousingCostsPerMonth = 5000
            case "Mansion":
                HousingCostsPerMonth = 30000
            default:
                HousingCostsPerMonth = 0
            }
            savingsAfterHousing = (moneyPost401k/12) - HousingCostsPerMonth
        }
        
        
        
        VStack{
            Text("This is how much you are spending a month on your home: $\(HousingCostsPerMonth, specifier: "%.2f")")
                    .padding()
                    .font(.custom("Times New Roman", size: 21))
            
            Text("This is how much you are saving a month after all costs: $\(savingsAfterHousing, specifier: "%.2f")")
                .font(.custom("Times New Roman", size: 21))
        }
        if savingsAfterHousing <= 0 {
            Text("You don't have enough money for this type of house!")
                .font(.custom("Times New Roman", size: 21))
        }
        }
    }

