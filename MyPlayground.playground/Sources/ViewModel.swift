import Foundation
import SwiftUI

public class StoryBoard: ObservableObject {
    
    static public let instance = StoryBoard()
    @Published private(set) var model: Scenario = Scenario()
    
    public var scenarioView: AnyView {
        switch model.scene {
        case .scene1:
           return AnyView(scene1().body)
        case .scene2:
            return AnyView(scene2().body)
        case .scene3:
            return AnyView(scene1().body)
        default:
            return AnyView(scene1().body)
        }
    }
    
    func toogleTheScene() {
        switch model.scene {
        case .scene1:
            model.toogleTheScene(to: .scene2)
        case .scene2:
            model.toogleTheScene(to: .scene1)
        case .scene3:
            model.toogleTheScene(to: .scene4)
        default:
            model.toogleTheScene(to: .theEnd)
        }
    }
}
