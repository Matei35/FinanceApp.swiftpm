import SwiftUI

struct HousingView: View {
    @State var Housing: String = ""
    @State var HousingCostsPerMonth: Double
    @State var savingsAfterHousing: Double
    var body: some View {
        TextField("Enter the type of resident you want to live in", text: $Housing)
            .multilineTextAlignment(.center)
        Button("Calculate for housing costs per month") {
            if Housing == "condo" {
                HousingCostsPerMonth = 1500
            }
            if Housing == "Condo" {
                HousingCostsPerMonth = 1500
            }
            if Housing == "Apartment" {
                HousingCostsPerMonth = 1000
            }
            if Housing == "apartment" {
                HousingCostsPerMonth = 1000
            }
            if Housing == "Single House" {
                HousingCostsPerMonth = 5000
            }
            if Housing == "single house" {
                HousingCostsPerMonth = 5000
            }
            if Housing == "single house" {
                HousingCostsPerMonth = 5000
            }
            if Housing == "Single house" {
                HousingCostsPerMonth = 5000
            }
            if Housing == "Mansion" {
                HousingCostsPerMonth = 30000
            }
            if Housing == "mansion" {
                HousingCostsPerMonth = 30000
            }
            Text("This is how much you are spending a month on your home: \(HousingCostsPerMonth)")
            savingsAfterHousing = takeHomePay - HousingCostsPerMonth
            Text("This is how much you are saving a month after all costs: $\(savingsAfterHousing)")
        }
    }
}
