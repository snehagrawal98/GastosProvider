//
//  ManageAds1.swift
//  GastosProvider
//
//  Created by ehsan sat on 3/14/22.
//

import SwiftUI

struct ProviderWallet: View {
    @Environment(\.presentationMode) var presentationMode
    @State var promotion: Int = 200
    @State var branding: Int = 1000
    @StateObject var registrationPaymentViewModel: RegistrationPaymentViewModel = RegistrationPaymentViewModel()
    @StateObject var loginViewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                  Button(action: {
                      presentationMode.wrappedValue.dismiss()
                  }, label: {
                    Image(systemName: "arrow.left")
                      .resizable()
                      .frame(width: 25, height: 20)
                      .foregroundColor(.primary)
                  })
                        .padding(.leading)
                    
                  Spacer()

                  SettingsTitleView(title: "Provider Wallet")

                  Spacer()
                } //: HSTACK
                .padding(.vertical)
                
                WalletBrand(promotion: promotion, branding: branding)
                    .onAppear {
                        registrationPaymentViewModel.setBrandingPromotion(id: loginViewModel.uid, promotion: "\(promotion)", branding: "\(branding)")
                    }
                
                AddAlert()
                
                Spacer()

            }

        }
        .navigationBarHidden(true)
        .navigationTitle("")
    }
}

struct AddAlert: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "star")
                    .padding(.leading)
                VStack(alignment: .leading) {
                    Text("Your account is under review")
                        .fontWeight(.regular)
                        .font(.custom("Poppins", size: 12))
                    Text("Your advertisement system will soon be live")
                        .fontWeight(.regular)
                        .font(.custom("Poppins", size: 12))
                }
            }
        
            Image("SearchAndFind")
                .resizable()
                .scaledToFit()
        }
        .padding(.top)
    }
}

struct WalletBrand: View {
    
    var promotion: Int
    var branding: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.white)
            
            VStack(alignment: .leading) {
                
                Text("Wallet Ballance")
                    .fontWeight(.semibold)
                    .font(.custom("Futura", size: 18))
                    .padding(.leading)
                    .padding(.top)
                Text("₹\(promotion + branding)")
                    .foregroundColor(Color("textGreen"))
                    .fontWeight(.regular)
                    .font(.custom("Futura", size: 50))
                    .padding(.leading)
                
                HStack {
                    
                    NavigationLink {
                        PromotionWallet(promotion: promotion).navigationBarHidden(true)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.white)
                            VStack(alignment: .leading) {
                                Text("Promotion")
                                    .fontWeight(.regular)
                                    .font(.custom("Futura", size: 18))
                                Text("₹\(promotion)")
                                    .foregroundColor(Color("textGreen"))
                                    .fontWeight(.regular)
                                    .font(.custom("Futura", size: 24))

                            }
                        }
                        .shadow(radius: 10)
                        .padding(.horizontal)

                    }
                    .navigationTitle("")
                    .navigationBarHidden(true)
                    
                    Spacer()
                    
                    NavigationLink {
                        BrandingWallet(branding: branding)
                    } label: {
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.white)
                            VStack(alignment: .leading) {
                                Text("Branding")
                                    .fontWeight(.regular)
                                    .font(.custom("Futura", size: 18))
                                Text("₹\(branding)")
                                    .foregroundColor(Color("textGreen"))
                                    .fontWeight(.regular)
                                    .font(.custom("Futura", size: 24))
                            }
                        }
                        .shadow(radius: 10)
                        .padding(.horizontal)

                    }
                    .navigationTitle("")
                    .navigationBarHidden(true)

                }
                .padding(.bottom)
            }
        }
        .frame(height: UIScreen.screenHeight * (253 / 812))
        .padding(.horizontal)
        //.shadow(radius: 20)
    }
}

struct ManageAds1_Previews: PreviewProvider {
    static var previews: some View {
        ProviderWallet()
    }
}
