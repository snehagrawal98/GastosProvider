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
  @Published var discounts = [Discount]()
  @Published var didUploadDiscounts = false

  func uploadDiscounts(uid: String) {
    let ref = db.reference().child("Merchant_data").child("\(uid)/Shop_Information/discounts")

    for discount in 0..<discounts.count {
      let ref1 = ref.child("\(discount)")
      ref1.child("discountPercentage").setValue(discounts[discount].discountPercentage)
      ref1.child("minBillAmount").setValue(discounts[discount].minBillAmount)
    }
    didUploadDiscounts = true
  }
}

struct Discount {
  var discountPercentage: Double
  var minBillAmount: String
}
