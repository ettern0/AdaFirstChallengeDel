import Foundation
import SwiftUI
import Cocoa

public struct Scene2: View {
    
    public init() { }
   
    var viewModel = storyBoard.instance
    
    public var body: some View {
        VStack {
            Image(nsImage: NSImage(named: "scena2")!)
                .resizable()
                .scaledToFit()
                .frame(width: 560, height: 700)
            nextButton
        }
    }
    
    var nextButton: some View {
        Button (action: { viewModel.toogleTheScene() }) { Text("continue2") }
    }
}
