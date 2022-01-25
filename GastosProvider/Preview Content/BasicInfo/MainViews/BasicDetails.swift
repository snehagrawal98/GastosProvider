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
    @State var ownerName = ""
    @State var phoneNumber = ""
    @State var emailAddress = ""
    @State var shopName = ""
    @State var shopAddress = ""
    @State var deliveryEnabled = true
    @State var pickupEnabled = true
    @State var shopCity = ""
    @State var shopLocation = ""
    @State var shopCategory = "Select Shop Category"
  var shopCategories = ["Food & Beverages  5 - 40"]
  @State var showingCategories = false

    var body: some View {
      ScrollView(.vertical) {

        // Navigation Bar
        HStack {
          Button(action: {
            // back
          }, label: {
            Image(systemName: "arrow.left")
              .resizable()
              .frame(width: 14, height: 14, alignment: .leading)
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
          // Owner Name
          Group {
            TextField("Owner Name", text: $ownerName)
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

          // Phone Number
          Group {
            TextField("Phone Number", text: $phoneNumber)
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

          // Email Address
          Group {
            TextField("Email Address", text: $emailAddress)
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

          // Shop Name
          Group {
            TextField("Shop Name", text: $shopName)
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

          // Shop Address
          Group {
            TextField("Shop Address", text: $shopAddress)
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
        } //: VSTACK

        // Shop City to Shop Location
        VStack {
          // Shop City
          Group {
            TextField("Select Shop City", text: $shopCity)
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

          // Shop Catergory
          VStack {
            Button(action: {
              showingCategories.toggle()
            }, label: {
              HStack {
                if shopCategory.isEmpty {
                  Text("Select Shop Category")
                    .font(.headline.weight(.regular))
                    .foregroundColor(Color("basicDetailsText"))
                } else {
                  Text(shopCategory)
                    .font(.headline.weight(.regular))
                    .foregroundColor(Color("basicDetailsText"))
                    .padding(.leading, 17)
                    .padding(.vertical, 10)
                }

                Spacer()

                Image(systemName: "arrowtriangle.down")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 11)
                  .foregroundColor(.black)
              }
              }) //: BUTTON
              .confirmationDialog(Text("Categories").foregroundColor(.green), isPresented: $showingCategories, titleVisibility: .visible) {
                ForEach(shopCategories, id: \.self) { category in
                  Button(action: {
                    shopCategory = category
                  }, label: {
                    Text(category)
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
            TextField("Shop Location", text: $shopCity)
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
          Toggle(isOn: $deliveryEnabled.animation()) {
                Text("Delivery Service")
              .font(.body.weight(.medium))
            }

          Toggle(isOn: $pickupEnabled.animation()) {
                Text("Pickup Service")
              .font(.body.weight(.medium))
            }
        } //: VSTACK
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
        .padding(.bottom, 0.15 * UIScreen.screenHeight)
      } //: SCROLL
      .overlay(
        BasicScreensBottom(buttonText: "Next", firstLine: "Welcome to", secondLine: "Gastos Provider Club")
          .frame(height: UIScreen.screenHeight, alignment: .bottom)
      )
    }
}

struct BasicDetails_Previews: PreviewProvider {
    static var previews: some View {
        BasicDetails()
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
struct BasicScreensBottom: View {
  var buttonText: String
  var firstLine: String
  var secondLine: String
  var body: some View {
    ZStack {
      Rectangle()
        .frame(width: UIScreen.screenWidth, height: 0.17 * UIScreen.screenHeight)
        .foregroundColor(Color("deepGreen"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .ignoresSafeArea(.all)

      HStack {
        // Text
        VStack(alignment: .leading, spacing: 5) {
          Text(firstLine)
            .font(.subheadline.weight(.regular))
            .foregroundColor(Color.white.opacity(0.6))

          Text(secondLine)
            .font(.title3.weight(.semibold))
            .foregroundColor(.white)
        }
        .padding(.leading)

        Spacer()

        Button(action: {

        }, label: {
          Text(buttonText)
            .font(.body.weight(.bold))
            .foregroundColor(Color("textGreen"))
            .frame(width: 0.31 * UIScreen.screenWidth, height: 0.065 * UIScreen.screenHeight, alignment: .center)
            .background(Color.white)
            .cornerRadius(15)
            .padding(.trailing)
        })
      }
    }
  }
}
