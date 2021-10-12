import Foundation
import SwiftUI

public class storyBoard: ObservableObject {
    
    static public let instance = storyBoard()
    @Published private (set) var model: Scenario = Scenario()
    
    public var scenarioView: AnyView {
        switch model.scene {
        case .Scene1:
           return AnyView(Scene1().body)
        case .Scene2:
            return AnyView(Scene2().body)
        case .Scene3:
            return AnyView(Scene1().body)
        case .Scene4:
            return AnyView(Scene4().body)
        default:
            return AnyView(Scene1().body)
        }
    }
    
    func toogleTheScene() {
        switch model.scene {
        case .Scene1:
            model.toogleTheScene(to: .Scene4)
        case .Scene2:
            model.toogleTheScene(to: .Scene1)
        case .Scene3:
            model.toogleTheScene(to: .Scene2)
        default:
            model.toogleTheScene(to: .TheEnd)
        }
    }
}
