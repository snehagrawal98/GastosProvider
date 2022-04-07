//
//  GradientView.swift
//  Gastos_user_mvp1
//
//  Created by Sai Kumar Kasireddi's MacBook on 12/01/22.
//

import SwiftUI

struct GradientView: View {
    var firstColor: String
    var secondColor: String

    var body: some View {
      LinearGradient(gradient: Gradient(colors: [Color(firstColor), Color(secondColor)]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
      GradientView(firstColor: "5", secondColor: "1")
    }
}
