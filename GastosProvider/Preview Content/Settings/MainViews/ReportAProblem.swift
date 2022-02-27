//
//  ReportAProblem.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 19/01/22.
//

import SwiftUI

struct ReportAProblem: View {
  @Environment(\.dismiss) var dismiss
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
                .frame(width: 24, height: 24)
                .foregroundColor(.primary)
            })

            Spacer()

            SettingsTitleView(title: "Report A Problem")

            Spacer()
          } //: HSTACK
          .padding()

          Rectangle()
            .frame(width: 0.78 * UIScreen.screenWidth, height: 0.33 * UIScreen.screenHeight, alignment: .center)
            .foregroundColor(Color.gray.opacity(0.6))
            .cornerRadius(20)
            .padding(.vertical, 48)

          HStack {
            Spacer()

            Rectangle()
              .frame(width: 0.27 * UIScreen.screenWidth, height: 0.05 * UIScreen.screenHeight)
              .foregroundColor(Color.gray.opacity(0.6))
            .cornerRadius(20)
          }
          .frame(width: 0.78 * UIScreen.screenWidth)

          Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
      }
    }
}

struct ReportAProblem_Previews: PreviewProvider {
    static var previews: some View {
        ReportAProblem()
    }
}
