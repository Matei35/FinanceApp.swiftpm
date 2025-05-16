import SwiftUI

@main
struct MyApp: App {
    @State var showApp = false
    var body: some Scene {
        WindowGroup {
            if showApp{
                    ContentView()
                    
            
                 
            } else {
                Text("J.M.C Finance")
                    .font(.largeTitle)
                    .foregroundStyle(.green)
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                            showApp = true
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
            }
                
        }
    }
}

