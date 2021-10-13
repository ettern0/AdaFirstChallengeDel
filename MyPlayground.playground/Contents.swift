
import PlaygroundSupport
import SwiftUI
import SpriteKit


struct ContentView: View {
   
    @ObservedObject var viewModel = StoryBoard.instance
    
    var body: some View {
        viewModel.scenarioView
    }
}

let gameScene = SKScene(fileNamed: "SpriteScene/Scene2Animation")

PlaygroundPage.current.setLiveView(ContentView())

