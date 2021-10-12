
import Foundation
import SwiftUI
import UIKit
import SpriteKit

public struct scene1: View {

    public init() { }

    var viewModel = StoryBoard.instance
    private let scene = SKScene(fileNamed: "GameScene")!

    public var body: some View {
        SpriteView(scene: scene)
            .frame(width: scene.frame.width, height: scene.frame.height)
    }

    
    var nextButton: some View {
        Button (action: { viewModel.toogleTheScene() }) { Text("continue1") }
    }
}
