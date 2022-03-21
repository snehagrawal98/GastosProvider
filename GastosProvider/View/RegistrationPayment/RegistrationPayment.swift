//
//  RegistrationPayment.swift
//  GastosProvider
//
//  Created by ehsan sat on 3/12/22.
//

import SwiftUI

struct RegistrationPayment: View {
    
    @State var promotionCode: String = ""
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "arrow.left")
                    .padding(.leading)
                    .padding(.trailing)
                
                Text("Registration Payment")
                    .fontWeight(.regular)
                    .font(.custom("Futura", size: 25))
                    .padding(.leading)
                
                Spacer()
            }
            
            WelcomePack(cost: 599)
            
            Spacer()
            
            MakeBrand()
                
            
            Spacer()
            
            CodePromotion(promotionCode: $promotionCode)
            
            Spacer()
            
            RegistrationPaymentBottom(cost: 599)
        
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CodePromotion: View {
    @Binding var promotionCode: String
    var body : some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.white)
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
            }
        
            HStack {
                TextField(" ", text: $promotionCode)
                    .modifier(CodePromotionPlaceholer(showPlaceholder: promotionCode.isEmpty,
                                                      placeholderText: "Promo Code"))
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Button(action: {
                  // Apply
                }, label: {
                  Text("Apply")
                    .font(.body.weight(.bold))
                    .font(.custom("Roboto", size: 14))
                    .foregroundColor(Color.white)
                    .frame(width: 0.31 * UIScreen.screenWidth, height: 0.065 * UIScreen.screenHeight, alignment: .center)
                    .background(Color("textGreen"))
                    .cornerRadius(15)
                    .padding()
                })
            }
        }
        .frame(height: UIScreen.screenHeight * (53 / 812))
        .padding(.horizontal)
        .shadow(radius: 20)
        .padding(.bottom, 0)
    }
}

struct CodePromotionPlaceholer: ViewModifier {
    
    var showPlaceholder: Bool
    var placeholderText: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceholder {
                Text(placeholderText)
                    .foregroundColor(Color.black.opacity(0.8))
                    .padding(.horizontal, 15)
            }
            content
                .foregroundColor(Color.white)
                .padding(5)
        }
    }

}

struct WelcomePack: View {
    
    var cost: Int
    
    var body : some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("deepGreen"))
            
            HStack {
                Spacer()
                Image("GastosLightWhite")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.15)
                    .offset(x: 30)
            }
            
            
            VStack {
                Text("Welcome Pack")
                    .fontWeight(.bold)
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(Color.white)
                    .padding(.top)
                Spacer()
                HStack {
                    Text("Registration Cost")
                        .fontWeight(.regular)
                        .font(.custom("Futura", size: 16))
                        .foregroundColor(Color.white)
                        .padding(.leading)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Rs. \(cost)")
                            .fontWeight(.regular)
                            .font(.custom("Futura", size: 16))
                            .foregroundColor(Color.white)
                        Text("Inclusive of all taxes")
                            .fontWeight(.regular)
                            .font(.custom("Futura", size: 10))
                            .foregroundColor(Color.white)
                    }
                    .padding(.bottom)
                    .padding(.trailing)
                }
            }

        }
        .frame(height: UIScreen.screenHeight * (136 / 812))
        .padding(.horizontal)

    }
}

struct MakeBrand: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.white)
                .shadow(radius: 30)
            
            VStack() {
                Text("Make Yourself A Brand With Us")
                    .fontWeight(.regular)
                    .font(.custom("Futura", size: 18))
                    .padding(.leading)
                    .padding(.top)
                
                Spacer()
                HStack {
                    Image("billboard")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("For Advertisement Free")
                            .fontWeight(.regular)
                            .font(.custom("Futura", size: 16))
                        Text("Worth Rs 600")
                            .fontWeight(.regular)
                            .font(.custom("Futura", size: 16))
                        Text("For Graphic Request Free")
                            .fontWeight(.regular)
                            .font(.custom("Futura", size: 16))
                        Text("Worth Rs 2,400")
                            .fontWeight(.regular)
                            .font(.custom("Futura", size: 16))
                    }
                    .padding(.trailing)
                    .padding(.bottom)
                    Spacer()
                }
            }

        }
        .frame(height: UIScreen.screenHeight * (293 / 812))
        .padding(.horizontal)
    }
}

struct RegistrationPaymentBottom: View {
    
    var cost: Int
  @EnvironmentObject var loginViewModel: LoginViewModel

    var body : some View {
        
        ZStack {
            Rectangle()
              .frame(width: UIScreen.screenWidth, height: 0.17 * UIScreen.screenHeight)
              .foregroundColor(Color("deepGreen"))
              .cornerRadius(30, corners: [.topLeft, .topRight])
              .ignoresSafeArea(.all)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Provider Registration Charges")
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
                  loginViewModel.madeRegistrationPayment = true
                }, label: {
                  Text("Pay")
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

struct RegistrationPayment_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPayment()
    }
}

