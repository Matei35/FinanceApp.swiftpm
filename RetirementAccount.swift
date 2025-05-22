import SwiftUI

struct RetirementAccountView: View {
    
    @State var retirementAccount: Double = 0
    @State var housing: Double = 0
    @Binding var takeHomePay: Double
    @State var moneyPost401k: Double =  0
    @State var age: Double = 0
    @State var amount: Int = 0
    @State var output: String = ""
    @State var monkey: String = ""
    @State var Background: Bool = false
    @Binding var Tax: Double
    var body: some View {
        NavigationStack {
        VStack{
            Text("Enter your age")
                .foregroundStyle(Background ? .white: .black)
                .font(.custom("Times New Roman", size: 20))
            TextField("", value: $age, format: .number)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .frame(width:300)
                .foregroundStyle(.black)
            Button("Find out Maximum Limit for Roth IRA"){
                if age <= 49 {
                    amount = 23500
                    output = ("The maximum amount you can put in your Roth IRA is \(amount.formatted(.currency(code: "USD")))")
                }
                    
                if age >= 50 && age <= 59 {
                    amount = 31000
                    output = "The maximum amount you can put in your Roth IRA is \(amount.formatted(.currency(code: "USD")))"
                }
                if age >= 60 && age <= 63 {
                    amount = 34750
                    output = "The maximum amount you can put in your Roth IRA is \(amount.formatted(.currency(code: "USD")))"
                }
                
                if age >= 64 {
                    amount = 31000
                    output = "The maximum amount you can put in your Roth IRA is \(amount.formatted(.currency(code: "USD")))"
                }
            }
            
            Text("\(output)")
                .foregroundStyle(Background ? .white: .black)
            Text("Enter your yearly salary post tax")
                .font(.custom("Times New Roman", size: 21))
                .foregroundStyle(Background ? .white: .black)
            TextField("", value: $takeHomePay, format: .number)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .frame(width:300)
                .foregroundStyle(.black)
            
            Text("Enter money for Roth IRA")
                .font(.custom("Times New Roman", size: 21))
                .foregroundStyle(Background ? .white: .black)
            
            TextField("Money for Roth IRA", value: $retirementAccount, format: .number)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .frame(width:300)
                .foregroundStyle(.black)
                
                
                
                Button {
                    CalculatePost401k()
                    
                } label: {
                    ZStack{
                        Circle()
                            .frame(width:90, height:90)
                            .foregroundStyle(.green)
                        Text("Calculate")
                            .foregroundStyle(.blue)
                    }
                }
                Text(String("Money left after 401k: $\(moneyPost401k)"))
                .font(.custom("Times New Roman", size: 21))
                    .foregroundStyle(Background ? .white: .black)
                NavigationLink("Go to Housing Costs") {
                    HousingView(moneyPost401k: $moneyPost401k, Tax: $Tax, retirementAccount: $retirementAccount)
                }
            }
            
            Text("\(monkey)")
                .foregroundStyle(Background ? .white: .black)
            
            Spacer()
            
            Toggle("Dark Mode",isOn: $Background)
                .padding(.bottom)
                .foregroundStyle(Background ? .white: .black)
                    }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Background ? .black.opacity(0.9): .white)
               
            
    }
    func CalculatePost401k (){
        moneyPost401k = takeHomePay - retirementAccount
        guard retirementAccount <= Double(amount) else {
                moneyPost401k = 0
                monkey = " You cannot contribute more than your 401k limit of \(amount.formatted(.currency(code: "USD")))"
                return
            }

            guard retirementAccount <= takeHomePay else {
                moneyPost401k = 0
                monkey = " You cannot contribute more than your take-home pay!"
                return
            }

            moneyPost401k = takeHomePay - retirementAccount
            monkey = ""
        }
}
