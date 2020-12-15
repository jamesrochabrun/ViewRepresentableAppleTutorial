//
//  ViewController.swift
//  AppleLoadingUIKitInSwiftUI
//
//  Created by James Rochabrun on 12/14/20.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let pages = ModelData().features.map { FeatureCard(landMark: $0) }
        let pageView = PageView(pages: pages)
        let hostView = HostView<PageView<FeatureCard>>(parent: self, view: pageView)
        view.addSubview(hostView)
        hostView.fillSuperview()
    }
}
