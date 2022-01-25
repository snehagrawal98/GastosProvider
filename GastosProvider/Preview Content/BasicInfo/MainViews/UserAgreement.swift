//
//  UserAgreement.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 23/01/22.
//

import SwiftUI

struct UserAgreement: View {
    @State var agreed = false

    var body: some View {
      ScrollView(.vertical) {

        // Navigation Bar
        HStack {
          Button(action: {
            // back
          }, label: {
            Image(systemName: "arrow.left")
              .resizable()
              .frame(width: 14, height: 14, alignment: .leading)
              .foregroundColor(.primary)
          })

          Spacer()

          BasicScreensTitle(title: "User Agreement")
          Spacer()
        } //: HSTACK
        .padding()

        Text("""
        Any user signing up on this will be considered as GASTOS PROVIDER and he/she agrees to offer a commission Percentage, given text field in shop profile, according to his/her own comfort of business so that we can use it as a discount on every billed amount of the GASTOS customer.

        We hereby declare that the payment of the billed amount after discounting will be directly reflected in the PROVIDER’s account as of which we don’t keep any money in-between the transaction.
        The received amount will be only X% less (X = value of percentage commission given by the provider) as of the bill created by the PROVIDER.
        The PROVIDER’s UPI address and payment receivable information will be asked and will not disclosed or shared to anyone or anywhere.
        The information which will be visible in our main application and before the users are mentioned below along with their purpose:
        •  Images – All images posted by the provider will be shown in his profile page in the user application (their cover photo of the shop and other images related to their businesses)
        •  Owner Name – At Shop profile page so that user can know about the Provider
        •  Shop Address – At shop profile to help user to get clear idea about the shop address and can reach there
        •  Shop Co-ordinates – At shop profile so that user can directly navigate to the shop location saved by the Provider
        •  Commission Percentage – At shop profile in user app as well as in other pages inside user application so that user can see how much discount the shop is giving, as we are not keeping money in between the transaction so the entered Commission value will be depending on their business and how much they want to offer and grow.
        •  Contact Number – At shop profile page in GASTOS user application so that a communication can be done between the both for services related to their business or order delivery (if they provide) or order pickup (if they provide)

        GASTOS is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it
        """)
          .padding()
          .background(Color.white.cornerRadius(5))
          .padding(.horizontal)
          .shadow(radius: 3)
      }
      .overlay(bottomPart
                .frame(height: UIScreen.screenHeight, alignment: .bottom))
    }

  // Bottom Part
  var bottomPart: some View {
    ZStack {
      Rectangle()
        .frame(width: UIScreen.screenWidth, height: 0.17 * UIScreen.screenHeight)
        .foregroundColor(Color("deepGreen"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .ignoresSafeArea(.all)

      HStack {
        HStack{
          Button(action: {
            agreed.toggle()
          }, label: {
            if agreed {
              Image(systemName: "checkmark")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(.black)
                .padding(4)
                .background(Color.white)
                .cornerRadius(3)

            } else {
            Rectangle()
              .frame(width: 23, height: 23, alignment: .center)
              .foregroundColor(.white)
              .cornerRadius(3)
            }
          })

          Text("I have read all the terms & conditions")
            .font(.subheadline.weight(.regular))
            .foregroundColor(Color.white.opacity(0.6))
        }
        .padding(.leading)

        Spacer()

        Button(action: {
          // agree
        }, label: {
          Text("I Agree")
            .font(.body.weight(.bold))
            .foregroundColor(Color("textGreen"))
            .frame(width: 0.31 * UIScreen.screenWidth, height: 0.065 * UIScreen.screenHeight, alignment: .center)
            .background(Color.white)
            .cornerRadius(15)
            .padding(.trailing)
        })

      }
    }
  }
}

struct UserAgreement_Previews: PreviewProvider {
    static var previews: some View {
        UserAgreement()
    }
}
