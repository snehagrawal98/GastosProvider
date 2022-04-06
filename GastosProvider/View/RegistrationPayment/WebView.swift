//
//  WebView.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 31/03/22.
//

import Foundation
import SwiftUI
import WebKit
import UIKit
import Combine

struct PaymentView: View {
  let url: URL
  @State var showLoading = false

  var body: some View {
    VStack {
      WebView(url: url, showLoading: $showLoading)
//        .overlay(showLoading ? ProgressView("Loading...").toAnyView() : EmptyView().toAnyView())
    }
  }
}

struct WebView: UIViewRepresentable {
  let url: URL
  @Binding var showLoading: Bool

  //@StateObject var webViewCoordiantor = WebViewCoordinator()

  func makeUIView(context: Context) -> some UIView {
    let webView = WKWebView()
    webView.navigationDelegate = context.coordinator
    let request = URLRequest(url: url)
    webView.load(request)
    return webView
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {

  }

  func makeCoordinator() -> WebViewCoordinator {
    WebViewCoordinator(didStart: {
      showLoading = true
    }, didFinish: {
      showLoading = false
    })
  }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate { //, ObservableObject {
  var didStart: () -> Void
  var didFinish: () -> Void

  init(didStart: @escaping () -> Void = {}, didFinish: @escaping () -> Void = {}) {
    self.didStart = didStart
    self.didFinish = didFinish
  }

  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    didStart()
  }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
      print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish()
        let doc = webView.evaluateJavaScript("document.documentElement.innerHTML", completionHandler: { html, error in
            let a = html as? String
            print(a?.htmlStripped ?? "")
         //   print(html)
        })
        fetch()
    }
}

extension String{
    var htmlStripped : String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
    

func getHtml(_ urlString: String, completion: @escaping (String?, Error?) -> Void) {
    DispatchQueue.global(qos: .userInitiated).async(execute: {
        guard let url = URL(string: urlString) else {
            print("URLError: \(urlString) doesn't seem to be a valid URL")
            return completion(nil, URLError.init(URLError.Code.badURL))
        }

        do {
            let html = try String(contentsOf: url, encoding: .ascii)
            print("HTML: \(html)")
            return completion(html, nil)
        } catch let error {
            print("Error: \(error)")
            return completion(nil, error)
        }
    })
}
    
func fetch(){
getHtml("https://gastos-paytm-gatway.herokuapp.com/paywithpaytmresponse", completion: { html, error in
    if let e = error {
        print(e)
        // handle your error
        return
    }
    
    print(html)
    //print(html as Any)
    DispatchQueue.main.async {
        //update your UI on the main thread
    }
})
}
    
    
    
  // to watch for response
  let webView = WKWebView()
    
    
    

  // for reading back response
  //@Published var response = Response(ORDERID: "", MID: "", TXNID: "", TXNAMOUNT: "", PAYMENTMODE: "", CURRENCY: "", TXNDATE: "", STATUS: "", RESPCODE: "", RESPMSG: "", GATEWAYNAME: "", BANKTXNID: "", CHECKSUMHASH: "")

//    func fetch(url: URL) {
//    webView.evaluateJavaScript("document.toString()", completionHandler: { (result: Any?, error: Error?) in
//      if error != nil {
//        print("error \(error?.localizedDescription)")
//        return
//      }
//    //  let data = result as! String
//      print(result!)
//    })
//  }


struct Response: Identifiable, Codable {
  let banktxnid, checksumhash, currency, mid, orderid, respcode, respmsg, status, txnamount, txnid : String?
  //@DocumentID
  var id: String?

    enum CodingKeys: String, CodingKey {
        case banktxnid = "BANKTXNID"
        case checksumhash = "CHECKSUMHASH"
        case currency = "CURRENCY"
        case mid = "MID"
        case orderid = "ORDERID"
        case respcode = "RESPCODE"
        case respmsg = "RESPMSG"
        case status = "STATUS"
        case txnamount = "TXNAMOUNT"
        case txnid = "TXNID"
    }
}

extension View {
  func toAnyView() -> AnyView {
    AnyView(self)
  }
}
