//
//  ManageAds.swift
//  GastosProvider
//
//  Created by ehsan sat on 3/14/22.
//

import SwiftUI

struct ManageAds: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.left")
                    .padding(.horizontal)
                Text("Manage Ads")
                    .fontWeight(.regular)
                    .font(.custom("Futura", size: 25))
                    .padding(.leading)
                Spacer()
            }
            .padding(.vertical)
            WalletBrand(promotion: 200, branding: 1000)
            
            AddAlert()
            
            Spacer()

        }
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
                    
                    Spacer()
                    
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
                .padding(.bottom)
            }
        }
        .frame(height: UIScreen.screenHeight * (253 / 812))
        .padding(.horizontal)
        .shadow(radius: 20)
    }
}

struct ManageAds_Previews: PreviewProvider {
    static var previews: some View {
        ManageAds()
    }
}
