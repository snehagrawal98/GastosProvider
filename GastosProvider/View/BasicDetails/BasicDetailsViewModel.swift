//
//  BasicDetailsViewModel.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 18/03/22.
//

import SwiftUI
import Firebase
import FirebaseStorage

class BasicDetailsViewModel: ObservableObject {
  @State var didEnterMerchantDetails = false

  // Owner Info
  @Published var ownerName = ""
  @Published var phoneNumber = ""
  @Published var emailAddress = ""

  // Shop Info
  @Published var shopName = ""
  @Published var shopAddress = ""
  @Published var deliveryEnabled = true
  @Published var pickupEnabled = true
  @Published var shopCity = ""
  @Published var shopLocation = ""
  @Published var shopCategory = ""

  var ref: DatabaseReference?
  private var db = Database.database()

  let storage = Storage.storage().reference()

  func uploadImageToStorage(uid: String, image: UIImage) {
    let ref = storage.child("\(uid)/shopImagekk")
    guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }

    let metadata = StorageMetadata()
    metadata.contentType = "image/jpeg"

    ref.putData(imageData, metadata: metadata) { metadata, error in
      if error != nil {
        print(error!.localizedDescription)
        return
      }

      ref.downloadURL { url, error in
        if error != nil {
          print(error!.localizedDescription)
          return
        }
        print(url?.absoluteString ?? "")

        guard let url = url else { return }
        self.uploadImageURLsToRealtime(uid: uid, url: "\(url)")
      }
    }
    didEnterMerchantDetails = true
  }

  func uploadImageURLsToRealtime(uid: String, url: String) {
    let ref = db.reference().child("Merchant_data").child("\(uid)/Shop_Information")
      ref.child("shopImageurl").setValue("\(url)")
    didEnterMerchantDetails = true
  }

  func registerMerchantDetails(uid: String) {
    let ref1 = db.reference().child("Merchant_data").child("\(uid)/Account_Information")
    let ref2 = db.reference().child("Merchant_data").child("\(uid)/Shop_Information")

    let deliveryEnabled = self.deliveryEnabled ? "true" : "false"
    let pickupEnabled = self.pickupEnabled ? "true" : "false"

    ref1.child("emailAddress").setValue(emailAddress)
    ref1.child("ownerName").setValue(ownerName)

    ref2.child("category").setValue(shopCategory)
    ref2.child("shopAddress").setValue(shopAddress)
    ref2.child("shopCity").setValue(shopCity)
    ref2.child("homeDelivery").setValue(deliveryEnabled)
    ref2.child("pickup").setValue(pickupEnabled)
    ref2.child("shopName").setValue(shopName)
    didEnterMerchantDetails = true
  }

}
