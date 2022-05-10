//
//  ManageAds.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 16/03/22.
//

import SwiftUI

struct ManageAdvt: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingPopover = false

    var body: some View {
      //  ZStack{
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

          SettingsTitleView(title: "Manage Ads")

          Spacer()
        }
            Image("manage")
           Spacer()
        }.padding()
    //    }
    }
}

struct ManageAds_Previews: PreviewProvider {
    static var previews: some View {
        ManageAdvt()
    }
}
