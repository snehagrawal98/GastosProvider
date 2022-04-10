//
//  HomeScreenViewModel.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 16/03/22.
//

import SwiftUI
import Firebase

class HomeScreenViewModel: ObservableObject {
  var ref: DatabaseReference?
  private var db = Database.database()
    @Published var shopName = ""
    @Published var shopAddress = ""
    @Published var shopCity = ""
    @Published var category = ""
    @Published var shopLocation = ""
    @Published var delivery = false
    @Published var pickUp = false
    @Published var discounts: [DiscountModel] = []

  func readShopInfo(uid: String) {
    let ref = db.reference().child("Merchant_data/\(uid)/Shop_Information")

    ref.observe(DataEventType.value) { snapshot in
        let value = snapshot.value as? NSDictionary
        self.shopName = value?["shopName"] as? String ?? ""
        self.shopAddress = value?["shopAddress"] as? String ?? ""
        self.shopCity = value?["shopState"] as? String ?? ""
        self.category = value?["category"] as? String ?? ""
        self.shopLocation = value?["shopArea"] as? String ?? ""
        self.delivery = value?["shopName"] as? Bool ?? false
        self.pickUp = value?["shopName"] as? Bool ?? false
        
        if let discountsArray = value?["discounts"] as? [[String: Any]] {
            for discount in discountsArray {
                let discountPercentage = discount["discountPercentage"] as? Int ?? 0
                let minimumOrderForDiscount = discount["minimumOrderForDiscount"] as? String ?? "0"
                let oneDiscount = DiscountModel(discountPercentage: discountPercentage,
                                                minimumOrderForDiscount: minimumOrderForDiscount)
                
                self.discounts.append(oneDiscount)
            }
        }

      }
  }
}

struct DiscountModel: Hashable {
    let discountPercentage: Int
    let minimumOrderForDiscount: String
}
