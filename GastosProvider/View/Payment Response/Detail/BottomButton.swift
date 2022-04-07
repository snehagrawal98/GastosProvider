//
//  JumpHome.swift
//  Gastos_user_mvp1
//
//  Created by Sai Kumar Kasireddi's MacBook on 12/01/22.
//

import SwiftUI

struct BottomButton: View {
  @State var buttonText: String
  @State var buttonColor: String
  @State var textColor: String
    var body: some View {
      Text(buttonText)
        .foregroundColor(Color(textColor))
        .fontWeight(.bold)
        .frame(width: 0.87 * UIScreen.screenWidth, height: 0.074 * UIScreen.screenHeight, alignment: .center)
        .background(Color(buttonColor))
        .cornerRadius(20)
    }
}

struct BottomButton_Previews: PreviewProvider {
    static var previews: some View {
      BottomButton(buttonText: "Jump to Home", buttonColor: "white", textColor: "5")
        .preferredColorScheme(.dark)
    }
}
