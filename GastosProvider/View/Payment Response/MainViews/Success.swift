//
//  Success.swift
//  Gastos_user_mvp1
//
//  Created by Sai Kumar Kasireddi's MacBook on 12/01/22.
//

import SwiftUI

struct Success: View {
    @State var rating: Int?

    var body: some View {
      ZStack {
        GradientView(firstColor: "deepGreen", secondColor: "deepGreen")

        VStack {

          Spacer()

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

          Text("Bill Paid Successfully")
            .font(.headline.weight(.bold))
            .foregroundColor(.white)
            .padding(.top, 1)
            .padding(.bottom, 40)

          Spacer()

          ZStack{
            Reciept(billAmount: 10000, customerName: "Krishna Kumar", shopName: "shop name", date: "02 August 2021", time: "02 : 35 : 45 PM", discount: 20, paymentStatus: true, shapeColor: Color("deepGreen"))
              .padding()

            PaymentSymbol(shapeColor: Color("lightGreen"), paymentSymbol: "checkmark")
              .offset(y: -0.3 * UIScreen.screenHeight)
          }

          Spacer()

          Group {
            Rating(productRating: $rating)
              .padding(.bottom)

            Spacer()

            Button(action: {
              // go home
            }, label: {
              BottomButton(buttonText: "Jump to Home", buttonColor: "white", textColor: "5")
                .padding(.bottom, 30)
            })
          }

          Spacer()
        }
      }
    }
}

struct Success_Previews: PreviewProvider {
    static var previews: some View {
      Success()
    }
}
