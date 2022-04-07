//
//  Pending.swift
//  Gastos_user_mvp1
//
//  Created by Sai Kumar Kasireddi's MacBook on 13/01/22.
//

import SwiftUI

struct Pending: View {
  var body: some View {
    ZStack {
      GradientView(firstColor: "deepYellow", secondColor: "deepYellow")

      VStack {
        HStack {
            Button(action: {
              // back
            }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 23, height: 15, alignment: .leading)
                .foregroundColor(.white)
          })
            .padding()

          Spacer()
        }

        Spacer()

        Text("Bill Payment Pending")
          .font(.system(size: 18))
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding(.top, 1)
          .padding(.bottom, 40)

        Spacer()

        ZStack{
          Reciept(billAmount: 10000, customerName: "Krishna Kumar", shopName: "shop name", date: "02 August 2021", time: "02 : 35 : 45 PM", discount: 20, paymentStatus: false, shapeColor: Color("deepYellow"))
            .padding()

            PaymentSymbol(shapeColor: Color("lightYellow"), paymentSymbol: "exclamationmark")
            .offset(y: -0.3 * UIScreen.screenHeight)
        }

        Spacer()

        Text("Retry")
          .fontWeight(.bold)
          .foregroundColor(.white)

        Spacer()

        Button(action: {
          // go home
        }, label: {
          BottomButton(buttonText: "Jump to Home", buttonColor: "white", textColor: "5")
            .padding(.bottom, 30)
        })
      }
    }
  }
}

struct Pending_Previews: PreviewProvider {
    static var previews: some View {
      Pending()

      Pending()
      .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))

    }
}
