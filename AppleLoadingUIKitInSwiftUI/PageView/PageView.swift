//
//  PageView.swift
//  AppleLoadingUIKitInSwiftUI
//
//  Created by James Rochabrun on 12/14/20.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landMark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
