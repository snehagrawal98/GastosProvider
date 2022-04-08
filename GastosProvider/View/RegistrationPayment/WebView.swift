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
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  @State var showLoading = false
  @StateObject var webViewCoordiantor = WebViewCoordinator()
  @EnvironmentObject var registrationPaymentViewModel: RegistrationPaymentViewModel
  @EnvironmentObject var loginViewModel: LoginViewModel
  @State private var showGreenPage: Bool?
    let response = returnResponseToPaymentView()


  var body: some View {
    VStack {
        ZStack {
            
            WebView(url: url, showLoading: $showLoading)
            
            if showGreenPage == true {
              
              //  Success(billAmount: response.TXNAMOUNT)
                Success_Response(amount: response.TXNAMOUNT!, active: "Activated")
                
            } else if showGreenPage == false {
                
              //  Failed(billAmount: response.TXNAMOUNT)
                Failure_Response(amount: response.TXNAMOUNT!, active: "Failed")
                
            } else {
                Rectangle()
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
                    .opacity(0)
            }

        }
            
//        .overlay(showLoading ? ProgressView("Loading...").toAnyView() : EmptyView().toAnyView())
    }
    .onReceive(timer) { _ in
      if returnIsDecodedToPaymentView() {
        if response.STATUS == "TXN_SUCCESS" {
            showGreenPage = true
          registrationPaymentViewModel.uploadPaymentData(response: response, uid: "ub3Cb1sdBaaTKww6kDSzh1QDPjc2")//loginViewModel.uid)
        } else if response.STATUS == "TXN_FAILURE" {
            showGreenPage = false
        }
        timer.upstream.connect().cancel()
      }
    }
  }
}

struct WebView: UIViewRepresentable {
  let url: URL
  @Binding var showLoading: Bool

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

class WebViewCoordinator: NSObject, ObservableObject, WKNavigationDelegate {
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
    let url = webView.url?.absoluteString ?? ""
    if url.contains("paywithpaytmresponse") {
      let _: Void = webView.evaluateJavaScript("document.documentElement.innerHTML", completionHandler: { html, error in
        if error != nil {
          print(error?.localizedDescription ?? "")
          return
        }
        let htmlAsString = html as! String
        let paymentResponse = htmlAsString.htmlStripped
        print(paymentResponse)

        let responseInJson = """
        \(paymentResponse)
        """.data(using: .utf8)!

        self.decodeResponse(response: responseInJson)
        print(html)
      })
    }
  }

  func decodeResponse(response: Data) {
    let decodedResponse = try? JSONDecoder().decode(Response.self, from: response)
    paymentResponse = decodedResponse ?? paymentResponse
    decoded = true
  }
}

extension String{
  var htmlStripped : String{
    return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
  }

  var optionalStripped: String {
    return self.replacingOccurrences(of: "Optional()", with: "", options: .regularExpression, range: nil)
  }
}

extension View {
  func toAnyView() -> AnyView {
    AnyView(self)
  }
}

var paymentResponse: Response = Response(ORDERID: " ", MID: " ", TXNID: " ", TXNAMOUNT: " ", PAYMENTMODE: " ", CURRENCY: " ", TXNDATE: " ", STATUS: " ", RESPCODE: " ", RESPMSG: " ", GATEWAYNAME: " ", BANKTXNID: " ", CHECKSUMHASH: " ")
var decoded = false

func returnIsDecodedToPaymentView() -> Bool {
  return decoded
}

func returnResponseToPaymentView() -> Response {
  return paymentResponse
}

//func getHtml(_ urlString: String, completion: @escaping (String?, Error?) -> Void) {
//    DispatchQueue.global(qos: .userInitiated).async(execute: {
//        guard let url = URL(string: urlString) else {
//            //print("URLError: \(urlString) doesn't seem to be a valid URL")
//            return completion(nil, URLError.init(URLError.Code.badURL))
//        }
//
//        do {
//            let html = try String(contentsOf: url, encoding: .ascii)
//            //print("HTML: \(html)")
//            return completion(html, nil)
//        } catch let error {
//            //print("Error: \(error)")
//            return completion(nil, error)
//        }
//    })
//}
    
//func fetch(){
//getHtml("https://gastos-paytm-gatway.herokuapp.com/paywithpaytmresponse", completion: { html, error in
//    if let e = error {
//        //print(e)
//        // handle your error
//        return
//    }
//    
//   // print(html)
//    //print(html as Any)
//    DispatchQueue.main.async {
//        //update your UI on the main thread
//    }
//})
//}
