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

  func readShopInfo(uid: String) {
    let ref = db.reference().child("Merchant_data/\(uid)/Shop_Information")

    ref.observe(DataEventType.value) { snapshot in
        let value = snapshot.value as? NSDictionary
        self.shopName = value?["shopName"] as? String ?? ""
      }
  }
}
