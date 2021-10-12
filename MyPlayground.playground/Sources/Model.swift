import Foundation

struct Scenario {
    enum Scenes {
        case scene1, scene2, scene3, scene4, theEnd
    }

    var scene: Scenes = .scene3
    
    mutating func toogleTheScene(to scene: Scenes) {
        self.scene = scene
        
    }
}
