//
//  AboutUs.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 19/01/22.
//

import SwiftUI

struct AboutUs: View {
    var body: some View {
      ScrollView(.vertical) {

        // Navigation Bar
        HStack {
          Button(action: {
            // back
          }, label: {
            Image(systemName: "arrow.left")
              .resizable()
              .frame(width: 24, height: 24)
              .foregroundColor(.primary)
          })

          Spacer()

          SettingsTitleView(title: "About Us")

          Spacer()
        } //: HSTACK
        .padding()

        Text("""
             Welcome to GASTOS, your number one solution of your daily payments. We're dedicated to providing you with the best of the services, with a focus on dependability. customer service, and your benefits.

             GASTOS is FinTech Startup Based in Chandigarh aimed to uplift the local and small businesses. Gastos is an Application based startup which helps user to save their money while doing payments at their local shops and businesses also helping them to manage all of their expenses at one place.
             Gastos has a potential of becoming a Billion Dollar Industry in coming years and has a potential user base of more than 200 Million to target. Gastos is the only startup in India which is bringing UPI Digital cards for the users which helps them to save their money.

             During this Covid-19 situation time and between the hard races of online delivery, the local and small scaled businesses are mostly affected. Gastos is the startup which is promoting these small businesses to grow and become a brand before the user. Gastos is solving multiple problems for users like fake discounts, lack of saving,
             unmanaged expenses.

             We're working to turn our passion for the services into a booming Market Network. We hope you enjoy our services as much as we enjoy offering them to you.


             Sincerely,
             Sahgal Kumar
             (Founder)

             here are some following ways through which you will be connected with us.

             •  Instagram : gastos.in
             •  Facebook : GASTOS DEALZ
             •  Twitter  : gastos_in
             For any queries you can contact us as help@gastos.in
        """)
          .padding()
          .font(.subheadline)
      }
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
