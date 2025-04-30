import SwiftUI

struct RetirementAccountView: View {
    @State var retirementAccount: Double = 0
    @State var takeHomePay: Double = 0
    @State var moneyPost401k: Double =  0
    @State var age: Double = 0
    @State var output: String = ""
    @State var Background: Bool = false
        var body: some View{
            VStack{
                Text("Enter your age")
                TextField("", value: $age, format: .number)
                    .multilineTextAlignment(.center)
                Button("Find out Maximum Limit for 401k"){
                    if age <= 49 {
                        output = "The maximum amount you can put in your 401k is $23,500"
                    }
                    if age == 50 {
                        output = "The maximum amount you can put in your 401k is $31,000"
                    }
                    if age == 51 {
                        output = "The maximum amount you can put in your 401k is $31,000"
                    }
                    if age == 52 {
                        output = "The maximum amount you can put in your 401k is $31,000"
                    }
                    if age == 53 {
                        output = "The maximum amount you can put in your 401k is $31,000"
                    }
                    if age == 54 {
                        output = "The maximum amount you can put in your 401k is $31,000"
                    }
                    if age == 55 {
                        output = "The maximum amount you can put in your 401k is $31,000"
                    }
                    if age == 56 {
                        output = "The maximum amount you can put in your 401k is $31,000"
                    }
                    if age == 57 {
                        output = "The maximum amount you can put in your 401k is $31,000"
                    }
                    if age == 58 {
                        output = "The maximum amount you can put in your 401k is $31,000"
                    }
                    if age == 59 {
                        output = "The maximum amount you can put in your 401k is $31,000"
                    }
                    if age >= 60 {
                        output = "The maximum amount you can put in your 401k is $34,750"
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
                
                Toggle("Dark Mode",isOn: $Background)
                    .padding(.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Background ? .black.opacity(0.9): .white)
            .foregroundStyle(Background ? .white: .black)
    }
    func CalculatePost401k (){
        moneyPost401k = takeHomePay - retirementAccount
    }
}

