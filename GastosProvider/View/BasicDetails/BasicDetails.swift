//
//  BasicDetails.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 22/01/22.
//

import SwiftUI

struct BasicDetails: View {
    @State var isShowingImagePicker = false
    @State var image: UIImage?
    @State var shopCategory = ""
  var shopCategories = ["Food & Beverages", "Fashion", "Salon & Spa", "Stores", "Medical", "Others"]
  var shopCategoriesDiscountRange = ["   5-40", "   5-50", "   5-50", "   0-30", "   1-30", "   5-50"]
  @State var showingCategories = false

  @EnvironmentObject var loginViewModel: LoginViewModel
  @StateObject var basicDetailsViewModel = BasicDetailsViewModel()
    @Environment(\.presentationMode) var presentationMode

  // to fetch districts
  @State var states = States(states: [IndianState(state: "", districts: [""])])

  @State var showingStates = false
  @State var showingDistricts = false

  @State var selectedState = ""
  @State var selectedStateIndex = 0
  @State var selectedDistrict = ""
    
    @StateObject var locationManager = LocationManager()
       
       var userLatitude: String {
           return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
       }
       
       var userLongitude: String {
           return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
       }
       

    var body: some View {
      NavigationView {
        ScrollView(.vertical) {
          // Navigation Bar
          HStack {
            Button(action: {
              // back
                presentationMode.wrappedValue.dismiss()
            }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 20, height: 20, alignment: .leading)
                .foregroundColor(.primary)
            })

            Spacer()

            BasicScreensTitle(title: "Basic Details")
            Spacer()
          } //: HSTACK
          .padding()

          // Shop Cover Photo
          ZStack {
            Button(action: {
              isShowingImagePicker.toggle()
            }, label: {
              if let image = self.image {
                Image(uiImage: image)
                  .resizable()
                  .scaledToFit()
                  .frame(width: 0.72 * UIScreen.screenWidth, height: 0.20 * UIScreen.screenHeight, alignment: .center)
                  .background(
                    RoundedRectangle(cornerRadius: 10)
                      .stroke(Color("textGreen").opacity(0.2), lineWidth: 2)
                  )
              } else {
                Text("Shop Cover Photo")
                  .font(.title2.weight(.medium))
                  .foregroundColor(Color("deepGreen"))
                  .frame(width: 0.72 * UIScreen.screenWidth, height: 0.20 * UIScreen.screenHeight, alignment: .center)
                  .background(Color.white.cornerRadius(10))
                  .background(
                    RoundedRectangle(cornerRadius: 10)
                      .stroke(Color("textGreen").opacity(0.2), lineWidth: 2)
                  )
              }
            }) //: BUTTON

            // Plus Button
            Button(action: {
              isShowingImagePicker.toggle()
            }, label: {
              VStack {
                Spacer()
                HStack {
                  Spacer()
                  Image(systemName: "plus")
                    .resizable()
                    .frame(width: 23, height: 23, alignment: .center)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(Color("textGreen"))
                    .cornerRadius(10)
                }
              } //: VSTACK
              .frame(width: 0.79 * UIScreen.screenWidth, height: 0.23 * UIScreen.screenHeight, alignment: .center)
            })
          } //: ZSTACK
          .padding(.bottom)

          // Owner Name to Shop Address
          VStack(spacing: 10) {
            TextField("Owner Name", text: $basicDetailsViewModel.ownerName)
              .textFieldStyle(BasicDetailsTextFieldStyle()).onTapGesture {
                  self.hideKeyboard()
              }

            TextField("Phone Number", text: $basicDetailsViewModel.phoneNumber)
              .textFieldStyle(BasicDetailsTextFieldStyle()).onTapGesture {
                  self.hideKeyboard()
              }

            TextField("Email Address", text: $basicDetailsViewModel.emailAddress)
              .textFieldStyle(BasicDetailsTextFieldStyle()).onTapGesture {
                  self.hideKeyboard()
              }

            TextField("Shop Name", text: $basicDetailsViewModel.shopName)
              .textFieldStyle(BasicDetailsTextFieldStyle()).onTapGesture {
                  self.hideKeyboard()
              }
              .keyboardType(.emailAddress)

            TextField("Shop Address", text: $basicDetailsViewModel.shopAddress)
              .textFieldStyle(BasicDetailsTextFieldStyle()).onTapGesture {
                  self.hideKeyboard()
              }
          } //: VSTACK

          // Shop City to Shop Location
          VStack {
            // Shop City
            Group {
              TextField("Select Shop State", text: $basicDetailsViewModel.shopState)
              .textFieldStyle(BasicDetailsTextFieldStyle()).onTapGesture {
                  self.hideKeyboard()
              }
              .disabled(true)
              .onTapGesture {
                showingStates.toggle()
              }
            }

            Group {
              TextField("Select Shop District", text: $basicDetailsViewModel.shopDistrict)
              .textFieldStyle(BasicDetailsTextFieldStyle()).onTapGesture {
                  self.hideKeyboard()
              }
              .disabled(true)
              .onTapGesture {
                showingDistricts.toggle()
              }
            }

            // Shop Catergory
            VStack {
              Button(action: {
                showingCategories.toggle()
              }, label: {
                HStack {
                  Group {
                    if shopCategory.isEmpty {
                      Text("Select Shop Category")
                    } else {
                      Text(shopCategory)
                    }
                  }
                  .font(.headline.weight(.regular))
                  .foregroundColor(Color("basicDetailsText"))
                  .padding(.leading, 17)
                  .padding(.vertical, 10)

                  Spacer()

                  Image(systemName: "chevron.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                }
                }) //: BUTTON
                .confirmationDialog("Categories", isPresented: $showingCategories, titleVisibility: .visible) {
                  ForEach(0..<shopCategories.count, id: \.self) { category in
                    Button(action: {
                      shopCategory = shopCategories[category]
                    }, label: {
                      Text(shopCategories[category] + shopCategoriesDiscountRange[category])
                    })
                  }
                }
            }
            .frame(width: 0.885 * UIScreen.screenWidth, height: 0.053 * UIScreen.screenHeight, alignment: .leading)
            .background(Color.white.cornerRadius(10))
            .background(
              RoundedRectangle(cornerRadius: 10)
                .stroke(Color("textGreen").opacity(0.2), lineWidth: 2)
            )

            // Shop Locaton
            HStack {
              //TextField("Shop Location", text: $basicDetailsViewModel.shopCity)
              Text("Shop Location")
                .font(.headline.weight(.regular))
                .foregroundColor(Color("basicDetailsText"))
                .padding(.leading, 17)
                .padding(.vertical, 10).onTapGesture {
                    self.hideKeyboard()
                }

              Button(action: {
                // add location
              }, label: {
                Text("Add")
                  .foregroundColor(Color("textGreen"))
                  .frame(width: 0.157 * UIScreen.screenWidth, height: 0.035 * UIScreen.screenHeight)
                  .background(Color.green.opacity(0.3))
                  .cornerRadius(10)
                  .background(
                    RoundedRectangle(cornerRadius: 10)
                      .stroke(Color("textGreen").opacity(0.5), lineWidth: 1)
                )
                .padding(.trailing)
              })
            } //: HSTACK
            .frame(width: 0.885 * UIScreen.screenWidth, height: 0.053 * UIScreen.screenHeight, alignment: .leading)
            .background(Color.white.cornerRadius(10))
            .background(
              RoundedRectangle(cornerRadius: 10)
                .stroke(Color("textGreen").opacity(0.2), lineWidth: 2)
            )
          }

          Spacer()
            .frame(height: 0.2 * UIScreen.screenHeight)

          // Services
//          VStack(spacing: 10) {
//            Toggle(isOn: $basicDetailsViewModel.deliveryEnabled.animation()) {
//                  Text("Delivery Service")
//                .font(.body.weight(.medium))
//              }
//
//            Toggle(isOn: $basicDetailsViewModel.pickupEnabled.animation()) {
//                  Text("Pickup Service")
//                .font(.body.weight(.medium))
//              }
//          } //: VSTACK
//          .padding(.horizontal, 24)
//          .padding(.vertical, 8)
//          .padding(.bottom, 0.15 * UIScreen.screenHeight)
        } //: SCROLL
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .overlay(
          ZStack {
            BasicScreensBottomBackground()
            HStack {
              BasicScreensBottomLeftText(firstLine: "Welcome to ", secondLine: "Gastos Provider Club")
                .padding(.leading)
              Spacer()

              Button(action: {
                self.didEnterAllData()
                self.hideKeyboard()
              }, label: {
                BasicScreensBottomRighttText(buttonText: "Next")
              })
            }
          }
        .frame(height: UIScreen.screenHeight, alignment: .bottom)
        ) //: OVERLAY
        .fullScreenCover(isPresented: $isShowingImagePicker, onDismiss: nil) {
          ImagePicker(image: $image)
        }
        .onAppear {
          basicDetailsViewModel.phoneNumber = loginViewModel.phoneNumber
          //loginViewModel.didEnterMerchantDetails = true

          // to fetch districts
          basicDetailsViewModel.fetchDistricts { (states) in
            self.states = states
            print(self.states)
          }
        }
        .confirmationDialog("Select a State", isPresented: $showingStates, titleVisibility: .visible) {
          ForEach(0 ... (states.states.count - 1), id: \.self) { index in
            Button(states.states[index].state) {
              basicDetailsViewModel.shopState = states.states[index].state
              selectedStateIndex = index
            }
          }
        }
        .confirmationDialog("Select a District", isPresented: $showingDistricts, titleVisibility: .visible) {
          if selectedState != "" {
            ForEach(0 ... (states.states[selectedStateIndex].districts.count - 1), id: \.self) { index in
              Button(states.states[selectedStateIndex].districts[index]) {
                basicDetailsViewModel.shopDistrict = states.states[selectedStateIndex].districts[index]
              }
            }
          }
        }
      }
    }

