//
//  ScanQR.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 23/02/22.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import CodeScanner

struct ScanQR: View {
  @Environment(\.dismiss) var dismiss
  @State var qrName = ""
  @State var upiAdress = ""
  @State var merchantId = ""
  @State var scannedCode = ""
  @State var isShowingScanner = false

  @EnvironmentObject var loginViewModel: LoginViewModel
  let context = CIContext()
  let filter = CIFilter.qrCodeGenerator()

    var body: some View {
      NavigationView {
        VStack {
          // Navigation bar
          HStack {
            Button(action: {
                dismiss()
            }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 20, height: 20)
                .padding()
                .foregroundColor(.black)
            })
            Spacer()
            BasicScreensTitle(title: "Scan QR")
            Spacer()
            Spacer()
          } //: HSTACK
          .padding(.bottom)

//          Text("Scanned code: \(scannedCode)")
//            .font(.title3)
//            .foregroundColor(.black)

          ZStack {
            CodeScannerView(codeTypes: [.qr], simulatedData: "upi://pay?pa=BHARATPE90718988349@yesbankltd&pn=BharatPe%20Merchant&cu=INR&tn=Verified%20Merchant", completion: handleScan)


            Image("ScanSymbol")
              .resizable()
              .scaledToFit()
              .frame(width: 0.498 * UIScreen.screenWidth, height: 0.234 * UIScreen.screenHeight)
          }
          .frame(width: UIScreen.screenWidth,height: 0.5 * UIScreen.screenHeight)
          .background(Color.gray)

          Spacer()

          // QR details
          VStack {
            TextField("QR Name", text: $qrName)
              .textFieldStyle(ScanQrTextFieldStyle()).onTapGesture {
                  self.hideKeyboard()
              }
            TextField("UPI Address", text: $upiAdress)
              .textFieldStyle(ScanQrTextFieldStyle()).onTapGesture {
                  self.hideKeyboard()
              }
//            TextField("Merchant ID", text: $merchantId)
//              .textFieldStyle(ScanQrTextFieldStyle()).onTapGesture {
//                  self.hideKeyboard()
//              }

            Spacer()

            Button(action: {
              self.didEnterAllData()
              }, label: {
              BottomButton(buttonText: "Add", buttonColor: "textGreen", textColor: "white")
            })
          }
          .padding(.top, 8)
        } //: VSTACK
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
      }
    }

  // checking if all data is recieved
  func didEnterAllData() {
    if !qrName.isEmpty && !upiAdress.isEmpty {
      //let qrCode = QrCode(qrName: qrName, upiAdress: upiAdress, merchantId: merchantId, isPrimary: false)
      let qrCode = QrCode(qrName: qrName, upiAdress: upiAdress, isPrimary: false)
      loginViewModel.qrCodes.append(qrCode)
      dismiss()
    }
  }

  // func to handle scan
  func handleScan(result: Result<ScanResult, ScanError>) {
    //isShowingScanner = false

    switch result {
    case .success(let result):
      scannedCode = result.string // .components(separatedBy: "\n")
      upiAdress = scannedCode.slice(from: "pa=", to: "&") ?? ""
      let qrNameWith20 = scannedCode.slice(from: "pn=", to: "&") ?? ""
      qrName = qrNameWith20.strip20s
      guard !scannedCode.isEmpty else { return }

    case .failure(let error):
      print("Scanning failed: \(error.localizedDescription)")
    }
  }
}

struct ScanQR_Previews: PreviewProvider {
    static var previews: some View {
        ScanQR()
        .environmentObject(LoginViewModel())
    }
}

struct ScanQrTextFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .font(.headline.weight(.regular))
      .foregroundColor(Color("basicDetailsText"))
      .padding(12)
      .frame(width: 0.843 * UIScreen.screenWidth, height: 0.043 * UIScreen.screenHeight, alignment: .center)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .stroke(Color("textGreen").opacity(0.2), lineWidth: 1)
      )
  }
}

extension String {
  func slice(from: String, to: String) -> String? {
      return (range(of: from)?.upperBound).flatMap { substringFrom in
          (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
              String(self[substringFrom..<substringTo])
          }
      }
  }

  var strip20s: String {
    return self.replacingOccurrences(of: "%20", with: "", options: .regularExpression, range: nil)
  }
}
