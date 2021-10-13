
import PlaygroundSupport
import SwiftUI
import SpriteKit


struct ContentView: View {
   
    @ObservedObject var viewModel = StoryBoard.instance
    
    var body: some View {
        viewModel.scenarioView
    }
}

PlaygroundPage.current.setLiveView(ContentView())

