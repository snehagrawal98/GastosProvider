//
//  RegistrationPayment.swift
//  GastosProvider
//
//  Created by ehsan sat on 3/12/22.
//

import SwiftUI

struct RegistrationPayment: View {

  @State var promotionCode: String = ""
  @State var promoCodeApplied = false
  @State var isShowingPaymentPage = false
  var cost: Int {
    return promoCodeApplied ? 299 : 599
  }
  @EnvironmentObject var loginViewModel: LoginViewModel
  @StateObject var registrationPaymentViewModel = RegistrationPaymentViewModel()

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

            WelcomePack(promoCodeApplied: promoCodeApplied)

            Spacer()

            MakeBrand(promoCodeApplied: promoCodeApplied)


            Spacer()

            CodePromotion(promotionCode: $promotionCode, promoCodeApplied: $promoCodeApplied)

            Spacer()

          RegistrationPaymentBottom(isShowingPaymentPage: $isShowingPaymentPage, promoCodeApplied: promoCodeApplied)

        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
          registrationPaymentViewModel.getBDSales()
        }
        .environmentObject(registrationPaymentViewModel)
    }
}

struct CodePromotion: View {
    @Binding var promotionCode: String
    @EnvironmentObject var registrationPaymentViewModel: RegistrationPaymentViewModel
  @Binding var promoCodeApplied: Bool
    var body : some View {
      VStack {
        ZStack {
              ZStack {
                  RoundedRectangle(cornerRadius: 20)
                      .foregroundColor(Color.white)
                  RoundedRectangle(cornerRadius: 20)
                      .stroke(Color.gray.opacity(0.6), lineWidth: 1)
              }

              HStack {
                if promoCodeApplied {
                  Text(promotionCode)
                    .padding()
                    .foregroundColor(.gray.opacity(0.8))
                } else {
                  TextField("Promo Code", text: $promotionCode)
                    .padding()
                    .foregroundColor(.gray.opacity(0.8))
                }
                      //.modifier(CodePromotionPlaceholer(showPlaceholder: promotionCode.isEmpty,
                                                       // placeholderText: "Promo Code"))
                    //  .foregroundColor(Color.white)

                  Spacer()

                  Button(action: {
                    promotionCode = registrationPaymentViewModel.verifyPromoCode(promoCode: promotionCode)
                    if promotionCode != "Incorrect PromoCode" {
                      promoCodeApplied = true
                    }
                  }, label: {
                    if promoCodeApplied {
                      Text("Applied")
                        .font(.body.weight(.medium))
                        .font(.custom("Roboto", size: 14))
                        .foregroundColor(Color("textGreen"))
                        .padding()
                        .padding()
                    } else {
                      Text("Apply")
                        .font(.body.weight(.bold))
                        .font(.custom("Roboto", size: 14))
                        .foregroundColor(Color.white)
                        .frame(width: 0.31 * UIScreen.screenWidth, height: 0.065 * UIScreen.screenHeight, alignment: .center)
                        .background(Color("textGreen"))
                        .cornerRadius(15)
                        .padding()
                    }
                  })
              }
          }
          .padding(.horizontal)
          .shadow(radius: 20)
        .padding(.bottom, 0)
      }
      .frame(height: UIScreen.screenHeight * (53 / 810))
    }
}

//struct CodePromotionPlaceholer: ViewModifier {
//
//    var showPlaceholder: Bool
//    var placeholderText: String
//
//    func body(content: Content) -> some View {
//        ZStack(alignment: .leading) {
//            if showPlaceholder {
//                Text(placeholderText)
//                    .foregroundColor(Color.black.opacity(0.8))
//                    .padding(.horizontal, 15)
//            }
//            content
//                .foregroundColor(Color.white)
//                .padding(5)
//        }
//    }
//}

struct WelcomePack: View {
  var promoCodeApplied: Bool