  func didEnterAllData() {
    if (!basicDetailsViewModel.ownerName.isEmpty && !basicDetailsViewModel.emailAddress.isEmpty && !basicDetailsViewModel.shopName.isEmpty && !basicDetailsViewModel.shopAddress.isEmpty && !basicDetailsViewModel.shopDistrict.isEmpty) {

      basicDetailsViewModel.shopCategory = self.shopCategory

      // uploading data to firebase
      basicDetailsViewModel.registerMerchantDetails(uid: loginViewModel.uid)
      basicDetailsViewModel.uploadImageToStorage(uid: loginViewModel.uid, image: image ?? UIImage())

      // to go to next screen
      loginViewModel.didEnterMerchantDetails = true

      // copying data from basic details view model to login view model
//      loginViewModel.ownerName = basicDetailsViewModel.ownerName
//      loginViewModel.phoneNumber = basicDetailsViewModel.phoneNumber
//      loginViewModel.emailAddress = basicDetailsViewModel.emailAddress
//      loginViewModel.shopName = basicDetailsViewModel.shopName
//      loginViewModel.shopAddress = basicDetailsViewModel.shopAddress
//      loginViewModel.shopCity = basicDetailsViewModel.shopCity
//      loginViewModel.shopCategory = basicDetailsViewModel.shopCategory
//      loginViewModel.shopLocation = basicDetailsViewModel.shopLocation
//      loginViewModel.deliveryEnabled = basicDetailsViewModel.deliveryEnabled
//      loginViewModel.pickupEnabled = basicDetailsViewModel.pickupEnabled
    }
  }
}

