//
//  ImageWithEdit.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 18/01/22.
//

import SwiftUI

struct ImageWithEdit: View {
    var body: some View {
      ZStack {
        Image("detailShop")
          .resizable()
          .scaledToFit()
          .frame(width: 0.75 * UIScreen.screenWidth, height: 0.21 * UIScreen.screenHeight, alignment: .center)
          .cornerRadius(19)

        // Edit Button
        VStack {
          Spacer()

          HStack {
            Spacer()

            Button(action: {
              // edit
            }, label: {
              Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18, alignment: .center)
                .foregroundColor(.white)
                .padding()
                .background(Color("textGreen"))
                .cornerRadius(12)
            }) //: BUTTON
          } //: HSTACK
        } //: VSTACK
        .frame(width: 0.85 * UIScreen.screenWidth, height: 0.22 * UIScreen.screenHeight, alignment: .center)

      } //: ZSTACK
    }
}

struct ImageWithEdit_Previews: PreviewProvider {
    static var previews: some View {
        ImageWithEdit()
    }
}
