//
//  BrandingWallet.swift
//  GastosProvider
//
//  Created by ehsan sat on 3/21/22.
//

import SwiftUI


struct BrandingWallet: View {
    
    var branding: Int
    
    @Environment(\.presentationMode) var presentationMode
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
                  }).padding(.leading)

                  Spacer()

                  SettingsTitleView(title: "Branding Wallet")

                  Spacer()
                } //: HSTACK
                

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.white)
                        .shadow(radius: 20)
                    
                    VStack {
                        
                        HStack {
                            VStack {
                                Text("Wallet Ballance")
                                    .fontWeight(.semibold)
                                    .font(.custom("Futura", size: 18))
                                    .padding(.top)
                                
                                Text("₹ \(branding)")
                                    .fontWeight(.regular)
                                    .font(.custom("Futura", size: 50))

                            }
                            .padding(.leading)
                            Spacer()
                        }
                    
                        Spacer()
                    
                        HStack {
                            Spacer()
                            NavigationLink {
                                AddMoney()
                            } label: {
                                
                                    Text("Add Money")
                                      .font(.body.weight(.bold))
                                      .font(.custom("Lato", size: 16))
                                      .foregroundColor(Color.white)
                                      .frame(width: 0.31 * UIScreen.screenWidth, height: 0.065 * UIScreen.screenHeight, alignment: .center)
                                      .background(Color("textGreen"))
                                      .cornerRadius(15)
                                      .padding(.trailing)
                                

                            }
                            .navigationBarHidden(true)
                            .navigationTitle("")
                            .navigationBarBackButtonHidden(true)
                        }
                        .padding(.bottom)
                    }
                }
                .padding(.horizontal)
                .frame(height: UIScreen.screenHeight * (253 / 812))
                
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

                
                Spacer()
                
            }

        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


struct BrandingWallet_Previews: PreviewProvider {
    static var previews: some View {
        BrandingWallet(branding: 1200)
    }
}
