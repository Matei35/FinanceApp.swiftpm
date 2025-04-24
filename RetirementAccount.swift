import SwiftUI

struct RetirementAccountView: View {
    @State var retirementAccount: Int = 0
        var body: some View{
            
            TextField("Money for 401k", value: $retirementAccount, format: .number)
                .multilineTextAlignment(.center)
    }
}

