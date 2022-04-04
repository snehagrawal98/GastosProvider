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

struct PaymentView: View {
  let url: URL
  @State var showLoading = false

  var body: some View {
    VStack {
      WebView(url: url, showLoading: $showLoading)
        .overlay(showLoading ? ProgressView("Loading...").toAnyView() : EmptyView().toAnyView())
    }
  }
}

struct WebView: UIViewRepresentable {
  let url: URL
  @Binding var showLoading: Bool

  @StateObject var webViewCoordiantor = WebViewCoordinator()

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

class WebViewCoordinator: NSObject, WKNavigationDelegate, ObservableObject {
  var didStart: () -> Void
  var didFinish: () -> Void

  init(didStart: @escaping () -> Void = {}, didFinish: @escaping () -> Void = {}) {
    self.didStart = didStart
    self.didFinish = didFinish
  }

  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    didStart()
  }

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    didFinish()
  }

  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    print(error.localizedDescription)
  }

  // to watch for response
  let webView = WKWebView()

  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
      if let host = navigationAction.request.url {
        if host.absoluteString.contains("paywithpaytmresponse") {
          decisionHandler(.allow)
          print("\n\n\n hello \(host) \n\n\n")
          self.fetch(url: host)
          return
        }
      }

      decisionHandler(.allow)
  }

  // for reading back response
  //@Published var response = Response(ORDERID: "", MID: "", TXNID: "", TXNAMOUNT: "", PAYMENTMODE: "", CURRENCY: "", TXNDATE: "", STATUS: "", RESPCODE: "", RESPMSG: "", GATEWAYNAME: "", BANKTXNID: "", CHECKSUMHASH: "")

  func fetch(url: URL) {
//    guard let url = URL(string: "https://gastos-paytm-gatway.herokuapp.com/paywithpaytmresponse") else {
//      print("wrong url")
//      return
//    }
    let urlRequest = URLRequest(url: url)

    URLSession.shared.dataTask(with: urlRequest) { (data,response,error)  in
        if error != nil{
            print(error?.localizedDescription as Any)
        } else {
            if let data = data{
                do {
                   // let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary
                    let response = try JSONDecoder().decode(Response.self, from: data)
                  print("This is the response \(response)")
                  //////
                  //print(response)
                  ////
                  DispatchQueue.main.async {
                    //self.response = response
                  }
                } catch {
                  print("Couldn't decode data \(error.localizedDescription)")
                }
            }
            }
        }
//      guard let data = data1, error1 == nil else {
//        print("Couldn't fetch data from server")
//        return
//      }
      
    
    .resume()
  }

}

//struct Response: Codable {
//  var BANKTXNID: String?
//  var CHECKSUMHASH: String
//  var CURRENCY: String
//
//  var MID: String
//  var ORDERID: String
//  var RESPCODE: String
//  var RESPMSG: String
//  var STATUS: String
//  var TXNAMOUNT: String
//  //var PAYMENTMODE: String?
//  //var TXNDATE: String?
//  //var GATEWAYNAME: String?
//  var TXNID: String
//}

struct Response: Codable{
    var ORDERID: String?
    var MID: String?
    var TXNID: String?
    var TXNAMOUNT: String?
    var PAYMENTMODE: String?
    var CURRENCY: String?
    var TXNDATE: String?
    var STATUS: String?
    var RESPCODE: String?
    var RESPMSG: String?
    var GATEWAYNAME: String?
    var BANKTXNID: String?
    var CHECKSUMHASH: String?
    
    enum CodingKeys: String, CodingKey{
        case ORDERID = "ORDERID"
        case MID = "MID"
        case TXNID = "TXNID"
        case TXNAMOUNT = "TXNAMOUNT"
        case PAYMENTMODE = "PAYMENTMODE"
        case CURRENCY = "CURRENCY"
        case TXNDATE = "TXNDATE"
        case STATUS = "STATUS"
        case RESPCODE = "RESPCODE"
        case RESPMSG = "RESPMSG"
        case GATEWAYNAME = "GATEWAYNAME"
        case BANKTXNID = "BANKTXNID"
        case CHECKSUMHASH = "CHECKSUMHASH"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ORDERID = try values.decodeIfPresent(String.self, forKey: .ORDERID)
        MID = try values.decodeIfPresent(String.self, forKey: .MID)
        TXNID = try values.decodeIfPresent(String.self, forKey: .TXNID)
        TXNAMOUNT = try values.decodeIfPresent(String.self, forKey: .TXNAMOUNT)
        PAYMENTMODE = try values.decodeIfPresent(String.self, forKey: .PAYMENTMODE)
        CURRENCY = try values.decodeIfPresent(String.self, forKey: .CURRENCY)
        TXNDATE = try values.decodeIfPresent(String.self, forKey: .TXNDATE)
        STATUS = try values.decodeIfPresent(String.self, forKey: .STATUS)
        RESPCODE = try values.decodeIfPresent(String.self, forKey: .RESPCODE)
        RESPMSG = try values.decodeIfPresent(String.self, forKey: .RESPMSG)
        GATEWAYNAME = try values.decodeIfPresent(String.self, forKey: .GATEWAYNAME)
        BANKTXNID = try values.decodeIfPresent(String.self, forKey: .BANKTXNID)
        CHECKSUMHASH = try values.decodeIfPresent(String.self, forKey: .CHECKSUMHASH)
    }

}

//struct Response: Identifiable, Codable {
//  let banktxnid, checksumhash, currency, mid, orderid, respcode, respmsg, status, txnamount : String?
//  //@DocumentID
//  var id: String?
//
//    enum CodingKeys: String, CodingKey {
//        case banktxnid = "BANKTXNID"
//        case checksumhash = "CHECKSUMHASH"
//        case currency = "CURRENCY"
//        case mid = "MID"
//        case orderid = "ORDERID"
//        case respcode = "RESPCODE"
//        case respmsg = "RESPMSG"
//        case status = "STATUS"
//        case txnamount = "TXNAMOUNT"
//    //    case txnid = "TXNID"
//    }
//}

extension View {
  func toAnyView() -> AnyView {
    AnyView(self)
  }
}



