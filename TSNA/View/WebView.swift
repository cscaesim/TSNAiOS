//
//  WebView.swift
//  TSNA
//
//  Created by Caine Simpson on 6/18/21.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = false
        
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        
        return WKWebView(frame: .zero,
                         configuration: config)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let myURL = url else {
            return
        }
        
        let request = URLRequest(url: myURL)
        uiView.load(request)
    }
    
}
