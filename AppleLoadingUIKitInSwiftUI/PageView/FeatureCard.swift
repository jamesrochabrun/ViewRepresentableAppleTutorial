//
//  FeatureCard.swift
//  AppleLoadingUIKitInSwiftUI
//
//  Created by James Rochabrun on 12/14/20.
//

import SwiftUI

struct FeatureCard: View {
    
    var landMark: Landmark
    
    var body: some View {
        landMark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landMark: try! Landmark(from: UIViewController() as! Decoder))
    }
}
