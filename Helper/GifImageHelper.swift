//
//  GifImage.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/9/24.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let gifURL: String

    init(_ gifURL: String) {
        self.gifURL = gifURL
    }

    func makeUIView(context: Context) -> WKWebView {
          let webView = WKWebView()
          webView.scrollView.isScrollEnabled = false
          
          if let url = URL(string: gifURL) {
              let request = URLRequest(url: url)
              webView.load(request)
          } else {
              print("Invalid GIF URL: \(gifURL)")
          }

          return webView
      }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}
