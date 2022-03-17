//
//  ManageDesign.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 17/03/22.
//

import SwiftUI

struct ManageDesign: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
        HStack {
          Button(action: {
              presentationMode.wrappedValue.dismiss()
          }, label: {
            Image(systemName: "arrow.left")
              .resizable()
              .frame(width: 24, height: 20)
              .foregroundColor(.primary)
          })

          Spacer()

          SettingsTitleView(title: "Manage Designs")

          Spacer()
        }
            Image("manage")
           Spacer()
        }.padding()
    }
}

struct ManageDesign_Previews: PreviewProvider {
    static var previews: some View {
        ManageDesign()
    }
}
