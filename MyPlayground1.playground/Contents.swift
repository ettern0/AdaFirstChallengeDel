
import PlaygroundSupport
import SwiftUI

struct ContentView1: View {
    var body: some View {
        VStack {
            nextButton.padding()
            Image(uiImage: UIImage(named: "NS1.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 560, height: 700)
            
            
        }
    }
    
    var nextButton: some View {
        Button (action: { var x = 1 }) { Text("continue") }
    }
}


PlaygroundPage.current.setLiveView(ContentView1())
