//
//  PageView.swift
//  AppleLoadingUIKitInSwiftUI
//
//  Created by James Rochabrun on 12/14/20.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]

    var body: some View {
        PageViewController(pages: pages)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landMark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
