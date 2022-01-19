//
//  AddImageButton.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 18/01/22.
//

import SwiftUI

struct AddImageButton: View {
    var body: some View {
      ZStack {
        Rectangle()
          .frame(width: 0.38 * UIScreen.screenWidth, height: 0.1 * UIScreen.screenHeight, alignment: .center)
          .foregroundColor(Color("addImageButtonColor"))
          .cornerRadius(12)

        Image(systemName: "plus")
          .resizable()
          .scaledToFit()
          .frame(width: 23, height: 23, alignment: .center)
          .padding()
          .background(Color("textGreen"))
          .cornerRadius(10)
          .foregroundColor(.white)
      }
    }
}

struct AddImageButton_Previews: PreviewProvider {
    static var previews: some View {
        AddImageButton()
    }
}
