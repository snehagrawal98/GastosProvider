//
//  Reciept.swift
//  Gastos_user_mvp1
//
//  Created by Sai Kumar Kasireddi's MacBook on 12/01/22.
//

import SwiftUI

struct Reciept: View {
  @State var billAmount: Double
//  @State var customerName: String
//  @State var shopName: String
//  @State var date: String
//  @State var time: String
//  @State var discount: Double
//  @State var paymentStatus: Bool
  @State var shapeColor: Color
  let rupeeSymbol = "\u{20B9}"

  var savings: Double {
      if billAmount == 599 {return 0} else if billAmount == 299 {return 300}
  }

//  var coins: Double {
//    return (savings/10)
//  }
//
//  var amountPaid: Double {
//    return (billAmount - savings)
//  }

    var body: some View {
      ZStack {
        ZStack {
          Group {
            Rectangle()
              .frame(width: 0.84 * UIScreen.screenWidth, height: 0.59 * UIScreen.screenHeight, alignment: .center)
              .cornerRadius(20)
            .foregroundColor(.white)
          }

          VStack(alignment: .center) {
            Text("Payment Total")
              .recieptLightStyle()
              .padding(.top, 0.04 * UIScreen.screenHeight)

            Text("\(rupeeSymbol) \(billAmount, specifier: "%g")")
              .font(.title.weight(.bold))
              .foregroundColor(.black)
              .padding(.top, 1)
              .padding(.bottom, 2)
              
              Text("Activated")
                  .font(.title.weight(.bold))
                  .foregroundColor(.black)
                  .padding(.top, 1)
                  .padding(.bottom, 2)

            VStack(spacing: 0.022 * UIScreen.screenHeight) {
//              HStack {
//                Text("Billed To")
//                  .recieptLightStyle()
//
//                Spacer()
//
//                Text(customerName)
//                  .recieptDarkStyle()
//              }
//
//              HStack {
//                Text("at")
//                  .recieptLightStyle()
//
//                Spacer()
//
//                Text(shopName)
//                  .recieptDarkStyle()
//              }

              HStack {
                  Text(Date.now, format: .dateTime.day().month().year())
                  .recieptLightStyle()

                Spacer()

                Text(date)
                  .recieptDarkStyle()
              }

              HStack {
                  Text(Date.now, format: .dateTime.hour().minute().second())
                  .recieptLightStyle()

                Spacer()

                Text(time)
                  .recieptDarkStyle()
              }

              Divider()

              HStack {
                Text("Service Charged")
                  .recieptLightStyle()

                Spacer()

                Text("\(rupeeSymbol) \(billAmount, specifier: "%g")")
                  .recieptDarkStyle()
              }

              HStack {
                Text("Savings")
                  .recieptLightStyle()

                Spacer()

                Text("- \(rupeeSymbol) \(savings, specifier: "%g")")
                  .font(.subheadline.weight(.bold))
                  .foregroundColor(.green)
              }

//              if paymentStatus {
//                HStack {
//                  Text("Coins Earned")
//                    .recieptLightStyle()
//
//                  Spacer()
//
//                  Text("+ \(rupeeSymbol) \(coins, specifier: "%g")")
//                    .font(.subheadline.weight(.bold))
//                    .foregroundColor(.orange)
//                }
//              }

//              HStack {
//                Text("Amount Paid")
//                  .recieptDarkStyle()
//
//                Spacer()
//
//                Text("\(rupeeSymbol) \(amountPaid, specifier: "%g")")
//                  .font(.subheadline.weight(.bold))
//                  .foregroundColor(.blue)
//              }
            }
          }
          .frame(width: 0.73 * UIScreen.screenWidth, height: 0.47 * UIScreen.screenHeight, alignment: .center)

          // Bottom Circles
          VStack {
            Spacer()

            HStack(alignment: .center, spacing: 12) {
              ForEach(1..<10) { _ in
                //Circle()
                Ellipse()
                  .foregroundColor(shapeColor)
                  .frame(width: 0.053 * UIScreen.screenWidth, height: 0.026 * UIScreen.screenHeight, alignment: .center)
              }
            } //: HSTACK
          } //: VSTACK
          .frame(width: 0.84 * UIScreen.screenWidth, height: 0.61 * UIScreen.screenHeight, alignment: .center)
        }
      }
    }
}

struct Reciept_Previews: PreviewProvider {
    static var previews: some View {
      Reciept(billAmount: 10000, shapeColor: Color("circle"))
        .preferredColorScheme(.dark)
    }
}

// Payment Symbol View
struct PaymentSymbol: View {
  @State var shapeColor: Color
    @State var paymentSymbol: String

    var body: some View {
      ZStack {
        Circle()
          .foregroundColor(shapeColor)
          .frame(width: 0.202 * UIScreen.screenWidth, height: 0.202 * UIScreen.screenWidth, alignment: .center)
        Circle()
          .foregroundColor(shapeColor.opacity(0.6))
          .frame(width: 0.24 * UIScreen.screenWidth, height: 0.24 * UIScreen.screenWidth, alignment: .center)

        Image(systemName: paymentSymbol)
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32, alignment: .center)
          .foregroundColor(.white)
        }
    }
}
