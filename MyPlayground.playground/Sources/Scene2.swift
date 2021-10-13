import Foundation
import SwiftUI
import UIKit
import SpriteKit

public struct scene2: View {
    
    public init() { }
   
    var viewModel = StoryBoard.instance
    
    public var body: some View {
        VStack {
            SpriteView(scene: SKScene(fileNamed: "Scene2Animation")!)
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                viewModel.toogleTheScene() }}
    }
    
    var nextButton: some View {
        Button (action: { viewModel.toogleTheScene() }) { Text("continue2") }
    }
}
