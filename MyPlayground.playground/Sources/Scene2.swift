import Foundation
import SwiftUI
import UIKit

public struct scene2: View {
    
    public init() { }
   
    var viewModel = StoryBoard.instance
    
    public var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "scena2")!)
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
