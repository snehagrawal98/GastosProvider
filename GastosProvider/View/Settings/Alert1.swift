//
//  Alert1.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 11/05/22.
//

import Foundation
import SwiftUI
import Firebase

struct Alert1: View {
 // @AppStorage("log_Status") var status = false
  @Binding var show: Bool
 // @EnvironmentObject var loginViewModel: LoginViewModel

    var body: some View {
      VStack {
        VStack {
          Text("Your account is")
            .font(.body.weight(.medium))
            .foregroundColor(Color("deepGreen"))
            .padding(.top)
            .padding(.bottom, 2)
            .frame(width: 0.73 * UIScreen.screenWidth)
            Text("under review")
              .font(.body.weight(.medium))
              .foregroundColor(Color("deepGreen"))
             // .padding(.top)
              .padding(.bottom, 2)
              .frame(width: 0.73 * UIScreen.screenWidth)
            Text("You can Post advertisement")
              .font(.body.weight(.medium))
              .foregroundColor(Color("deepGreen"))
              .padding(.top)
              //.padding(.bottom, 2)
              .frame(width: 0.73 * UIScreen.screenWidth)
          
            Text("after some time")
              .font(.body.weight(.medium))
              .foregroundColor(Color("deepGreen"))
             // .padding(.top)
              .padding(.bottom, 2)
              .frame(width: 0.73 * UIScreen.screenWidth)
          Spacer()

          

          Button(action: {
            show = false
          }, label: {
            Text("Okay")
              .font(.body.weight(.medium))
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
        .frame(width: 0.66 * UIScreen.screenWidth, height: 0.290 * UIScreen.screenHeight)
        .background(
          RoundedRectangle(cornerRadius: 40)
            .foregroundColor(Color.white)
        )
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.black.opacity(0.3).ignoresSafeArea())
    }
}
