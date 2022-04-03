//
//  ReferAndEarn.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 16/03/22.
//

import SwiftUI

struct ReferAndEarn: View {
   // @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center){
          // Navigation Bar
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

            SettingsTitleView(title: "Refer & Earn")

            Spacer()
          } //: HSTACK
         // .padding()
        Image("Asset1")
                Text("Register a Friend in Gastos Provider Club and get").font(.system(size:17, weight: .semibold)) + Text(" Rs150 ").foregroundColor(Color("deepGreen")).font(.system(size:17, weight: .semibold)) + Text("in your wallet for each registration.").font(.system(size:17, weight: .semibold))
                    
//                Button {
//
//                } label: {
//                    HStack{
//                    Text("Share").font(.system(size:20, weight: .semibold)).foregroundColor(.white)
//                        Image("shape")
//                    }
//                }.frame(width: 99, height: 40, alignment: .center).background(Color("deepGreen")).cornerRadius(10)
//                Image("text")

            }.padding(.horizontal)
        }
    }
}

struct ReferAndEarn_Previews: PreviewProvider {
    static var previews: some View {
        ReferAndEarn()
    }
}
