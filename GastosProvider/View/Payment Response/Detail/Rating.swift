//
//  Rating.swift
//  Gastos_user_mvp1
//
//  Created by Sai Kumar Kasireddi's MacBook on 12/01/22.
//

import SwiftUI

struct Rating: View {
    @Binding var productRating: Int?

    private func starType(index: Int) -> String {
      if let rating = self.productRating {
        return index <= rating ? "star.fill" : "star"
       } else {
      return "star"
    }
  }

    var body: some View {
      HStack(alignment: .center, spacing: 3, content: {
        ForEach(1...5, id: \.self) { item in
          Button(action: {
            self.productRating = item
          }, label: {
            Image(systemName: self.starType(index: item))
              .resizable()
              .frame(width: 23, height: 23)
              .foregroundColor(.orange)
          })
        }
      })
    }
}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
      Rating(productRating: .constant(4))
    }
}
