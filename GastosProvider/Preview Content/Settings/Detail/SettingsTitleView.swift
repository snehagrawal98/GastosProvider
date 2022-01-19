//
//  TitleView.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 19/01/22.
//

import SwiftUI

struct SettingsTitleView: View {
  @State var title: String
    var body: some View {
        Text(title)
        .font(.title.weight(.semibold))
        .foregroundColor(Color("deepGreen"))
    }
}

struct SettingsTitleView_Previews: PreviewProvider {
    static var previews: some View {
      SettingsTitleView(title: "Manage Shop")
    }
}
