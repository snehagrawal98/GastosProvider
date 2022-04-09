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


      }
  }
}
