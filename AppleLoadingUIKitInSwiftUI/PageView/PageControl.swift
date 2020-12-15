//
//  PageControl.swift
//  AppleLoadingUIKitInSwiftUI
//
//  Created by James Rochabrun on 12/15/20.
//

import SwiftUI

struct PageControl {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

extension PageControl: UIViewRepresentable {

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControl(numberOfPages: 0, currentPage: .constant(0))
    }
}
