//
//  WebView.swift
//  H4X0R News
//
//  Created by Miguel Solans on 20/04/2022.
//

import Foundation
import SwiftUI
import WebKit

// Allows to create SwiftUI component that represents UIKit
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        // What should be displayed in WKWebView
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url);
                
                uiView.load(request);
            }
        }
    }
}
