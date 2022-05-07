//
//  ContentView.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 18/01/22.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("log_Status") var status = false
 // @State private var showOnboardingScreen = true
  @StateObject var loginViewModel = LoginViewModel()
  @StateObject var currentUser = CurrentUser()
  @State var timer: Timer?

    var body: some View {
        ZStack {
//          if  status && loginViewModel.didSetPin && loginViewModel.didEnterMerchantDetails && loginViewModel.didSetPaymentInfo && loginViewModel.didSetDiscounts && loginViewModel.didAgree && loginViewModel.madeRegistrationPayment {
//            HomeScreen()
//          }
//          else
//          if status && loginViewModel.didSetPin && loginViewModel.didEnterMerchantDetails && loginViewModel.didSetPaymentInfo && loginViewModel.didSetDiscounts && loginViewModel.didAgree {
//            RegistrationPayment()
//          } else if status && loginViewModel.didSetPin && loginViewModel.didEnterMerchantDetails && loginViewModel.didSetPaymentInfo && loginViewModel.didSetDiscounts {
//            UserAgreement()
//          } else if status && loginViewModel.didSetPin && loginViewModel.didEnterMerchantDetails && loginViewModel.didSetPaymentInfo {
//            SetDiscount()
//          } else if status && loginViewModel.didSetPin && loginViewModel.didEnterMerchantDetails {
//            AddQRs()
//          }
          if status && loginViewModel.didSetPin && loginViewModel.madeRegistrationPayment {
            HomeScreen()
          }
          else if status && loginViewModel.didSetPin {
            ProgressView("Waiting For Registration Payment Confirmation...")
            //BasicDetails()
          } else if status {
            SetPin()
          } else {
            EnterMobileNumber()
          }
        }
        .environmentObject(loginViewModel)
        .environmentObject(currentUser)
        .onAppear {
          timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            loginViewModel.didCompleteRegistartionPayment()
            if loginViewModel.madeRegistrationPayment {
              timer?.invalidate()
            }
          }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}

