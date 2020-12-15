//
//  TextOverlay.swift
//  AppleLoadingUIKitInSwiftUI
//
//  Created by James Rochabrun on 12/14/20.
//

import SwiftUI

struct TextOverlay: View {
    
    var landmark: Landmark

    var gradient: LinearGradient {
          LinearGradient(
              gradient: Gradient(
                  colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
              startPoint: .bottom,
              endPoint: .center)
      }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

//struct TextOverlay_Previews: PreviewProvider {
//    static var previews: some View {
//        TextOverlay()
//    }
//}
