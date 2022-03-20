//
//  PromotionWallet.swift
//  GastosProvider
//
//  Created by ehsan sat on 3/16/22.
//

import SwiftUI

struct PromotionWallet: View {
    
    var promotion: Int
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
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

              SettingsTitleView(title: "Promotion Wallet")

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
                            
                            Text("₹ \(promotion)")
                                .fontWeight(.regular)
                                .font(.custom("Futura", size: 50))

                        }
                        .padding(.leading)
                        Spacer()
                    }
                
                    Spacer()
                
                    HStack {
                        Spacer()
                        Button {
                            // Add Money
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
                        .padding(.trailing)
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
}

struct PromotionWalletBottom: View {
    
    var cost: Int
    
    var body : some View {
        
        ZStack {
            Rectangle()
              .frame(width: UIScreen.screenWidth, height: 0.17 * UIScreen.screenHeight)
              .foregroundColor(Color("deepGreen"))
              .cornerRadius(30, corners: [.topLeft, .topRight])
              .ignoresSafeArea(.all)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Adding Amount in wallet")
                        .fontWeight(.regular)
                        .font(.custom("Lato", size: 14))
                        .foregroundColor(Color.white)
                    Text("Rs. \(cost)")
                        .fontWeight(.regular)
                        .font(.custom("Lato", size: 20))
                        .foregroundColor(Color.white)
                }
                .padding(.leading)
                
                Spacer()
                
                Button(action: {
                  // Pay
                }, label: {
                  Text("Add")
                    .font(.body.weight(.bold))
                    .font(.custom("Lato", size: 16))
                    .foregroundColor(Color("textGreen"))
                    .frame(width: 0.31 * UIScreen.screenWidth, height: 0.065 * UIScreen.screenHeight, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding(.trailing)
                })

            }
            
            
            
        }
    }
}

struct PromotionWallet_Previews: PreviewProvider {
    static var previews: some View {
        PromotionWallet(promotion: 1000)
    }
}
