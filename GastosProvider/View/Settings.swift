//
//  Settings.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 26/02/22.
//

import SwiftUI

struct Settings: View {
  @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
      NavigationView {
          ScrollView{
        VStack {
            
          //Navigation Bar
          HStack {
            Button(action: {             presentationMode.wrappedValue.dismiss()
             }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 20, height: 20)
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
                
                Spacer()
                Divider()
                Spacer()
//wallet
                NavigationLink(destination: ProviderWallet()
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true), label: {
                  HStack {
                    Image(systemName: "wallet.pass")
                      .resizable()
                      .frame(width: 20, height: 20)
                      .padding(.trailing)

                    Text("Provider Wallet")
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

          //Promotion
          VStack(alignment: .leading) {
            Text("PROMOTION")
              .font(.body.weight(.semibold))
              .foregroundColor(Color("deepGreen"))

            VStack {
                NavigationLink(destination: PostAdvt()
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true), label: {
              HStack {
                Image(systemName: "plus.square")
                  .resizable()
                  .frame(width: 20, height: 20)
                  .padding(.trailing).foregroundColor(.black)

                Text("Post Ads")
                  .font(.body).foregroundColor(.black)

                Spacer()
                Image(systemName: "chevron.right").foregroundColor(.black)
              }
                })
              Spacer()
              Divider()
              Spacer()
                
                NavigationLink(destination: ManageAdvt()
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true), label: {
              HStack {
                Image(systemName: "chart.bar.doc.horizontal")
                  .resizable()
                  .frame(width: 20, height: 20).rotationEffect(.degrees(-90))
                  .padding(.trailing).foregroundColor(.black)

                Text("Manage Ads")
                      .font(.body).foregroundColor(.black)

                Spacer()
                  Image(systemName: "chevron.right").foregroundColor(.black)
              }
                
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
            
        //Branding
            VStack(alignment: .leading) {
              Text("BRANDING")
                .font(.body.weight(.semibold))
                .foregroundColor(Color("deepGreen"))

              VStack {
                  NavigationLink(destination: RequestDesign()
                                  .navigationBarHidden(true)
                                  .navigationBarBackButtonHidden(true), label: {
                HStack {
                  Image(systemName: "square.and.arrow.down")
                    .resizable().foregroundColor(.black)
                    .frame(width: 20, height: 20)
                    .padding(.trailing)

                  Text("Request Design")
                    .font(.body).foregroundColor(.black)

                  Spacer()
                  Image(systemName: "chevron.right").foregroundColor(.black)
                }
                  })
                  
                Spacer()
                Divider()
                Spacer()
                  
            NavigationLink(destination: ManageDesign()
                                  .navigationBarHidden(true)
                                  .navigationBarBackButtonHidden(true), label: {
                HStack {
                  Image(systemName: "folder")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing).foregroundColor(.black)

                  Text("Manage Designs")
                    .font(.body).foregroundColor(.black)

                  Spacer()
                  Image(systemName: "chevron.right").foregroundColor(.black)
                }
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
            
            
            
            //Refer
            VStack(alignment: .leading) {
              Text("REFER AND EARN")
                .font(.body.weight(.semibold))
                .foregroundColor(Color("deepGreen"))

              VStack {
                  NavigationLink(destination: ReferAndEarn()
                                  .navigationBarHidden(true)
                                  .navigationBarBackButtonHidden(true), label: {
                HStack {
                    HStack(spacing: -20){
                  Image(systemName: "person")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing).foregroundColor(.black)
                Image(systemName: "plus")
                          .resizable()
                          .frame(width: 8, height: 8)
                          .padding(.trailing).foregroundColor(.black).offset(y:-5)
                    }
                  Text("Invite Your Friend")
                        .font(.body).foregroundColor(.black).offset(x: -5)

                  Spacer()
                  Image(systemName: "chevron.right").foregroundColor(.black)
                
                }
              })
              }
              .frame(width: 0.8 * UIScreen.screenWidth, height: 0.05 * UIScreen.screenHeight)
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 16)
                  .frame(width: 0.9 * UIScreen.screenWidth, height: 0.07 * UIScreen.screenHeight)
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
                Link(destination: URL(string: "https://gastos-reportaproblem.netlify.app")!) {
                HStack {
                  Image(systemName: "highlighter")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)

                  Text("Report a Problem")
                    .font(.body)

                  Spacer()
                  Image(systemName: "chevron.right")
                }
                .foregroundColor(.black)
              }

              Spacer()
              Divider()
              Spacer()

                Link(destination: URL(string: "https://gastos-helpcenter.netlify.app")!) {
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

          //About
          VStack(alignment: .leading) {
            Text("ABOUT")
              .font(.body.weight(.semibold))
              .foregroundColor(Color("deepGreen"))

            VStack {

                Link(destination: URL(string: "https://gastos-aboutus.netlify.app")!) {
                HStack {
                    Image(systemName: "i.square")
                      .resizable()
                      .frame(width: 18, height: 18)
                      .padding(.trailing)
                    
                  

                  Text("About Us")
                    .font(.body)

                  Spacer()
                  Image(systemName: "chevron.right")
                }
                .foregroundColor(.black)
              }

              Spacer()
              Divider()
              Spacer()

                Link(destination: URL(string: "https://gastos-termsofservice.netlify.app")!) {
                HStack {
                  Image(systemName: "doc.plaintext")
                    .resizable()
                    .frame(width: 16, height: 20)
                    .padding(.trailing)

                  Text("Terms of Service")
                    .font(.body)

                  Spacer()
                  Image(systemName: "chevron.right")
                }
                .foregroundColor(.black)
              }

              Spacer()
              Divider()
              Spacer()

                Link(destination: URL(string: "https://gastos-privacypolicy.netlify.app")!) {
                HStack {
                  Image(systemName: "doc.text")
                    .resizable()
                    .frame(width: 16, height: 20)
                    .padding(.trailing)

                  Text("Privacy Policy")
                    .font(.body)

                  Spacer()
                  Image(systemName: "chevron.right")
                }
                .foregroundColor(.black)
              }



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
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
