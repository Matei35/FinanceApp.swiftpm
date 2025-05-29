import SwiftUI

@main
struct MyApp: App {
    @State var showApp = false
    @State var showText = false
    var body: some Scene {
        WindowGroup {
            if showApp{
                ContentView()
                    
            
                 
            } else {
                ZStack {
                            Color.black.edgesIgnoringSafeArea(.all)
                            
                            Text("J.M.C Finance")
                        .font(.largeTitle)
                                .foregroundColor(.green)
                                .opacity(showText ? 1 : 0)
                                .scaleEffect(showText ? 1 : 5)
                                .blur(radius: showText ? 0 : 10)
                                .animation(.interpolatingSpring(stiffness: 120, damping: 10), value: showText)
                        }
                        .onAppear {
                            showText = true
                        }
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            showApp = true
                        
                    }
                }
            }
                
        }
    }
}

