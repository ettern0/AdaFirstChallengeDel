
import PlaygroundSupport
import SwiftUI


struct ContentView: View {
   
    @ObservedObject var viewModel = StoryBoard.instance
    
    var body: some View {
        viewModel.scenarioView
    }
}
let sfed = UIImage(named: "scene1/NS1")!
// PlaygroundPage.current.setLiveView(ContentView())

