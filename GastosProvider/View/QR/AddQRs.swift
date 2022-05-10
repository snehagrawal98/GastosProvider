//
//  AddQRs.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 23/02/22.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct AddQRs: View {
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
            BasicScreensTitle(title: "Add QRs")
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
//                  QrSheet(qrName: loginViewModel.qrCodes[qrCode].qrName, isPrimary: true, merchantId: loginViewModel.qrCodes[qrCode].merchantId, upiAddress: loginViewModel.qrCodes[qrCode].upiAdress)
                  QrSheet(qrName: loginViewModel.qrCodes[qrCode].qrName, isPrimary: true, upiAddress: loginViewModel.qrCodes[qrCode].upiAdress)
                    .onTapGesture {
                      primaryQr = qrCode
                      isShowingSetPrimary = true
                    }
                } else {
//                  QrSheet(qrName: loginViewModel.qrCodes[qrCode].qrName, isPrimary: false, merchantId: loginViewModel.qrCodes[qrCode].merchantId, upiAddress: loginViewModel.qrCodes[qrCode].upiAdress)
                  QrSheet(qrName: loginViewModel.qrCodes[qrCode].qrName, isPrimary: false, upiAddress: loginViewModel.qrCodes[qrCode].upiAdress)
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
        .overlay(
          ZStack {
            BasicScreensBottomBackground()
            HStack {
              if numberOfQrs == 0 {
                BasicScreensBottomLeftText(firstLine: "", secondLine: "Add QR")
                  .padding(.leading)
              } else {
                BasicScreensBottomLeftText(firstLine: "Primary QR", secondLine: primaryQrName)
                  .padding(.leading)
              }
              Spacer()
              Button(action: {
           //     loginViewModel.registerMerchantPaymentInfo()
                isShowingSetDiscount.toggle()
                  self.hideKeyboard()
              }, label: {
                BasicScreensBottomRighttText(buttonText: "Next")
              })
                .disabled(loginViewModel.qrCodes.isEmpty)
            }
          }
        .frame(height: UIScreen.screenHeight, alignment: .bottom)
        ) //: OVERLAY
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
      } //: NAV
    }
}

struct AddQRs_Previews: PreviewProvider {
    static var previews: some View {
        AddQRs()
        .environmentObject(LoginViewModel())
    }
}

// bottom button (add upi qr)
struct BottomButton: View {
  @State var buttonText: String
  @State var buttonColor: String
  @State var textColor: String
    var body: some View {
      Text(buttonText)
        .foregroundColor(Color(textColor))
        .fontWeight(.bold)
        .frame(width: 0.87 * UIScreen.screenWidth, height: 0.074 * UIScreen.screenHeight, alignment: .center)
        .background(Color(buttonColor))
        .cornerRadius(20)
    }
}

// Qr sheet
struct QrSheet: View {
  @State var qrName: String
  @State var isPrimary: Bool
  //@State var merchantId: String
  @State var upiAddress: String
  var merchantQrApp: String {
    switch qrName {
    case "PaytmMerchant":
      return "Paytm"
    case "PhonePeMerchant":
      return "Phonepe"
    default:
      return "Other UPI"
    }
  }

  let context = CIContext()
  let filter = CIFilter.qrCodeGenerator()

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 13)
        .foregroundColor(Color(merchantQrApp))

      VStack {
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .frame(width: 0.227 * UIScreen.screenWidth, height: 0.1 * UIScreen.screenHeight, alignment: .center)
          .foregroundColor(.white)
          .padding(8)

          ZStack {
            //Image(uiImage: generateQRCode(from: "\(qrName)\n\(upiAddress)\n\(merchantId)"))
            Image(uiImage: generateQRCode(from: "\(qrName)\n\(upiAddress)"))
              .resizable()
              .interpolation(.none)
              .scaledToFit()
              .frame(width: 0.144 * UIScreen.screenWidth, height: 0.066 * UIScreen.screenHeight, alignment: .center)
            Image(merchantQrApp)
              .resizable()
              .scaledToFit()
              .frame(width: 0.042 * UIScreen.screenWidth, height: 0.019 * UIScreen.screenHeight, alignment: .center)
          }
          .frame(width: 0.144 * UIScreen.screenWidth, height: 0.066 * UIScreen.screenHeight, alignment: .center)
        }

        Spacer()

        Text(merchantQrApp)
          .foregroundColor(.white)
          .font(.body.weight(.semibold))
          .padding()
      }

      if isPrimary {
        VStack {
          HStack {
            Text("Primary")
              .font(.caption.weight(.semibold))
              .foregroundColor(Color("textGreen"))
              .padding(6)
              .frame(width: 0.16 * UIScreen.screenWidth, height: 0.03 * UIScreen.screenHeight)
              .background(
                RoundedRectangle(cornerRadius: 0)
                  .cornerRadius(13, corners: [.topLeft, .bottomRight])
                  .foregroundColor(Color("qrCodePrimary"))
              )
            Spacer()
          }
          Spacer()
        }
      }
    }
    .frame(width: 0.28 * UIScreen.screenWidth, height: 0.197 * UIScreen.screenHeight, alignment: .center)
  }

  // function to generate qrcode
  func generateQRCode(from string: String) -> UIImage {
    filter.message = Data(string.utf8)

    if let outputImage = filter.outputImage {
      if let cgImg = context.createCGImage(outputImage, from: outputImage.extent) {
        return UIImage(cgImage: cgImg)
      }
    }
    return UIImage(systemName: "xmark.circle") ?? UIImage()
  }
}
