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
  @AppStorage("didEnterPin1") var didEnterPin1 = false
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
     // self.registerMerchant()
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

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.mm.dd.HH.mm.ss"
    var timeStamp = formatter.string(from: Date())

    // account info
    ref.child("\(uid)/Account_Information/phoneNumber").setValue(phoneNumber)

   // ref.child("\(uid)/Account_Information/platform").setValue("iOS")

//    ref.child("\(uid)/Account_Information/emailAddress").setValue("")
//    ref.child("\(uid)/Account_Information/ownerName").setValue("")
//    ref.child("\(uid)/Account_Information/pin").setValue("")
//    ref.child("\(uid)/Account_Information/registrationPayment").setValue(0)
//    ref.child("\(uid)/Account_Information/registrationPaymentDone").setValue(false)
   // ref.child("\(uid)/Account_Information/registrationTime").setValue(timeStamp)
//    ref.child("\(uid)/Account_Information/salesCode").setValue("")
//    ref.child("\(uid)/Account_Information/walletBranding").setValue("")
//    ref.child("\(uid)/Account_Information/walletPromotion").setValue("")

    // payment info
//    let ref1 = db.reference().child("Merchant_data").child("\(uid)/Payment_Information/\(0)")
//    //let ref2 = db.reference().child("Merchant_data").child("\(uid)/Payment_Information/\(0)")
//    ref1.child("merchantId").setValue("")
//    ref1.child("primary").setValue(false)
//    ref1.child("upiId").setValue("")
//    ref1.child("upiName").setValue("")
//    ref1.child("rawString").setValue("")

    // registration payment info
//    let ref3 = db.reference().child("Merchant_data").child("\(uid)/Registration_Payment_Info")
//
//    ref3.child("bankname").setValue("")
//    ref3.child("banktxnid").setValue("")
//    ref3.child("checksumhash").setValue("")
//    ref3.child("currency").setValue("")
//    ref3.child("gatewayname").setValue("")
//    ref3.child("mid").setValue("")
//    ref3.child("orderid").setValue("")
//    ref3.child("paymentmode").setValue("")
//    ref3.child("respcode").setValue("")
//    ref3.child("respmsg").setValue("")
//    ref3.child("status").setValue("")
//    ref3.child("txnamount").setValue("")
//    ref3.child("txndate").setValue("")
//    ref3.child("txnid").setValue("")

    // shop info
//    let ref4 = db.reference().child("Merchant_data").child("\(uid)/Shop_Information")
//
//    ref4.child("category").setValue("")
//    ref4.child("creationTimestamp").setValue(0)

//    // discounts
//    let ref5 = db.reference().child("Merchant_data").child("\(uid)/Shop_Information/discounts/\(0)")
//
//    ref5.child("discountPercentage").setValue(0)
//    ref5.child("minBillAmount").setValue(0)
//
//    ref4.child("homeDelivery").setValue(true)
//    ref4.child("pickUp").setValue(true)
//    ref4.child("shopAddress").setValue("")
//    ref4.child("shopAddressLatitude").setValue("")
//    ref4.child("shopAddressLongitude").setValue("")
//    ref4.child("shopArea").setValue("")
//    ref4.child("shopDistrict").setValue("")
//
//    ref4.child("shopImageUri").setValue("")
//    ref4.child("shopImageUri1").setValue("")
//    ref4.child("shopImageUri2").setValue("")
//    ref4.child("shopImageUri3").setValue("")
//    ref4.child("shopImageUri4").setValue("")
//
//    ref4.child("shopName").setValue("")
//    ref4.child("shopState").setValue("")

  }

  func registerMerchantPin() {
    let ref = db.reference().child("Merchant_data").child("\(uid)/Account_Information")

    ref.child("pin").setValue(pin)
    didSetPin = true
  }

//  func registerMerchantPaymentInfo() {
//    let _ = db.reference().child("Merchant_data").child("\(uid)/Payment_Information")
//
//    let qrRange = 0..<qrCodes.count
//    for qrCode in qrRange {
//      let ref2 = db.reference().child("Merchant_data").child("\(uid)/Payment_Information/\(qrCode)")
//
////      ref2.child("merchantId").setValue(qrCodes[qrCode].merchantId)
//      ref2.child("merchantId").setValue("")
//      ref2.child("primary").setValue(qrCodes[qrCode].isPrimary)
//      ref2.child("upiId").setValue(qrCodes[qrCode].upiAdress)
//      ref2.child("upiName").setValue(qrCodes[qrCode].qrName)
//      ref2.child("rawString").setValue(qrCodes[qrCode].rawString)
//    }
//    didSetPaymentInfo = true
//  }

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

    
    func didEnterPin() {
      let ref = db.reference().child("Merchant_data/\(uid)/Account_Information")
      ref.observe(DataEventType.value) { snapshot in
        if snapshot.hasChild("pin") {
          let value = snapshot.value as? NSDictionary
          let status = value?["pin"] as? String ?? ""
          if status != ""  {
            self.didEnterPin1 = true
          }
        }
      }
    }
    
    
  func didCompleteRegistartionPayment() {
    let ref = db.reference().child("Merchant_data/\(uid)/Account_Information")
    ref.observe(DataEventType.value) { snapshot in
      if snapshot.hasChild("registrationPaymentDone") {
        let value = snapshot.value as? NSDictionary
        let status = value?["registrationPaymentDone"] as? Bool ?? false
        if status == true {
          self.madeRegistrationPayment = true
        }
      }
    }
  }

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
