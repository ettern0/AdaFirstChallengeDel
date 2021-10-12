
import Foundation
import SwiftUI
import UIKit
import SpriteKit

public struct scene1: View {

    public init() { }

    var viewModel = StoryBoard.instance

    private let scene = GameScene(size: CGSize(width: 300, height: 500))

    public var body: some View {
        VStack {
            SpriteView(scene: scene).frame(width: scene.frame.width, height: scene.frame.height) }
        .onAppear() {
            //DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { viewModel.toogleTheScene() }
        }
        .onDisappear() {  }
    }
}

class GameScene: SKScene {

    let man: SKSpriteNode = SKSpriteNode(imageNamed: "characters/person")
    let escalator: SKSpriteNode = SKSpriteNode(imageNamed: "escalator/escalator1")

    override func didMove(to view: SKView) {

        escalator.zPosition = 0
        escalator.position.x = 200
        escalator.position.y = -self.frame.minY + man.size.height / 2 - 20
        addChild(escalator)
        man.zPosition = 1
        man.position.x = 200
        man.position.y = -self.frame.minY + man.size.height / 2 - 20
        addChild(man)

        let walkFrames = escalatorAnimation(forImagePrefix: "escalator/escalator", frameCount: 2)
        let animateFrameAction: SKAction = .animate(with: walkFrames, timePerFrame: 0.6, resize: true, restore: false)
        escalator.run(.repeatForever(animateFrameAction))

        man.run(SKAction.repeatForever(SKAction.sequence([.moveTo(y: man.position.y + 10, duration: 0.5),
                                                        .moveTo(y: man.position.y - 10, duration: 0.5)])))

        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.run(.fadeIn(withDuration: 1))
        }
    }

    func escalatorAnimation(forImagePrefix baseImageName: String, frameCount count: Int) -> [SKTexture] {
        var array = [SKTexture]()
        for index in 1...count {
            let imageName = baseImageName + String(index)
            let texture = SKTexture(imageNamed: imageName)
            array.append(texture)
        }
        return array
    }
}

