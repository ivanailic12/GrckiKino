//
//  LiveDrawView.swift
//  GrckiKino
//
//  Created by Ivana on 10.4.24..
//

import SwiftUI
import WebKit

struct LiveDrawView: UIViewRepresentable {
    
    let webView: WKWebView
    
    init() {
        webView = WKWebView(frame: .zero)
      
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        webView.load(URLRequest(url: URL(string: Endpoint.webViewUrl)!))
    }
}
