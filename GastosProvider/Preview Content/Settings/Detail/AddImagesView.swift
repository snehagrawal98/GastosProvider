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