    var body : some View {
      VStack {
        ZStack {
              RoundedRectangle(cornerRadius: 10)
                  .foregroundColor(Color("textGreen"))

              HStack {
                  Spacer()
                  Image("GastosLightWhite")
                      .resizable()
                      .scaledToFit()
                      .opacity(0.15)
                      .offset(x: 20)
              }

              VStack {
                Text("Welcome Pack")
                  .fontWeight(.bold)
                  .font(.custom("Futura", size: 18))
                  .foregroundColor(Color.white)
                  .padding(.top)
                Spacer()
                if !promoCodeApplied {
                  Spacer()
                  Spacer()
                  Spacer()
                  Spacer()
                }

                VStack {
                  Spacer()
                  HStack {
                      Text("Registration Cost")
                          .fontWeight(.regular)
                          .font(.custom("Futura", size: 16))
                          .foregroundColor(Color.white)
                          .padding(.leading)
                      Spacer()
                      VStack(alignment: .trailing) {
                          Text("Rs. 599")
                              .fontWeight(.regular)
                              .font(.custom("Futura", size: 16))
                              .foregroundColor(Color.white)
                      }
                      .padding(.trailing)
                  }

                  if promoCodeApplied {
                    HStack {
                        Text("Discount")
                            .fontWeight(.regular)
                            .font(.custom("Futura", size: 16))
                            .foregroundColor(Color.white)
                            .padding(.leading)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Rs. 300")
                                .fontWeight(.regular)
                                .font(.custom("Futura", size: 16))
                                .foregroundColor(Color.white)
                        }
                        .padding(.trailing)
                    }

                    HStack {
                        Text("Sub Total")
                            .fontWeight(.regular)
                            .font(.custom("Futura", size: 16))
                            .foregroundColor(Color.white)
                            .padding(.leading)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Rs. 299")
                                .fontWeight(.regular)
                                .font(.custom("Futura", size: 16))
                                .foregroundColor(Color.white)
                        }
                        .padding(.trailing)
                    }
                  }

                  VStack {
                    Spacer()
                    HStack {
                      Spacer()
                      Text("Inclusive of all taxes")
                          .fontWeight(.regular)
                          .font(.custom("Futura", size: 10))
                          .foregroundColor(Color.white)
                          .padding(.bottom, 4)
                          .padding(.trailing, 4)
                    }
                  }
                  .padding(.bottom)
                  .padding(.top, -20)

                }
              }
          }
      }
      .frame(height: UIScreen.screenHeight * (136 / 812))
      .padding(.horizontal)

    }
}

struct MakeBrand: View {
  var promoCodeApplied : Bool
  var advertisementAmount: Int {
    return promoCodeApplied ? 200 : 600
  }
  var graphicDesignAmount: Int {
    return promoCodeApplied ? 1000 : 2400
  }
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
                        .frame(width: UIScreen.screenWidth * (119/375), height: UIScreen.screenHeight * (227/810))

                  Spacer()
                  VStack(alignment: .trailing) {
                      Text("For Advertisement Free")
                          .fontWeight(.regular)
                          .font(.custom("Futura", size: 16))
                      Text("Worth Rs \(advertisementAmount)")
                          .fontWeight(.regular)
                          .font(.custom("Futura", size: 16))
                          .foregroundColor(Color("textGreen"))
                      Text("For Graphic Request Free")
                          .fontWeight(.regular)
                          .font(.custom("Futura", size: 16))
                      Text("Worth Rs \(graphicDesignAmount)")
                          .fontWeight(.regular)
                          .font(.custom("Futura", size: 16))
                          .foregroundColor(Color("textGreen"))
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
  @Binding var isShowingPaymentPage: Bool
  var promoCodeApplied: Bool
  @EnvironmentObject var loginViewModel: LoginViewModel
  var cost: Int {
    return promoCodeApplied ? 299 : 599
  }
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
                
                //Link(destination: URL(string: "https://gastos-paytm-gatway.herokuapp.com/paywithpaytm?amount=\(cost)&uid=\(loginAuthViewModel.uid)")!)
//              NavigationLink(destination: {
//                PaymentView(url: URL(string: "https://gastos-paytm-gatway.herokuapp.com/paywithpaytm?amount=\(cost)&uid=\(loginViewModel.uid)")!)
//              }, label: {

              Button(action: {
                isShowingPaymentPage.toggle()
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
             // }) //{
                    //Button(action: {
                      //loginViewModel.madeRegistrationPayment = true
                        
                    //}, label: {

                    //})

                //}
//                .onTapGesture {
//                    loginViewModel.madeRegistrationPayment = true
//
//                }
            }
        }
        .fullScreenCover(isPresented: $isShowingPaymentPage, content: {
          PaymentView(url: URL(string: "https://gastos-paytm-gatway.herokuapp.com/paywithpaytm?amount=\(cost)&uid=ub3Cb1sdBaaTKww6kDSzh1QDPjc2")!)
                               //\(loginViewModel.uid)")!)
        })
    }
}

struct RegistrationPayment_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPayment()
    }
}

