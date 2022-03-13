//
//  UserAgreement.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 23/01/22.
//

import SwiftUI

struct UserAgreement: View {
    @State var agreed = false
    @State var numberOfAppears = 0
    @Environment(\.dismiss) var dismiss

    @StateObject var userAgreementModel = UserAgreementModel()
    @EnvironmentObject var loginViewModel: LoginViewModel

    var body: some View {
      NavigationView {
        VStack {
          // Navigation Bar
          HStack {
            Button(action: {
              dismiss()
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

          ScrollView(.vertical) {
            Text(userAgreementModel.agreement)
              .padding()
              .background(Color.white.cornerRadius(5))
              .padding(.horizontal)
              .shadow(color: .gray.opacity(0.3), radius: 5)
          }
        }
        .overlay(bottomPart
                  .frame(height: UIScreen.screenHeight, alignment: .bottom))
        .onAppear(perform: {
          numberOfAppears += 1
          if numberOfAppears < 2 {
            userAgreementModel.fetchAgreement()
          }
      })
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
      }
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
          loginViewModel.didAgree = true
        }, label: {
          Text("I Agree")
            .font(.body.weight(.bold))
            .foregroundColor(Color("textGreen"))
            .frame(width: 0.31 * UIScreen.screenWidth, height: 0.065 * UIScreen.screenHeight, alignment: .center)
            .background(Color.white)
            .cornerRadius(15)
            .padding(.trailing)
        })
          .disabled(!agreed)
      }
    }
  }
}

struct UserAgrement_Previews: PreviewProvider {
    static var previews: some View {
        UserAgreement()
        .environmentObject(LoginViewModel())
    }
}
