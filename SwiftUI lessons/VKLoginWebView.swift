//
//  VKLoginWebView.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 12.12.2021.
//

import SwiftUI
import WebKit

struct VKLoginWebView: UIViewRepresentable {
    
    @Environment(\.presentationMode) var mode
    
    var navigationDelegate = WebViewNavigationDelegate()
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        navigationDelegate.onDismiss = { isAuthorized in
            if isAuthorized {
                mode.wrappedValue.dismiss()
            }
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }
    
    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "7802232"),
            URLQueryItem(name: "scope", value: "270342"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.130")
        ]
        return components.url.map { URLRequest(url: $0) }
    }
}

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    
    var onDismiss: ((Bool) -> Void)?
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
                  decisionHandler(.allow)
                  return
              }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let _ = Int(userIdString) else {
            decisionHandler(.allow)
            return
        }
        
        UserDefaults.standard.set(token, forKey: "token")
        NotificationCenter.default.post(name: NSNotification.Name("vkTokenSaved"), object: self)
        UserDefaults.standard.set(userIdString, forKey: "userID")
        NotificationCenter.default.post(name: NSNotification.Name("userIDSaved"), object: self)
        
        UserDefaults.standard.set(true, forKey: "isAuthorized")
        
        onDismiss?(true)
        
        decisionHandler(.cancel)
    }
}
