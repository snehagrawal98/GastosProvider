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
  @Published var timestamp = "\(Date().millisecondsSince1970)"
  @Published var shopName = ""
  @Published var deliveryEnabled = true
  @Published var pickupEnabled = true

  @Published var shopAddress = ""
  @Published var shopAddressLatitude = ""
  @Published var shopAddressLongitude = ""
  @Published var shopArea = ""
  @Published var shopDistrict = ""
  @Published var shopState = ""
  @Published var shopCategory = ""

  var ref: DatabaseReference?
  private var db = Database.database()

  let storage = Storage.storage().reference()

  func uploadImageToStorage(uid: String, image: UIImage) {
    let ref = storage.child("\(uid)/shopImage")
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
      ref.child("shopImageUri").setValue("\(url)")
    didEnterMerchantDetails = true
  }

  func registerMerchantDetails(uid: String) {
    let ref1 = db.reference().child("Merchant_data").child("\(uid)/Account_Information")
    let ref2 = db.reference().child("Merchant_data").child("\(uid)/Shop_Information")

    //let deliveryEnabled = self.deliveryEnabled ? "true" : "false"
    //let pickupEnabled = self.pickupEnabled ? "true" : "false"

    ref1.child("emailAddress").setValue(emailAddress)
    ref1.child("ownerName").setValue(ownerName)
      
    ref2.child("category").setValue(shopCategory)
    ref2.child("creationTimestamp").setValue(timestamp)
    
    ref2.child("homeDelivery").setValue(deliveryEnabled)
    ref2.child("pickUp").setValue(pickupEnabled)

    ref2.child("shopAddress").setValue(shopAddress)
    ref2.child("shopAddressLatitude").setValue(shopAddressLatitude)
    ref2.child("shopAddressLongitude").setValue(shopAddressLongitude)
    ref2.child("shopArea").setValue(shopArea)
    ref2.child("shopDistrict").setValue(shopDistrict)
    ref2.child("shopState").setValue(shopState)

    ref2.child("shopName").setValue(shopName)
    didEnterMerchantDetails = true
  }

  func fetchDistricts(completion: @escaping (States) -> ()) {
    guard let url = URL(string: "https://raw.githubusercontent.com/zimmy9537/Indian-States-And-Districts/master/states-and-districts.json" ) else { return }

    URLSession.shared.dataTask(with: url) {(data, _, error) in
      if error != nil {
        print(error?.localizedDescription)
        return
      }

      let states = try! JSONDecoder().decode(States.self, from: data!)

      DispatchQueue.main.async {
        completion(states)
      }
    }.resume()
  }
}

struct States: Codable {
  let states: [IndianState]
}
struct IndianState: Codable {
  let state: String
  let districts: [String]
}


extension Date {
    var millisecondsSince1970:Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
