//
//  UserModel.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 10/03/22.
//

import Foundation
import SwiftUI

// class to store current user data
class CurrentUser: ObservableObject {
  @Published var uid = " "
  @Published var dob = " "
  @Published var email = " "
  @Published var gender = " "
  @Published var pin = " "
  @Published var name = " "
  @Published var phone = " "
}