struct BasicDetails_Previews: PreviewProvider {
    static var previews: some View {
        BasicDetails()
        .environmentObject(LoginViewModel())
    }
}

// Title View
struct BasicScreensTitle: View {
  var title: String
  var body: some View {
    Text(title)
      .font(.title2.weight(.medium))
      .foregroundColor(Color("deepGreen"))
  }
}

// Bottom Part
struct BasicScreensBottomBackground: View {
  var body: some View {
      Rectangle()
        .frame(width: UIScreen.screenWidth, height: 0.17 * UIScreen.screenHeight)
        .foregroundColor(Color("deepGreen"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .ignoresSafeArea(.all)
  }
}

struct BasicScreensBottomLeftText: View {
  var firstLine: String
  var secondLine: String
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text(firstLine)
        .font(.subheadline.weight(.regular))
        .foregroundColor(Color.white.opacity(0.6))

      Text(secondLine)
        .font(.title3.weight(.semibold))
        .foregroundColor(.white)
    }
  }
}

struct BasicScreensBottomRighttText: View {
  var buttonText: String
  var body: some View {
    Text(buttonText)
      .font(.body.weight(.bold))
      .foregroundColor(Color("textGreen"))
      .frame(width: 0.31 * UIScreen.screenWidth, height: 0.065 * UIScreen.screenHeight, alignment: .center)
      .background(Color.white)
      .cornerRadius(15)
      .padding(.trailing)
  }
}

// textfield style
struct BasicDetailsTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .font(.headline.weight(.regular))
        .foregroundColor(Color("basicDetailsText"))
        .padding(.leading, 17)
        .padding(.vertical, 10)
        .frame(width: 0.885 * UIScreen.screenWidth, height: 0.053 * UIScreen.screenHeight, alignment: .leading)
        .background(Color.white.cornerRadius(10))
        .background(
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color("textGreen").opacity(0.2), lineWidth: 2)
      )
    }
}



/*
 Text("location status: \(locationManager.statusString)")
             HStack {
                 Text("latitude: \(userLatitude)")
                 Text("longitude: \(userLongitude)")
             }
 */
