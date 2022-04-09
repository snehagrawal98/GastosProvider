//
//  ManageAccount.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 18/01/22.
//

import SwiftUI
import Firebase

struct ManageAccount: View {
    @StateObject var accountViewModel = AccountViewModel()
  @EnvironmentObject var loginViewModel: LoginViewModel
  @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode


    var body: some View {
      NavigationView {
        VStack {
          // Navigation Bar
          HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()

            }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.primary)
            })

            Spacer()
            Text("Manage Account")
              .font(.title)
              .fontWeight(.medium)
              .foregroundColor(Color("deepGreen"))
            Spacer()
          } //: HSTACK
          .padding()

          // Owner Details
          VStack(spacing: 16) {
            // Owner Name
            VStack(alignment: .leading) {
              Text("Owner Name")
                .font(.subheadline.weight(.regular))
                .foregroundColor(.secondary)
                .padding(.bottom, 1)

                Text(accountViewModel.ownerName)
                .font(.title3.weight(.medium))
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(width: UIScreen.screenWidth - 48, alignment: .leading)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("textGreen").opacity(0.2), lineWidth: 1)
            )

            // Contact Number
            VStack(alignment: .leading) {
              Text("Contact Number")
                .font(.subheadline.weight(.regular))
                .foregroundColor(.secondary)
                .padding(.bottom, 1)

                Text(accountViewModel.phone)
                .font(.title3.weight(.medium))
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(width: UIScreen.screenWidth - 48, alignment: .leading)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("textGreen").opacity(0.2), lineWidth: 1)
            )

            // Email Address
            VStack(alignment: .leading) {
              Text("Email Address")
                .font(.subheadline.weight(.regular))
                .foregroundColor(.secondary)
                .padding(.bottom, 1)

                Text(accountViewModel.email)
                .font(.title3.weight(.medium))
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(width: UIScreen.screenWidth - 48, alignment: .leading)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("textGreen").opacity(0.2), lineWidth: 1)
            )
          } //: VSTACK

          Spacer()

          // Logout button
          Button(action: {
            // logout
            try? Auth.auth().signOut()
            withAnimation{ loginViewModel.status = false }
          }, label: {
            Text("Logout")
              .font(.title.weight(.semibold))
              .foregroundColor(Color("deepGreen"))
          }) //: BUTTON
            .frame(width: UIScreen.screenWidth - 48, alignment: .leading)
            .padding(.bottom)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
      } //: VSTACK
    }
}

struct ManageAccount_Previews: PreviewProvider {
    static var previews: some View {
        ManageAccount()
        .environmentObject(LoginViewModel())
    }
}
