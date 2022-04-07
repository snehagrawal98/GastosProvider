//
//  RegistrationPaymentViewModel.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 22/03/22.
//

import SwiftUI
import Firebase

class RegistrationPaymentViewModel: ObservableObject {
  @Published var bDSales = [BDSale]()

  var ref: DatabaseReference?
  private var db = Database.database()

  func getBDSales() {
    let ref = db.reference().child("Merchant_data/BDSales")

    ref.observe(DataEventType.value) { snapshop in
      if snapshop.childrenCount > 0 {
        for bDSale in snapshop.children.allObjects as! [DataSnapshot] {
          let id = bDSale.key
          let name = bDSale.childSnapshot(forPath: "name").value as? String
          self.bDSales.append(BDSale(id: id, name: name ?? "name"))
        }
      }
    }
  }

  func verifyPromoCode(promoCode: String) -> String {
    for bDSale in bDSales {
      if bDSale.id == promoCode {
        return bDSale.name
      }
    }
    return "Incorrect PromoCode"
  }

  func uploadPaymentData(response: Response, uid: String) {
    let ref1 = db.reference().child("Merchant_data").child("\(uid)/Registration_Payment_Info")

    ref1.child("banktxnid").setValue(response.BANKTXNID?.optionalStripped)
    ref1.child("checksumhash").setValue(response.CHECKSUMHASH?.optionalStripped)
    ref1.child("currency").setValue(response.CURRENCY?.optionalStripped)
    ref1.child("gatewayname").setValue(response.GATEWAYNAME?.optionalStripped)
    ref1.child("mid").setValue(response.MID?.optionalStripped)
    ref1.child("orderid").setValue(response.ORDERID?.optionalStripped)
    ref1.child("paymentmode").setValue(response.PAYMENTMODE?.optionalStripped)
    ref1.child("respcode").setValue(response.RESPCODE?.optionalStripped)
    ref1.child("respmsg").setValue(response.RESPMSG?.optionalStripped)
    ref1.child("status").setValue(response.STATUS?.optionalStripped)
    ref1.child("txnamount").setValue(response.TXNAMOUNT?.optionalStripped)
    ref1.child("txndate").setValue(response.TXNDATE?.optionalStripped)
    ref1.child("txnid").setValue(response.TXNID?.optionalStripped)
  }
}

struct BDSale {
  var id: String
  var name: String
}

struct Response: Codable {
  var ORDERID, MID, TXNID, TXNAMOUNT, PAYMENTMODE, CURRENCY, TXNDATE, STATUS, RESPCODE, RESPMSG, GATEWAYNAME, BANKTXNID, CHECKSUMHASH: String?
}
