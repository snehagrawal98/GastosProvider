//
//  QRCodeModel.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 10/03/22.
//

import SwiftUI

// data model for qr codes
struct QrCode: Hashable {
  var qrName: String
  var upiAdress: String
  //var merchantId: String
  var isPrimary: Bool
  var rawString: String
}
