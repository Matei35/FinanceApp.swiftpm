import SwiftUI

struct RetirementAccountView: View {
    @State var retirementAccount: Double = 0
    @State var takeHomePay: Double = 0
    @State var moneyPost401k: Double =  0
    @State var age: Double = 0
    @State var amount: Int = 0
    @State var output: String = ""
    @State var monkey: String = ""
        var body: some View{
            Text("Enter your age")
            TextField("", value: $age, format: .number)
                .multilineTextAlignment(.center)
            Button("Find out Maximum Limit for 401k"){
                if age <= 49 {
                    amount = 23500
                }
                if age >= 50 && age <= 59 {
                    amount = 31000
                }
                if age <= 49 {
                    output = ("The maximum amount you can put in your 401k is \(amount.formatted(.currency(code: "USD")))")
                }
                if age >= 50 && age <= 59 {
                    output = "The maximum amount you can put in your 401k is \(amount.formatted(.currency(code: "USD")))"
                }
                if age >= 60 && age <= 63 {
                    amount = 34750
                }
                if age >= 60  {
                    output = "The maximum amount you can put in your 401k is \(amount.formatted(.currency(code: "USD")))"
                }
                if age >= 64 {
                    amount = 31000
                }
                if age >= 64 {
                    output = "The maximum amount you can put in your 401k is \(amount.formatted(.currency(code: "USD")))"
                }
            }
            Text("\(output)")
            Text("Enter your yearly salary post tax")
            TextField("", value: $takeHomePay, format: .number)
                .multilineTextAlignment(.center)
            Text("Enter money for 401k")
            TextField("Money for 401k", value: $retirementAccount, format: .number)
                .multilineTextAlignment(.center)
            Button {
                CalculatePost401k()
                
            } label: {
                ZStack{
                    Circle()
                        .frame(width:90, height:90)
                        .foregroundStyle(.yellow)
                    Text("Calculate")
                        .foregroundStyle(.blue)
                   
                }
            }
            Text(String("Money left after 401k: $\(moneyPost401k)"))
            Text("\(monkey)")
            
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


