import Foundation

struct Scenario {
    
    enum Scenes {
        case Scene1, Scene2, Scene3, Scene4, TheEnd
    }
    
    var scene: Scenes = .Scene1
    
    mutating func toogleTheScene(to scene: Scenes) {
        self.scene = scene
        
    }
}
