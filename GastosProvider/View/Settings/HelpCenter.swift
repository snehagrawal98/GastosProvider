//
//  HelpCenter.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 19/01/22.
//

import SwiftUI

struct HelpCenter: View {
 // @Environment(\.dismiss) var dismiss
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

            SettingsTitleView(title: "Help Center")

            Spacer()
          } //: HSTACK
          .padding()

          VStack {
            Text("Hi, How can we")

            Text("help?")
          }
          .font(.title2.weight(.regular))
          .foregroundColor(Color("helpCenterText"))

          ZStack {
            Image("HelpCenterImage")
              .resizable()
              .scaledToFit()
              .frame(width: 0.7 * UIScreen.screenWidth, height: 0.24 * UIScreen.screenHeight)

            VStack {
              Spacer()
              HStack {
                Spacer()

                Image(systemName: "magnifyingglass")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 20, height: 20, alignment: .center)
                  .foregroundColor(Color.gray)
                  .padding()
              }
              .frame(width: 0.9 * UIScreen.screenWidth, height: 55, alignment: .center)
              .background(
                RoundedRectangle(cornerRadius: 12)
                  .stroke(Color("textGreen").opacity(0.5), lineWidth: 1)
                  .background(Color.white)
            )
            }
            .frame(height: 0.3 * UIScreen.screenHeight)
          }
          Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
      }
    }
}

struct HelpCenter_Previews: PreviewProvider {
    static var previews: some View {
        HelpCenter()
    }
}
