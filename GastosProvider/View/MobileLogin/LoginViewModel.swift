//
//  LoginViewModel.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 21/02/22.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
  @Published var code = ""

  // data model for error view
  @Published var errorMsg = ""
  @Published var error = false

  // storing code for verification
  @Published var CODE = ""

  @Published var gotoVerify = false

  // user logged status
  @AppStorage("log_Status") var status = false
  @AppStorage("didSetPin") var didSetPin = false
  @AppStorage("didEnterMerchantDetails") var didEnterMerchantDetails = false
  @AppStorage("didSetPaymentInfo") var didSetPaymentInfo = false
  @AppStorage("didAgree") var didAgree = false
  @AppStorage("didSetDiscounts") var didSetDiscounts = false
  @AppStorage("madeRegistrationPayment") var madeRegistrationPayment = false

  // Loading view
  @Published var loading = false

  // Sending code to user
  func sendCode() {

    // enabling testing code
    // disable when you need to test with real device
    //Auth.auth().settings?.isAppVerificationDisabledForTesting = true

    let number = "+91\(phoneNumber)"
    PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { (CODE, err) in

      if let error = err {

        self.errorMsg = error.localizedDescription
        withAnimation { self.error.toggle() }
        return
      }

      self.CODE = CODE ?? ""
      self.gotoVerify = true
    }
  }

  func verifyCode() {

    let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.CODE, verificationCode: code)

    loading = true

    Auth.auth().signIn(with: credential) { (result, err) in

      self.loading = false

      if let error = err {
        self.errorMsg = error.localizedDescription
        withAnimation{ self.error.toggle() }
        return
      }
      // else user logged in successfully
      withAnimation{ self.status = true }
      // this code is for writing data to realtime database
      self.uid = result?.user.uid ?? ""
      self.registerMerchant()
    }
  }

  func requestCode() {
    sendCode()
    withAnimation {
      self.errorMsg = "code sent successfully"
      self.error.toggle()
    }
  }

  // code for real time database
  var ref: DatabaseReference?
  private var db = Database.database()

  // Account Info
  @AppStorage("uid") var uid = ""
  @Published var pin = ""
  @Published var ownerName = ""
  @Published var phoneNumber = ""
  @Published var emailAddress = ""

  // Shop Info
  @Published var shopName = ""
  @Published var shopAddress = ""
  @Published var deliveryEnabled = true
  @Published var pickupEnabled = true
  @Published var shopCity = ""
  @Published var shopLocation = ""
  @Published var shopCategory = ""
  @Published var discounts = [Discount]()
  @Published var images = [UIImage]()

  // Payment Info
  @Published var qrCodes = [QrCode]()

  // functions
  func registerMerchant() {
    let ref = db.reference().child("Merchant_data")

    ref.child("\(uid)/Account_Information/phoneNumber").setValue(phoneNumber)
  }

  func registerMerchantPin() {
    let ref = db.reference().child("Merchant_data").child("\(uid)/Account_Information")

    ref.child("pin").setValue(pin)
    didSetPin = true
  }

  func registerMerchantPaymentInfo() {
    let _ = db.reference().child("Merchant_data").child("\(uid)/Payment_Information")

    let qrRange = 0..<qrCodes.count
    for qrCode in qrRange {
      let ref2 = db.reference().child("Merchant_data").child("\(uid)/Payment_Information/\(qrCode)")

//      ref2.child("merchantId").setValue(qrCodes[qrCode].merchantId)
      ref2.child("merchantId").setValue("")
      ref2.child("primary").setValue(qrCodes[qrCode].isPrimary)
      ref2.child("upiId").setValue(qrCodes[qrCode].upiAdress)
      ref2.child("upiName").setValue(qrCodes[qrCode].qrName)
      ref2.child("rawString").setValue(qrCodes[qrCode].rawString)
    }
    didSetPaymentInfo = true
  }

  // for reading current user from realtime database
//  func readCurrentUser() {
//    let ref = db.reference().child("Users/\(uid)")
//
//    print("ran till 127")
//    //if self.didShowMainViewOnce == 1 {
//      ref.observe(DataEventType.value) { snapshot in
//        let value = snapshot.value as? NSDictionary
//        self.dob = value?["DOB"] as? String ?? self.dob
//        self.email = value?["Email"] as? String ?? self.email
//        self.gender = value?["Gender"] as? String ?? self.gender
//        self.name = value?["Name"] as? String ?? self.name
//        self.phone = value?["Phone"] as? String ?? self.phone
//        self.pin = value?["Pin"] as? String ?? self.pin
//      }
//    //}
//  }
    
    
}

// class to store current user data
class CurrentUser: ObservableObject {
  @Published var uid = " "
  @Published var dob = " "
  @Published var email = " "
  @Published var gender = " "
  @Published var pin = " "
  @Published var name = " "
  @Published var phone = " "
}
