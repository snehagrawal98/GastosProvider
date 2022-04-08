//
//  Success.swift
//  Gastos_user_mvp1
//
//  Created by Sai Kumar Kasireddi's MacBook on 12/01/22.
//

import SwiftUI

struct Success: View {
    var billAmount: Double
    @State var rating: Int?

    var body: some View {
      ZStack {
        GradientView(firstColor: "deepGreen", secondColor: "deepGreen")

        VStack {

//          Spacer()

//          HStack {
//              Button(action: {
//                // back
//              }, label: {
//                Image(systemName: "arrow.left")
//                  .resizable()
//                  .frame(width: 23, height: 15, alignment: .leading)
//                  .foregroundColor(.white)
//            })
//              .padding()
              
//
//            Spacer()
//          }

          Spacer()

          Text("Welcome to \n GASTOS PROVIDER CLUB")
            .font(.headline.weight(.bold))
            .foregroundColor(.white)
            .padding(.top, 1)
            .padding(.bottom, 40)
            
          Spacer()

          ZStack{
            Reciept(billAmount: billAmount, shapeColor: Color("deepGreen"))
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
                ContentView()
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
      Success(billAmount: 599)
    }
}
