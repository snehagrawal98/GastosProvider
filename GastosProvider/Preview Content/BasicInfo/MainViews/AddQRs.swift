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
    @State var isQrSheetTapped = false
    @State var primaryQr = 0
    var gridLayout: [GridItem] {
      return Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
    }
    @StateObject var qrCodes = QrCodes()
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
          if qrCodes.qrCodes.count == 0 {
            Spacer()
            Text("No QR Added")
              .foregroundColor(.gray)
            Spacer()
          } else {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
              ForEach(0..<qrCodes.qrCodes.count, id: \.self) { qrCode in
                QrSheet(qrName: qrCodes.qrCodes[qrCode].qrName, isPrimary: qrCodes.qrCodes[qrCode].isPrimary, merchantId: qrCodes.qrCodes[qrCode].merchantId, upiAddress: qrCodes.qrCodes[qrCode].upiAdress)
                  .onTapGesture {
                    primaryQr = qrCode
                  }
              }
            })
          }
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
                BasicScreensBottomLeftText(firstLine: "Primary QR", secondLine: "PhonePe")
                  .padding(.leading)
              }
              Spacer()
              Button(action: { isShowingSetPrimary.toggle() }, label: {
                BasicScreensBottomRighttText(buttonText: "Next")
              })
            }
          }
        .frame(height: UIScreen.screenHeight, alignment: .bottom)
        ) //: OVERLAY
        .fullScreenCover(isPresented: $isShowingSetPrimary, content: {
          SetAQrPrimary(primaryQr: primaryQr)
        })
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
      } //: NAV
      .environmentObject(qrCodes)
    }
}

struct AddQRs_Previews: PreviewProvider {
    static var previews: some View {
        AddQRs()
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
  @State var merchantId: String
  @State var upiAddress: String

  let context = CIContext()
  let filter = CIFilter.qrCodeGenerator()

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 13)
        .foregroundColor(Color(qrName))

      VStack {
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .frame(width: 0.227 * UIScreen.screenWidth, height: 0.1 * UIScreen.screenHeight, alignment: .center)
          .foregroundColor(.white)
          .padding(8)

          ZStack {
            Image(uiImage: generateQRCode(from: "\(qrName)\n\(upiAddress)\n\(merchantId)"))
              .resizable()
              .interpolation(.none)
              .scaledToFit()
              .frame(width: 0.144 * UIScreen.screenWidth, height: 0.066 * UIScreen.screenHeight, alignment: .center)
            Image(qrName)
              .resizable()
              .scaledToFit()
              .frame(width: 0.042 * UIScreen.screenWidth, height: 0.019 * UIScreen.screenHeight, alignment: .center)
          }
          .frame(width: 0.144 * UIScreen.screenWidth, height: 0.066 * UIScreen.screenHeight, alignment: .center)
        }

        Spacer()

        Text(qrName)
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

// Set a QR Primary
struct SetAQrPrimary: View {
  @Environment(\.dismiss) var dismiss
  let primaryQr: Int
  @EnvironmentObject var qrCodes: QrCodes
  var body: some View {
    NavigationView {
      VStack {
        Spacer()
        QrSheet(qrName: qrCodes.qrCodes[primaryQr].qrName, isPrimary: true, merchantId: qrCodes.qrCodes[primaryQr].merchantId, upiAddress: qrCodes.qrCodes[primaryQr].upiAdress)
        Spacer()

        Text("you’ll be receiving all of your payments on the bank account linked with this QR.")
          .font(.headline.weight(.medium))
          .multilineTextAlignment(.center)

        Spacer()
        Button(action: {
          qrCodes.qrCodes[primaryQr].qrName = "PhonePe"
          print(qrCodes.qrCodes[primaryQr].isPrimary)
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

// data model for qr codes
struct QrCode: Hashable {
  var qrName: String
  var upiAdress: String
  var merchantId: String
  var isPrimary: Bool
}

class QrCodes: ObservableObject {
  @Published var qrCodes = [QrCode]()
}
