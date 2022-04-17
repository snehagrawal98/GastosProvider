//
//  LogoutAlert.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 17/04/22.
//

import SwiftUI
import Firebase

struct LogoutAlert: View {
  @AppStorage("log_Status") var status = false
  @Binding var show: Bool
  @EnvironmentObject var loginViewModel: LoginViewModel

    var body: some View {
      VStack {
        VStack {
          Text("Are you sure you want to logout?")
            .font(.body.weight(.bold))
            .foregroundColor(Color("deepGreen"))
            .padding(.top)
            .padding(.bottom, 2)
            .frame(width: 0.73 * UIScreen.screenWidth)

          Text("you'll be missed")
            .font(.subheadline)
            .foregroundColor(Color("deepGreen"))

          Spacer()

          Image("Dissatisfied")
            .resizable()
            .frame(width: 95, height: 95)

          Spacer()

          Button(action: {
            // logging out
            try? Auth.auth().signOut()
            //withAnimation{ status = false }
            withAnimation{ loginViewModel.status = false }
          }, label: {
            Text("Logout")
              .font(.body.weight(.semibold))
              .foregroundColor(Color("deepGreen"))
          })

          Button(action: {
            show = false
          }, label: {
            Text("Cancel")
              .font(.body.weight(.semibold))
              .foregroundColor(.white)
              .padding(8)
              .frame(width: 0.365 * UIScreen.screenWidth, height: 34)
              .background(
                RoundedRectangle(cornerRadius: 12)
                  .foregroundColor(Color("textGreen"))
              )
          })
            .padding(.bottom)
        }
        .padding()
        .frame(width: 0.76 * UIScreen.screenWidth, height: 0.412 * UIScreen.screenHeight)
        .background(
          RoundedRectangle(cornerRadius: 40)
            .foregroundColor(Color.white)
        )
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.black.opacity(0.3).ignoresSafeArea())
    }
}
