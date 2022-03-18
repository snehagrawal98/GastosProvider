//
//  PromotionWallet.swift
//  GastosProvider
//
//  Created by ehsan sat on 3/16/22.
//

import SwiftUI

struct PromotionWallet: View {
    
    var promotion: Int
    
    var body: some View {
        
        VStack {
            
            HStack {
                Image(systemName: "arrow.left")
                    .padding(.horizontal)
                Text("Promotion Wallet")
                    .fontWeight(.regular)
                    .font(.custom("Futura", size: 25))
                    .padding(.leading)
                Spacer()
            }
            

            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.white)
                    .shadow(radius: 20)
                VStack {
                    Text("Wallet Ballance")
                        .fontWeight(.semibold)
                        .font(.custom("Futura", size: 18))
                    Text("₹ \(promotion)")
                        .fontWeight(.regular)
                        .font(.custom("Futura", size: 50))
                }
                
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
            }
            .padding(.horizontal)
            
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
