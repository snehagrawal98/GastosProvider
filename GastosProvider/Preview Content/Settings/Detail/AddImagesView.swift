//
//  AddImagesView.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 19/01/22.
//

import SwiftUI

struct AddImagesView: View {
    var gridLayout: [GridItem] {
      return Array(repeating: GridItem(.flexible(), spacing: -55), count: 2)
    }
    var body: some View {
      LazyVGrid(columns: gridLayout, spacing: 5, content: {
        ForEach(1..<4) { _ in
          ImageWithEditAndDelete()
        }
        AddImageButton()
      })
    }
}

struct AddImagesView_Previews: PreviewProvider {
    static var previews: some View {
        AddImagesView()
    }
}

// Image with Delete and Edit
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

// Add Image Button
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

