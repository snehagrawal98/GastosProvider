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
    @StateObject var manageQrViewModel = ManageQRViewModel()
  @EnvironmentObject var loginViewModel: LoginViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
          VStack {
              
            // Navigation bar
            HStack {
              Button(action: {
                  presentationMode.wrappedValue.dismiss()
                  
              }, label: {
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
            if manageQrViewModel.qrCodes.count == 0 {
              Spacer()
              Text("No QR Added")
                .foregroundColor(.gray)
              Spacer()
            } else {
              LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                ForEach(0..<manageQrViewModel.qrCodes.count, id: \.self) { qrCode in
                  if manageQrViewModel.qrCodes[qrCode].isPrimary {
                    QrSheet(qrName: manageQrViewModel.qrCodes[qrCode].qrName, isPrimary: true, merchantId: manageQrViewModel.qrCodes[qrCode].merchantId, upiAddress: manageQrViewModel.qrCodes[qrCode].upiAdress)
                      .onTapGesture {
                        primaryQr = qrCode
                        isShowingSetPrimary = true
                      }
                  } else {
                    QrSheet(qrName: manageQrViewModel.qrCodes[qrCode].qrName, isPrimary: false, merchantId: manageQrViewModel.qrCodes[qrCode].merchantId, upiAddress: manageQrViewModel.qrCodes[qrCode].upiAdress)
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
          .environmentObject(manageQrViewModel)
          .navigationBarHidden(true)
          .navigationBarBackButtonHidden(true)
          .onAppear(perform: {
            manageQrViewModel.readPaymentInfo(uid: loginViewModel.uid)
            let qrRange = 0..<manageQrViewModel.qrCodes.count
            for qrCode in qrRange {
              if manageQrViewModel.qrCodes[qrCode].isPrimary {
                primaryQrName = manageQrViewModel.qrCodes[qrCode].qrName
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



