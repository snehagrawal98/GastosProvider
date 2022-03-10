//
//  Settings.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 26/02/22.
//

import SwiftUI

struct Settings: View {
  @Environment(\.dismiss) var dismiss
    var body: some View {
      NavigationView {
        VStack {
          //Navigation Bar
          HStack {
            Button(action: { dismiss() }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.black)
                .padding()
              Spacer()
              Text("Settings")
                .font(.title2.weight(.semibold))
                .foregroundColor(Color("deepGreen"))
              Spacer()
              Spacer()
            })
          }

          //Account
          VStack(alignment: .leading) {
            Text("ACCOUNT")
              .font(.body.weight(.semibold))
              .foregroundColor(Color("deepGreen"))

            VStack {
              NavigationLink(destination: ManageAccount()
                              .navigationBarHidden(true)
                              .navigationBarBackButtonHidden(true), label: {
                HStack {
                  Image(systemName: "person")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)

                  Text("Manage Account")
                    .font(.body)

                  Spacer()
                  Image(systemName: "chevron.right")
                }
                .foregroundColor(.black)
              })

              Spacer()
              Divider()
              Spacer()

              NavigationLink(destination: ManageShop()
                              .navigationBarHidden(true)
                              .navigationBarBackButtonHidden(true), label: {
                HStack {
                  Image(systemName: "cart")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)

                  Text("Manage Shop")
                    .font(.body)

                  Spacer()
                  Image(systemName: "chevron.right")
                }
                .foregroundColor(.black)
              })
            }
            .frame(width: 0.8 * UIScreen.screenWidth, height: 0.09 * UIScreen.screenHeight)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 16)
                .frame(width: 0.9 * UIScreen.screenWidth, height: 0.135 * UIScreen.screenHeight)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.5), radius: 5)
            )
          }
          .padding(.bottom, 8)

          //Promotion
          VStack(alignment: .leading) {
            Text("PROMOTION")
              .font(.body.weight(.semibold))
              .foregroundColor(Color("deepGreen"))

            VStack {
              HStack {
                Image(systemName: "chart.bar")
                  .resizable()
                  .frame(width: 20, height: 20)
                  .padding(.trailing)

                Text("Post Ads")
                  .font(.body)

                Spacer()
                Image(systemName: "chevron.right")
              }
              Spacer()
              Divider()
              Spacer()
              HStack {
                Image(systemName: "star")
                  .resizable()
                  .frame(width: 20, height: 20)
                  .padding(.trailing)

                Text("Manage Ads")
                  .font(.body)

                Spacer()
                Image(systemName: "chevron.right")
              }
            }
            .frame(width: 0.8 * UIScreen.screenWidth, height: 0.09 * UIScreen.screenHeight)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 16)
                .frame(width: 0.9 * UIScreen.screenWidth, height: 0.135 * UIScreen.screenHeight)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.5), radius: 5)
            )
          }
          .padding(.bottom, 8)

          //Support
          VStack(alignment: .leading) {
            Text("SUPPORT")
              .font(.body.weight(.semibold))
              .foregroundColor(Color("deepGreen"))

            VStack {
              NavigationLink(destination: ReportAProblem()
                              .navigationBarHidden(true)
                              .navigationBarBackButtonHidden(true), label: {
                HStack {
                  Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)

                  Text("Report a Problem")
                    .font(.body)

                  Spacer()
                  Image(systemName: "chevron.right")
                }
                .foregroundColor(.black)
              })

              Spacer()
              Divider()
              Spacer()

              NavigationLink(destination: HelpCenter()
                              .navigationBarHidden(true)
                              .navigationBarBackButtonHidden(true), label: {
                HStack {
                  Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)

                  Text("Help Center")
                    .font(.body)

                  Spacer()
                  Image(systemName: "chevron.right")
                }
                .foregroundColor(.black)
              })
            }
            .frame(width: 0.8 * UIScreen.screenWidth, height: 0.09 * UIScreen.screenHeight)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 16)
                .frame(width: 0.9 * UIScreen.screenWidth, height: 0.135 * UIScreen.screenHeight)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.5), radius: 5)
            )
          }
          .padding(.bottom, 8)

          //About
          VStack(alignment: .leading) {
            Text("ABOUT")
              .font(.body.weight(.semibold))
              .foregroundColor(Color("deepGreen"))

            VStack {

              NavigationLink(destination: AboutUs()
                              .navigationBarHidden(true)
                              .navigationBarBackButtonHidden(true), label: {
                HStack {
                  HStack(spacing: -24) {
                    Image(systemName: "circle")
                      .resizable()
                      .frame(width: 15, height: 15)
                      .padding(.trailing)
                    Image(systemName: "circle")
                      .resizable()
                      .frame(width: 15, height: 15)
                      .padding(.trailing)
                  }

                  Text("About Us")
                    .font(.body)

                  Spacer()
                  Image(systemName: "chevron.right")
                }
                .foregroundColor(.black)
              })

              Spacer()
              Divider()
              Spacer()

              NavigationLink(destination: TermsOfService()
                              .navigationBarHidden(true)
                              .navigationBarBackButtonHidden(true), label: {
                HStack {
                  Image(systemName: "book.closed")
                    .resizable()
                    .frame(width: 16, height: 20)
                    .padding(.trailing)

                  Text("Terms of Service")
                    .font(.body)

                  Spacer()
                  Image(systemName: "chevron.right")
                }
                .foregroundColor(.black)
              })

              Spacer()
              Divider()
              Spacer()

              NavigationLink(destination: PrivacyPolicy()
                              .navigationBarHidden(true)
                              .navigationBarBackButtonHidden(true), label: {
                HStack {
                  Image(systemName: "doc")
                    .resizable()
                    .frame(width: 16, height: 20)
                    .padding(.trailing)

                  Text("Privacy Policy")
                    .font(.body)

                  Spacer()
                  Image(systemName: "chevron.right")
                }
                .foregroundColor(.black)
              })



            }
            .frame(width: 0.8 * UIScreen.screenWidth, height: 0.15 * UIScreen.screenHeight)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 16)
                .frame(width: 0.9 * UIScreen.screenWidth, height: 0.191 * UIScreen.screenHeight)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.5), radius: 5)
            )
          }
          .padding(.bottom, 8)

          Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
      }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
