//
//  ScanQR.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 23/02/22.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ScanQR: View {
  @Environment(\.dismiss) var dismiss
  @State var qrName = ""
  @State var upiAdress = ""
  @State var merchantId = ""
  @EnvironmentObject var qrCodes: QrCodes
  let context = CIContext()
  let filter = CIFilter.qrCodeGenerator()

    var body: some View {
      NavigationView {
        VStack {
          // Navigation bar
          HStack {
            Button(action: { dismiss() }, label: {
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

          VStack {
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
              .textFieldStyle(ScanQrTextFieldStyle())
            TextField("UPI Address", text: $upiAdress)
              .textFieldStyle(ScanQrTextFieldStyle())
            TextField("Merchant ID", text: $merchantId)
              .textFieldStyle(ScanQrTextFieldStyle())

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
    if !qrName.isEmpty && !upiAdress.isEmpty && !merchantId.isEmpty {
      let qrCode = QrCode(qrName: qrName, upiAdress: upiAdress, merchantId: merchantId, isPrimary: false)
      qrCodes.qrCodes.append(qrCode)
      dismiss()
    }
  }
}

struct ScanQR_Previews: PreviewProvider {
    static var previews: some View {
        ScanQR()
        .environmentObject(QrCodes())
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
