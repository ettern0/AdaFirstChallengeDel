
import PlaygroundSupport
import SwiftUI


struct ContentView: View {
   
    @ObservedObject var viewModel = StoryBoard.instance
    
    var body: some View {
        viewModel.scenarioView
    }
}

PlaygroundPage.current.setLiveView(ContentView())

