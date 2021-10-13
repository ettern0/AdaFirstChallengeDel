import Foundation

struct Scenario {
    
    enum Scenes: Int {
        case scene1 = 0, scene2 = 1, scene3 = 2, scene4 = 3, theEnd = 4
    }

   var scene: Scenes = .scene1
    
    mutating func toogleTheScene(to scene: Scenes) {
        self.scene = scene
        
    }
}
