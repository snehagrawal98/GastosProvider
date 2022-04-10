//
//  ImagesViewModel.swift
//  GastosProvider
//
//  Created by ehsan sat on 4/10/22.
//

import Foundation


class ImagesViewModel: ObservableObject {
    @Published var merchantArray: [Merchant] = [Merchant]()
    
    func getAllMerchants() {
        let firebaseManager = FirebaseMnager()
        firebaseManager.getAllShops { res in

            self.merchantArray = res
//            print(self.merchantArray)

        }

    }

}
