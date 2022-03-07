//
//  SetAQrPrimary.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 06/03/22.
//

import SwiftUI

struct SetAQrPrimary: View {
  @Environment(\.dismiss) var dismiss
  var primaryQr: Int
  @EnvironmentObject var loginViewModel: LoginViewModel

  var body: some View {
    NavigationView {
      VStack {
        Spacer()
        QrSheet(qrName: loginViewModel.qrCodes[primaryQr].qrName, isPrimary: true, merchantId: loginViewModel.qrCodes[primaryQr].merchantId, upiAddress: loginViewModel.qrCodes[primaryQr].upiAdress)
        Spacer()

        Text("you’ll be receiving all of your payments on the bank account linked with this QR.")
          .font(.headline.weight(.medium))
          .multilineTextAlignment(.center)

        Spacer()
        Button(action: {
          let qrRange = 0..<loginViewModel.qrCodes.count
          for qrCode in qrRange {
            loginViewModel.qrCodes[qrCode].isPrimary = false
          }
          loginViewModel.qrCodes[primaryQr].isPrimary = true
          dismiss()
        }, label: {
          Text("Set Primary")
            .font(.headline.weight(.semibold))
            .padding(8)
            .foregroundColor(.white)
            .frame(width: 0.47 * UIScreen.screenWidth, height: 0.045 * UIScreen.screenHeight)
            .background(
              RoundedRectangle(cornerRadius: 13)
                .foregroundColor(Color("textGreen"))
            )
        })
        Spacer()
      }
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
      .frame(width: 0.677 * UIScreen.screenWidth, height: 0.474 * UIScreen.screenHeight)
      .background(Color.white)
      .cornerRadius(30)
      .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
      .background(.ultraThinMaterial)
      .ignoresSafeArea(.all)
    }
  }
}
