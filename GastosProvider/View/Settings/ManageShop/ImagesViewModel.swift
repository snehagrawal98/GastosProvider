//
//  ImagesViewModel.swift
//  GastosProvider
//
//  Created by ehsan sat on 4/10/22.
//

import Foundation


class ImagesViewModel: ObservableObject {
    @Published var merchantArray: [Merchant] = [Merchant]()
    @Published var imagesArray: [String] = [String]()
    
    func getImages(uid: String) {
        let firebaseManager = FirebaseMnager()
        let imagesArray: [String] = firebaseManager.getAllImages(uid: uid)
        self.imagesArray = imagesArray
    }
    
    func getAllMerchants() {
        let firebaseManager = FirebaseMnager()
        firebaseManager.getAllShops { res in

            self.merchantArray = res
//            print(self.merchantArray)

        }

    }

}
