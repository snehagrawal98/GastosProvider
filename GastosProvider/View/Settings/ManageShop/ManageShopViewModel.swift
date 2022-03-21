//
//  ManageShopViewModel.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 20/03/22.
//

import SwiftUI
import Firebase
import FirebaseStorage

class ManageShopViewModel: ObservableObject {
  @Published var images = [UIImage]()

  var ref: DatabaseReference?
  private var db = Database.database()

  let storage = Storage.storage().reference()

  func uploadImagesToStorage(uid: String) {
    let ref = storage.child("\(uid)/shopImage")
    let imagesRange = 0..<images.count

    for image in imagesRange {

      guard let imageData = images[image].jpegData(compressionQuality: 0.5) else { return }

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
          self.uploadImageURLsToRealtime(uid: uid, url: "\(url)", imageNumber: (image + 1))
        }
      }
    }
  }

  func uploadImageURLsToRealtime(uid: String, url: String, imageNumber: Int) {
    let ref = db.reference().child("Merchant_data").child("\(uid)/Shop_Information")
      ref.child("shopImageUri\(imageNumber)").setValue("\(url)")
  }

}
