import SwiftUI

struct ContentView: View {
    @State var takeHomePay: Double = 0
    @State var salary1: Double = 0
    @State var Tax: Double = 0
    @State var totalSavings: Int = 0
    @State var retirementAccount: Int!
    @State var Background: Bool = false
    
    var body: some View {
        NavigationStack{
        VStack{
                Text("J.M.C. Finance App")
                    .font(.largeTitle)
                    .foregroundStyle(.green)
                    .padding(50)
                    
            Text("Enter your annual salary!")
                .foregroundStyle(Background ? .white: .black)
                .font(.custom("Times New Roman", size: 21))
                TextField("Enter your salary!", value: $salary1, format: .number)
                .foregroundStyle(.black)

                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width:300)
                
            Button {
                    calculateTax()
                } label: {
                    ZStack{
                        Circle()
                            .frame(width:90, height:90)
                            .foregroundStyle(.green)
                        Text("Calculate")
                            .foregroundStyle(.blue)
                            .foregroundStyle(Background ? .white: .black)
                    }
                }
                
                
                
                
                Text("Your annual takehome pay after tax: \(takeHomePay.formatted(.currency(code: "USD")))")
                    .foregroundStyle(Background ? .white: .black)
                    .font(.custom("Times New Roman", size: 17))
                
                
            Text(String("Your Monthly Take Home Pay: $\(takeHomePay/12)"))
                    .foregroundStyle(Background ? .white: .black)
                    .font(.custom("Times New Roman", size: 17))
                
                NavigationLink("Go to 401k calculator!"){
                    RetirementAccountView(takeHomePay: $takeHomePay, Tax: $Tax)
                }
                
                Spacer()
            
                Toggle("Dark Mode",isOn: $Background)
            .padding(.bottom,450)
            .foregroundStyle(Background ? .white: .black)
            
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Background ? .black.opacity(0.9): .white)
        
        
        
        }
    }

        func calculateTax() {
            if salary1 <= 11061 && salary1 >= 0 {
                Tax = 0.1 * salary1
            } else if salary1 <= 47150 {
                let tier1 = 0.1 * 11061
                let tier2 = 0.12 * (salary1 - 11061)
                Tax = tier1 + tier2
            } else if salary1 <= 100525 {
                let tier1 = 0.1 * 11061
                let tier2 = 0.12 * 36089
                let tier3 = 0.22 * (salary1 - 47150)
                Tax = tier1 + tier2 + tier3
            } else if salary1 <= 191950 {
                let tier1 = 0.1 * 11061
                let tier2 = 0.12 * 36089
                let tier3 = 0.22 * 53375
                let tier4 = 0.24 * (salary1 - 100525)
                Tax = tier1 + tier2 + tier3 + tier4
            } else if salary1 <= 243725 {
                let tier1 = 0.1 * 11061
                let tier2 = 0.12 * 36089
                let tier3 = 0.22 * 53375
                let tier4 = 0.24 * 91425
                let tier5 = 0.32 * (salary1 - 191950)
                Tax = tier1 + tier2 + tier3 + tier4 + tier5
            } else if salary1 <= 609350 {
                let tier1 = 0.1 * 11061
                let tier2 = 0.12 * 36089
                let tier3 = 0.22 * 53375
                let tier4 = 0.24 * 91425
                let tier5 = 0.32 * 51776
                let tier6 = 0.35 * (salary1 - 243726)
                Tax = tier1 + tier2 + tier3 + tier4 + tier5 + tier6
            } else {
                let tier1 = 0.1 * 11061
                let tier2 = 0.12 * 36089
                let tier3 = 0.22 * 53375
                let tier4 = 0.24 * 91425
                let tier5 = 0.32 * 51776
                let tier6 = 0.35 * 365624
                let tier7 = 0.37 * (salary1 - 609350)
                Tax = tier1 + tier2 + tier3 + tier4 + tier5 + tier6 + tier7
            }
            takeHomePay = (salary1 - Tax)
            
        }
    }

