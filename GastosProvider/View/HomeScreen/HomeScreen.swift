//
//  HomeScreen.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 26/02/22.
//

import SwiftUI

struct HomeScreen: View {
    let rupeeSymbol = "\u{20B9}"
  @EnvironmentObject var loginViewModel: LoginViewModel
  @StateObject var homeScreenViewModel = HomeScreenViewModel()

    var body: some View {
      NavigationView {
        VStack {
          // Top part
          ZStack {
            Rectangle()
              .frame(width: UIScreen.screenWidth, height: 0.407 * UIScreen.screenHeight)
              .foregroundColor(.white)
              .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
              .edgesIgnoringSafeArea(.all)
              .shadow(color: .gray.opacity(0.25), radius: 5)

            VStack {
              ShopImages(shopImagesUrl: "detailShop")

              HStack {
                Text(homeScreenViewModel.shopName)
                  .font(.title.weight(.medium))
                  .foregroundColor(Color("deepGreen"))
                  .padding()

                Spacer()
              } //: HSTACK
            } //: VSTACK
          } //: ZSTACK
          .frame(width: UIScreen.screenWidth, height: 0.407 * UIScreen.screenHeight)

          // Middle part
          HStack(spacing: 0.1 * UIScreen.screenWidth) {
            VStack {
              NavigationLink(destination: AddQRs()
                              .navigationBarHidden(true)
                              .navigationBarBackButtonHidden(true), label: {
                Image(systemName: "qrcode.viewfinder")
                  .resizable()
                  .frame(width: 30, height: 30)
                  .foregroundColor(Color("deepGreen"))
                  .background(
                    Circle()
                      .frame(width: 60, height: 60)
                      .foregroundColor(.white)
                      .shadow(color: .gray.opacity(0.25), radius: 5)
                  )
              })
                .padding(.vertical)

              Text("Manage QR")
            } //: VSTACK

            VStack {
              NavigationLink(destination: LiveQrGeneration()
                              .navigationBarHidden(true)
                              .navigationBarBackButtonHidden(true),
                              label: {
                Image(systemName: "square.and.arrow.down.fill")
                  .resizable()
                  .frame(width: 30, height: 30)
                  .foregroundColor(Color("deepGreen"))
                  .background(
                    Circle()
                      .frame(width: 60, height: 60)
                      .foregroundColor(.white)
                      .shadow(color: .gray.opacity(0.25), radius: 5)
                  )
              })
                .padding(.vertical)

              Text("Generate QR")
            } //: VSTACK

            VStack {
              NavigationLink(destination: Settings()
                              .navigationBarHidden(true)
                              .navigationBarBackButtonHidden(true), label: {
                Image(systemName: "gearshape.fill")
                  .resizable()
                  .frame(width: 30, height: 30)
                  .foregroundColor(Color("deepGreen"))
                  .background(
                    Circle()
                      .frame(width: 60, height: 60)
                      .foregroundColor(.white)
                      .shadow(color: .gray.opacity(0.25), radius: 5)
                  )
              })
                .padding(.vertical)

              Text("Settings")
            } //: VSTACK
          } //: HSTACK
          .padding(.vertical)

          // Recent Payment
          VStack {
            Text("Recent Payment")
              .font(.title3)
              .frame(width: 0.885 * UIScreen.screenWidth, alignment: .leading)
              .padding()

            HStack {
              VStack {
                Image("foodItem")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 0.16 * UIScreen.screenWidth, height: 0.074 * UIScreen.screenHeight)
                  .clipShape(Circle())
                Spacer()
              }
              .padding(.trailing, 2)

              VStack(alignment: .leading) {
                Text("Sanjay Butt")
                  .font(.headline.weight(.medium))
                Spacer()
                HStack {
                  Text("Paid")
                    .font(.subheadline)
                  Text("\(rupeeSymbol) 450")
                    .font(.title3.weight(.semibold))
                    .foregroundColor(Color("textGreen"))
                }
                HStack {
                  Text("Billed Amount")
                    .font(.subheadline)
                  Text("\(rupeeSymbol) 500")
                    .font(.body.weight(.semibold))
                    .foregroundColor(.black.opacity(0.6))
                }
              }
              .frame(height: 0.1 * UIScreen.screenHeight)
              Spacer()

              VStack(alignment: .trailing) {
                Image("Google Pay")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 0.14 * UIScreen.screenWidth, height: 0.08 * UIScreen.screenHeight)

                Text("02:30 PM")
                  .font(.caption2)
                Text("25 DEC 2020")
                  .font(.caption2)
              }
            }
            .frame(width: 0.85 * UIScreen.screenWidth, height: 0.118 * UIScreen.screenHeight)
            .background(
              RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.5), radius: 5)
                .frame(width: 0.885 * UIScreen.screenWidth, height: 0.15 * UIScreen.screenHeight)
            )
          } //: VSTACK
          .padding(.bottom)

          // bottom ads
          TabView {
            ForEach(1..<5) { _ in
              Image("HomeScreenAd")
                .resizable()
                .scaledToFit()
                .frame(width: 0.97 *  UIScreen.screenWidth, height: 0.3 * UIScreen.screenHeight)
                .cornerRadius(30)
            }
          }//: TAB
          .frame(width: 2 * UIScreen.screenWidth - 32, height: 0.18 * UIScreen.screenHeight)
          .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

          Spacer()
        } //: VSTACK
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
          homeScreenViewModel.readShopInfo(uid: loginViewModel.uid)
        })
      } //: NAV
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
        .environmentObject(LoginViewModel())
    }
}

// Shop Images
struct ShopImages: View {
    var shopImagesUrl: String
    var body: some View {
      TabView {
        ForEach(1..<5) { _ in
          Image(shopImagesUrl)
            .resizable()
            .scaledToFit()
            .frame(width: 0.898 *  UIScreen.screenWidth, height: 0.226 * UIScreen.screenHeight)
            .cornerRadius(30)
        }
      }//: TAB
      .frame(width: 0.898 * UIScreen.screenWidth - 32, height: 0.226 * UIScreen.screenHeight)
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}
