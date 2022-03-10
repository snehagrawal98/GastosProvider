//
//  ManageQR.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 10/03/22.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ManageQR: View {
    @State var numberOfQrs: Int = 1
    @State var isShowingSetPrimary = false
    @State var isShowingSetDiscount = false
    @State var primaryQr = 0
    @State var primaryQrName = ""
    var gridLayout: [GridItem] {
      return Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
    }
    @EnvironmentObject var loginViewModel: LoginViewModel
    @Environment(\.dismiss) var dismiss

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
              BasicScreensTitle(title: "Manage QRs")
              Spacer()
              Spacer()
            } //: HSTACK
            .padding(.bottom)

            NavigationLink(destination:
                  ScanQR()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true), label: {
              BottomButton(buttonText: "Add UPI QR", buttonColor: "textGreen", textColor: "white")
            })

            // showing all QRs
            if loginViewModel.qrCodes.count == 0 {
              Spacer()
              Text("No QR Added")
                .foregroundColor(.gray)
              Spacer()
            } else {
              LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                ForEach(0..<loginViewModel.qrCodes.count, id: \.self) { qrCode in
                  if loginViewModel.qrCodes[qrCode].isPrimary {
                    QrSheet(qrName: loginViewModel.qrCodes[qrCode].qrName, isPrimary: true, merchantId: loginViewModel.qrCodes[qrCode].merchantId, upiAddress: loginViewModel.qrCodes[qrCode].upiAdress)
                      .onTapGesture {
                        primaryQr = qrCode
                        isShowingSetPrimary = true
                      }
                  } else {
                    QrSheet(qrName: loginViewModel.qrCodes[qrCode].qrName, isPrimary: false, merchantId: loginViewModel.qrCodes[qrCode].merchantId, upiAddress: loginViewModel.qrCodes[qrCode].upiAdress)
                      .onTapGesture {
                        primaryQr = qrCode
                        isShowingSetPrimary = true
                      }
                  }
                }
              })
            }

            // To show SetAQrPrimary view
            NavigationLink(isActive: $isShowingSetPrimary, destination: {
              SetAQrPrimary(primaryQr: primaryQr)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }, label: {
              Text("")
                .hidden()
            })

            Spacer()
          } //: VSTACK
           //: OVERLAY
          .navigationBarHidden(true)
          .navigationBarBackButtonHidden(true)
          .onAppear(perform: {
            let qrRange = 0..<loginViewModel.qrCodes.count
            for qrCode in qrRange {
              if loginViewModel.qrCodes[qrCode].isPrimary {
                primaryQrName = loginViewModel.qrCodes[qrCode].qrName
              }
            }
          })
        }
    }
}

struct ManageQR_Previews: PreviewProvider {
    static var previews: some View {
        ManageQR().environmentObject(LoginViewModel())
    }
}



