
import Foundation
import SwiftUI
import SpriteKit

public struct scene1: View {

    public init() { }

    var viewModel = StoryBoard.instance

    private let scene = Scene1Animation(size: CGSize(width: 375, height: 700))

    public var body: some View {
        VStack {
            SpriteView(scene: scene).frame(width: scene.frame.width, height: scene.frame.height) }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                viewModel.toogleTheScene() }}
    }
}

class Scene1Animation: SKScene {

    let man: SKSpriteNode = SKSpriteNode(imageNamed: "scene1/person")
    let escalator: SKSpriteNode = SKSpriteNode(imageNamed: "scene1/escalator/1")
    let manDialoge: SKSpriteNode = SKSpriteNode(imageNamed: "scene1/theRouteIsBuilt")
    let backGround: SKSpriteNode = SKSpriteNode(imageNamed: "scene1/background")
    var viewModel = StoryBoard.instance
//    let nextButton: SKLabelNode = SKLabelNode(text: fontNamed: "NextButton")
//    nextButton.name = "nextButton"

    override func didMove(to view: SKView) {

        escalator.zPosition = 0
        escalator.position.x = 300
        escalator.position.y = -self.frame.minY + man.size.height / 3
        escalator.scale(to: CGSize(width: escalator.size.width/2, height: escalator.size.height/2))
        addChild(escalator)

        backGround.zPosition = -1
        backGround.position.x = 200
        backGround.position.y = escalator.position.y + backGround.size.height / 6
        
        backGround.scale(to: CGSize(width: backGround.size.width/2, height: backGround.size.height/2))
        addChild(backGround)

        man.zPosition = 1
        man.position.x = 300
        man.scale(to: CGSize(width: man.size.width/2, height: man.size.height/2))
        man.position.y = -self.frame.minY + man.size.height / 2
        addChild(man)

        manDialoge.scale(to: CGSize(width: manDialoge.size.width/3, height: manDialoge.size.height/3))
        manDialoge.position = CGPoint(x: man.frame.minX - manDialoge.frame.maxY / 2, y: man.frame.maxY)
        manDialoge.alpha = 0
        addChild(manDialoge)
        manDialoge.run(SKAction.sequence([.wait(forDuration: 2), .fadeIn(withDuration: 2)]))

        let walkFrames = escalatorAnimation(forImagePrefix: "scene1/escalator/", frameCount: 2)
        let animateFrameAction: SKAction = .animate(with: walkFrames, timePerFrame: 0.6, resize: true, restore: false)
        escalator.run(.repeatForever(animateFrameAction))

        man.run(SKAction.repeatForever(SKAction.sequence([.moveTo(y: man.position.y + 10, duration: 0.5),
                                                          .moveTo(y: man.position.y - 10, duration: 0.5)])))

//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//            self.run(.fadeIn(withDuration: 1))
//            self.run(.wait(forDuration: 3))
//            self.viewModel.toogleTheScene()
////            let transition = SKTransition.crossFade(withDuration: 1)
////            if let gameScene = SKScene(fileNamed: "Scene2Animation") {
////                gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
////                gameScene.size = CGSize(width: 300, height: 700)
////                self.view?.presentScene(gameScene, transition: transition)}
//        }
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

