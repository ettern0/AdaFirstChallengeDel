import Foundation
import SwiftUI
import UIKit
import SpriteKit

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

class Scene2Animation: SKScene {

    var man: SKSpriteNode!
    var viewModel = StoryBoard.instance

    override func didMove(to view: SKView) {

        man = self.childNode(withName: "SKSpriteNode") as! SKSpriteNode
        man.texture = SKTexture(imageNamed: "scene2/lovelyman")

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.run(.fadeIn(withDuration: 1))
            self.run(.wait(forDuration: 3))
            //self.viewModel.toogleTheScene()
            let transition = SKTransition.crossFade(withDuration: 1)
            let gameScene = Scene1Animation()
                gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                gameScene.size = CGSize(width: 300, height: 700)
                self.view?.presentScene(gameScene, transition: transition)
        }

    }
}
