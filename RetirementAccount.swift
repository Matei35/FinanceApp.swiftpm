import SwiftUI

struct RetirementAccountView: View {
    @State var retirementAccount: Int = 0
        var body: some View{
            TextField("Enter the ammount of money invested into your 401k", value: $retirementAccount, format: .number)
                .multilineTextAlignment(.center)
    }
}

