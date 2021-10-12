import SwiftUI
import UIKit

public struct Scene4: View {
    @State var scale4 = 0.75
    
   public var body: some View {
        ZStack {
            ZStack {
                
                Image(uiImage: UIImage(named: "NS4.png")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 560, height: 700)
            }
            
            Image(uiImage: UIImage(named: "Heart.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                .padding()
                .scaleEffect(scale4)
                .animation(
                    .linear(duration: 2),
                    value: scale4
                )
                .offset(x: -35)
            
        }
        Button {
            scale4 = 20
        } label: {
            Text("It's wedding tiiiiime bitches 💒")
                .padding(10)
                .foregroundColor(.yellow)
                .background(Color.black)
                .cornerRadius(10)
        }
    }
}



