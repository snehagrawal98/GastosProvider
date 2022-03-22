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
}

struct BDSale {
  var id: String
  var name: String
}

