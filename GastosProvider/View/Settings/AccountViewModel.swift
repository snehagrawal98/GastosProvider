//
//  AccountViewModel.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 09/04/22.
//

import SwiftUI
import Firebase

class AccountViewModel: ObservableObject {
  var ref: DatabaseReference?
  private var db = Database.database()
    @Published var email = ""
    @Published var ownerName = ""
    @Published var phone = ""
    

  func readShopInfo(uid: String) {
    let ref = db.reference().child("Merchant_data/\(uid)/Account_Information")

    ref.observe(DataEventType.value) { snapshot in
        let value = snapshot.value as? NSDictionary
        self.email = value?["emailAddress"] as? String ?? ""
        self.ownerName = value?["ownerName"] as? String ?? ""
        self.phone = value?["phoneNumber"] as? String ?? ""
      }
  }
}

