//
//  SetDiscountViewModel.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 13/03/22.
//

import SwiftUI
import Firebase

class SetDiscountViewModel: ObservableObject {
  var ref: DatabaseReference?
  private var db = Database.database()

  func uploadDiscounts(uid: String, discounts: [Discount]) {
    let ref = db.reference().child("Merchant_data").child("\(uid)/Shop_Information/discounts")

    for discount in 0..<discounts.count {
      let ref1 = ref.child("\(discount)")
      ref1.child("discountPercentage").setValue(discounts[discount].discountPercentage)
      ref1.child("minBillAmount").setValue(discounts[discount].minBillAmount)
    }
  }
}

struct Discount {
  var discountPercentage: Double
  var minBillAmount: String
}
