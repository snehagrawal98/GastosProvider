//
//  QrScanView.swift
//  GastosApplication
//
//  Created by Sai Kumar Kasireddi's MacBook on 04/03/22.
//

import SwiftUI
import CodeScanner

struct QrScanView: View {
  @State var isShowingScanner = false
  @State var scannedCode = ""
  @State var numOrName = ""

  @Environment(\.dismiss) var dismiss

    var body: some View {
      NavigationView {
        VStack {
          // nav bar
          HStack {
            Button(action: { dismiss() }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .padding()
            })
            Spacer()
            Text("Make New Payment")
              .font(.title2.weight(.semibold))
              .foregroundColor(.white)
            Spacer()
            Spacer()
          }
          .padding(.vertical)

          Text("Scanned code: \(scannedCode)")
            .font(.title3)
            .foregroundColor(.white)

          Spacer()
          VStack {
            CodeScannerView(codeTypes: [.qr], simulatedData: "hello\nhow r u", completion: handleScan)
          }
          .frame(width: 0.86 * UIScreen.screenWidth, height: 0.55 * UIScreen.screenHeight)
          .background(.white.opacity(1))
          .cornerRadius(10)

          Spacer()
          ZStack {
            Rectangle()
              .frame(width: UIScreen.screenWidth, height: 0.2 * UIScreen.screenHeight)
              .foregroundColor(Color("qrBottom"))
              .ignoresSafeArea(.all)

            TextField("Enter Number Or Name", text: $numOrName)
              .padding()
              .frame(width: 0.778 * UIScreen.screenWidth, height: 0.058 * UIScreen.screenHeight)
              .background(
                RoundedRectangle(cornerRadius: 20)
                  .foregroundColor(.white)
              )
          }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        .background(Color("deepGreen"))
      }
    }

  // func to handle scan
  func handleScan(result: Result<ScanResult, ScanError>) {
    isShowingScanner = false

    switch result {
    case .success(let result):
      scannedCode = result.string // .components(separatedBy: "\n")
      guard !scannedCode.isEmpty else { return }

    case .failure(let error):
      print("Scanning failed: \(error.localizedDescription)")
    }
  }

}

struct QrScanView_Previews: PreviewProvider {
    static var previews: some View {
        QrScanView()
    }
}
