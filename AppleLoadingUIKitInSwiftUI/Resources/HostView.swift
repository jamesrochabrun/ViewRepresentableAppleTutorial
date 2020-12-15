//
//  HostView.swift
//  AppleLoadingUIKitInSwiftUI
//
//  Created by James Rochabrun on 12/15/20.
//

import SwiftUI

final class HostView<V: View>: UIView {
    
    private weak var controller: UIHostingController<V>?
    
    init(parent: UIViewController, view: V) {
        super.init(frame: .zero)
        host(view, in: parent)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func host(_ view: V, in parent: UIViewController) {
    
        defer { controller?.view.invalidateIntrinsicContentSize() }
        
        if let controller = controller {
            controller.rootView = view
        } else {
            let hostingController = UIHostingController(rootView: view)
            controller = hostingController
            parent.addChild(hostingController)
            addSubview(hostingController.view)
            hostingController.view.fillSuperview()
            hostingController.didMove(toParent: parent)
        }
    }
}

extension UIView {
    @objc public func fillSuperview(withinSafeArea: Bool = false, padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = superview else { return }
        
        let superviewTopAnchor = withinSafeArea ? superview.safeAreaLayoutGuide.topAnchor : superview.topAnchor
        let superviewLeadingAnchor = withinSafeArea ? superview.safeAreaLayoutGuide.leadingAnchor : superview.leadingAnchor
        let superviewTrailingAnchor = withinSafeArea ? superview.safeAreaLayoutGuide.trailingAnchor : superview.trailingAnchor
        let superviewBottomAnchor = withinSafeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor

        // Apple Doc: Typically, using this method is more efficient than activating each constraint individually.
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top),
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left),
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right),
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom)
        ])
        
    }
}

