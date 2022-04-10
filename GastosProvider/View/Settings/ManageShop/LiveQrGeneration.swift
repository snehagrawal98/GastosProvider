//
//  LiveQrGeneration.swift
//  GastosProvider
//
//  Created by ehsan sat on 3/26/22.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct LiveQrGeneration: View {
    
    @State private var qrCodeUrl: String = ""
    var qrImage = QrCodeImage()
    let paymentUrl: String = "upi://pay?pa=paytmqr281005050101mm617cyacrl1@paytm&pn=Paytm Merchant&mc=5499&mode=02&orgid=000000&paytmqr=281005050101MM617CYACRL1&sign=MEQCID0NFi3MYLXf8Yqjqwp7AqyIM7K0nlnQNBmke8X6Ou0fAiBErCzcP25K2wUYvXyt8nJG2OOqoDEAYyVkFKVjhloZYQ=="
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack {
              Button(action: {
                  presentationMode.wrappedValue.dismiss()
              }, label: {
                Image(systemName: "arrow.left")
                  .resizable()
                  .frame(width: 25, height: 20)
                  .foregroundColor(.primary)
              })

              Spacer()

              SettingsTitleView(title: "Generate QR")

              Spacer()
            }
            Spacer()
            
            Image(uiImage: qrImage.generateQrCode(from: "\(paymentUrl)&am=" + qrCodeUrl))
                .resizable()
                .frame(width: (UIScreen.screenHeight / 4), height: (UIScreen.screenHeight / 4), alignment: .center)
            
            Spacer()
            
            BrandImages()
                .frame(height: 100)
                .padding(.horizontal)
            
            Spacer()
            
            TextField("Enter Amount", text: $qrCodeUrl)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .frame(width: UIScreen.screenWidth * (234 / 375), height: UIScreen.screenHeight * (54 / 812))
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)

            Spacer()
            
        }
    }
    
}

struct QrCodeImage {
    
    let context = CIContext()
    
    func generateQrCode(from text: String) -> UIImage {
        var qrImage = UIImage(systemName: "xmark.circle") ?? UIImage()
        let data = Data(text.utf8)
        let filter = CIFilter.qrCodeGenerator()
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let image = context.createCGImage(outputImage,
                                                 from: outputImage.extent) {
                qrImage = UIImage(cgImage: image)
            }
        }
        return qrImage
    }
    
}

struct BrandImages: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Image("paytmImg")
                    .resizable()
                    .scaledToFit()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Image("phonePeImg")
                    .resizable()
                    .scaledToFit()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Image("gPayImg")
                    .resizable()
                    .scaledToFit()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Image("BHMIImg")
                    .resizable()
                    .scaledToFit()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Image("amzImg")
                    .resizable()
                    .scaledToFit()
            }

        }

    }
}

            

struct LiveQrGeneration_Previews: PreviewProvider {
    static var previews: some View {
        LiveQrGeneration()
    }
}
