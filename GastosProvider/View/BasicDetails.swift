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

    var body: some View {
      NavigationView {
        ScrollView(.vertical) {
          // Navigation Bar
          HStack {
            Button(action: {
              // back
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
            TextField("Owner Name", text: $loginViewModel.ownerName)
              .textFieldStyle(BasicDetailsTextFieldStyle())

            TextField("Phone Number", text: $loginViewModel.phoneNumber)
              .textFieldStyle(BasicDetailsTextFieldStyle())

            TextField("Email Address", text: $loginViewModel.emailAddress)
              .textFieldStyle(BasicDetailsTextFieldStyle())

            TextField("Shop Name", text: $loginViewModel.shopName)
              .textFieldStyle(BasicDetailsTextFieldStyle())

            TextField("Shop Address", text: $loginViewModel.shopAddress)
              .textFieldStyle(BasicDetailsTextFieldStyle())
          } //: VSTACK

          // Shop City to Shop Location
          VStack {
            // Shop City
            Group {
              TextField("Enter Shop City", text: $loginViewModel.shopCity)
              .textFieldStyle(BasicDetailsTextFieldStyle())
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
              TextField("Shop Location", text: $loginViewModel.shopCity)
                .font(.headline.weight(.regular))
                .foregroundColor(Color("basicDetailsText"))
                .padding(.leading, 17)
                .padding(.vertical, 10)

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

          // Services
          VStack(spacing: 10) {
            Toggle(isOn: $loginViewModel.deliveryEnabled.animation()) {
                  Text("Delivery Service")
                .font(.body.weight(.medium))
              }

            Toggle(isOn: $loginViewModel.pickupEnabled.animation()) {
                  Text("Pickup Service")
                .font(.body.weight(.medium))
              }
          } //: VSTACK
          .padding(.horizontal, 24)
          .padding(.vertical, 8)
          .padding(.bottom, 0.15 * UIScreen.screenHeight)
        } //: SCROLL
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
      }
      .overlay(
        ZStack {
          BasicScreensBottomBackground()
          HStack {
            BasicScreensBottomLeftText(firstLine: "Welcome to ", secondLine: "Gastos Provider Club")
              .padding(.leading)
            Spacer()

            Button(action: { self.didEnterAllData() }, label: {
              BasicScreensBottomRighttText(buttonText: "Next")
            })
          }
        }
      .frame(height: UIScreen.screenHeight, alignment: .bottom)
      ) //: OVERLAY
    }

  func didEnterAllData() {
    if (!loginViewModel.ownerName.isEmpty && !loginViewModel.emailAddress.isEmpty && !loginViewModel.shopName.isEmpty && !loginViewModel.shopAddress.isEmpty && !loginViewModel.shopCity.isEmpty ) {

      loginViewModel.shopCategory = self.shopCategory

      loginViewModel.registerMerchantDetails()
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
