import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        AssistantWebView()
            .ignoresSafeArea()
    }
}

struct AssistantWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.isOpaque = false
        webView.backgroundColor = UIColor(red: 16/255, green: 17/255, blue: 20/255, alpha: 1)
        webView.scrollView.backgroundColor = webView.backgroundColor
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        } else {
            webView.loadHTMLString("<html><body style='background:#101114;color:white;font:17px -apple-system;padding:30px'>Не найден index.html</body></html>", baseURL: nil)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
