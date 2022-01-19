//
//  ImageWithEditAndDelete.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 18/01/22.
//

import SwiftUI

struct ImageWithEditAndDelete: View {
    var body: some View {
      ZStack {
        Image("detailShop")
          .resizable()
          .scaledToFit()
          .frame(width: 0.34 * UIScreen.screenWidth, height: 0.095 * UIScreen.screenHeight, alignment: .center)
          .cornerRadius(12)

        // Delete Button
        VStack {
          HStack {
            Spacer()

            Button(action: {
              // delete
            }, label: {
              Image(systemName: "trash")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12, alignment: .center)
                .foregroundColor(.white)
                .padding(8)
                .background(Color("textGreen"))
                .cornerRadius(5)
            }) //: BUTTON
          }

          Spacer()

          HStack {
            Spacer()

            Button(action: {
              // edit
            }, label: {
              Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12, alignment: .center)
                .foregroundColor(.white)
                .padding(8)
                .background(Color("textGreen"))
                .cornerRadius(5)
            }) //: BUTTON
          } //: HSTACK
        } //: VSTACK
        .frame(width: 0.40 * UIScreen.screenWidth, height: 0.1 * UIScreen.screenHeight, alignment: .center)

      } //: ZSTACK
    }
}

struct ImageWithEditAndDelete_Previews: PreviewProvider {
    static var previews: some View {
        ImageWithEditAndDelete()
    }
}
