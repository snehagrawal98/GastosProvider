//
//  PostAds.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 17/03/22.
//

import SwiftUI

struct PostAdvt: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingPopover = false
  //  @State var isShowingLogoutAlert = false


    var body: some View {
        ZStack{
        VStack{
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

          SettingsTitleView(title: "Post Ads")
            
           
          Spacer()
        }
            ScrollView{
            Text("Choose the Advertisement Type").foregroundColor(.black).font(.system(size:15, weight: .bold, design: .default))
            Image("1ad")
            Image("2ad")
            Image("6ad")
            Image("5ad")
            Image("4ad")
            }
            Spacer()
        }.padding().overlay(
            ZStack {
              BasicScreensBottomBackground()
              HStack {
                BasicScreensBottomLeftText(firstLine: "Wallet Balance ", secondLine: "Rs 600")
                  .padding(.leading)
                Spacer()

                Button(action: { //self.didEnterAllData()
                    self.showingPopover = true
                    self.hideKeyboard()
                }, label: {
                  BasicScreensBottomRighttText(buttonText: "Next")
                })
                  
              }
            }.padding()
                .frame(height: UIScreen.screenHeight, alignment: .bottom).offset(y:25)
          ) //: OVERLAY
            
            if showingPopover {
              Alert1(show: $showingPopover)
            }
            
        }
    }
}

struct PostAds_Previews: PreviewProvider {
    static var previews: some View {
        PostAdvt()
    }
}


struct popUp: View{
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{
            Text("You account is under review").foregroundColor(.black).font(.system(size: 15, weight: .medium, design: .default))
//
            Button {
                presentationMode.wrappedValue.dismiss()

            } label: {
                Text("Dismiss").foregroundColor(.green).font(.system(size: 15, weight: .medium, design: .default))
            }

        }
    }
}
