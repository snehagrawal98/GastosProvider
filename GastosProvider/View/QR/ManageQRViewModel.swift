//
//  AddQRsViewModel.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 10/04/22.
//

import SwiftUI
import Firebase

class ManageQRViewModel: ObservableObject {
  // Payment Info
  @Published var qrCodes = [QrCode]()
    @StateObject var loginViewModel: LoginViewModel = LoginViewModel()
    
  var ref: DatabaseReference?
  private var db = Database.database()

  func readPaymentInfo(uid: String) {
    let ref = db.reference().child("Merchant_data/\(uid)/Payment_Information")
    var qrCodesFromFirebase = [QrCode]()
    ref.observe(DataEventType.value) { snapshot in
      if snapshot.childrenCount > 0 {
        for qr in snapshot.children.allObjects as! [DataSnapshot] {
          //let merchantId = qr.childSnapshot(forPath: "merchantId").value as? String
          let primary = qr.childSnapshot(forPath: "primary").value as? Bool
          let _ = qr.childSnapshot(forPath: "rawString").value as? String
          let upiId = qr.childSnapshot(forPath: "upiId").value as? String
          let upiName = qr.childSnapshot(forPath: "upiName").value as? String
          let rawString = qr.childSnapshot(forPath: "rawString").value as? String

//          let qrCode = QrCode(qrName: upiName ?? " ", upiAdress: upiId ?? " ", merchantId: merchantId ?? " ", isPrimary: primary ?? false)
          let qrCode = QrCode(qrName: upiName ?? "", upiAdress: upiId ?? "", isPrimary: primary ?? false, rawString: rawString ?? "")

          qrCodesFromFirebase.append(qrCode)
        }
      }
      self.qrCodes = qrCodesFromFirebase
      
      }

  }
    
    func getRawString() -> String {
        var rawString: String = ""
        for qrCode in loginViewModel.qrCodes {
            if qrCode.isPrimary == true {
                rawString = qrCode.rawString
            }
        }
        return rawString
    }
}
