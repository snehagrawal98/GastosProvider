//
//  UserAgreementModel.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 12/03/22.
//

import SwiftUI
import Firebase

class UserAgreementModel: ObservableObject {
  @Published var agreement: String = ""

  var ref: DatabaseReference?
  private var db = Database.database()

  func fetchAgreement() {
    let ref = db.reference().child("Merchant_agreements/user_agreement")

    ref.getData(completion: { error, snapshot in
      guard error == nil else {
        print(error!.localizedDescription)
        return
      }
      self.agreement = snapshot.value as? String ?? ""
    })
  }
}
