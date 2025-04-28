import SwiftUI

struct RetirementAccountView: View {
    @State var retirementAccount: Double = 0
    @State var takeHomePay: Double = 0
    @State var moneyPost401k: Double =  0
    @State var age: Int = 0
        var body: some View{
            Text("Enter your age")
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
            
    }
    func CalculatePost401k (){
        moneyPost401k = takeHomePay - retirementAccount
    }
}

