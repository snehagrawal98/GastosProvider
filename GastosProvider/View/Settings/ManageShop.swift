//
//  ManageShop.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 18/01/22.
//

import SwiftUI

struct ManageShop: View {
  @State var shopCity = "Chandigarh"
  @State var shopLocation = "Chandigarh"
  @State var shopName = "Chandigarh Dhaba"
  @State var shopAddress = "Chandigarh chabacknaksncasm"
  @State var shopCategory = "Food"
  @State var discountPercent = "5"
  @State var minimumOrderForDiscount = "150"
  @State var deliveryEnabled = true
  @State var pickupEnabled = true
  @Environment(\.dismiss) var dismiss

    var body: some View {
      NavigationView {
        ScrollView(.vertical) {
          // Navigation Bar
          HStack {
            Button(action: {
              dismiss()
            }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.primary)
            })

            Spacer()

            SettingsTitleView(title: "Manage Shop")

            Spacer()
          } //: HSTACK
          .padding()

          // Shop Cover Photo
          VStack(alignment: .leading) {
            Text("Shop Cover Photo")
              .font(.caption.weight(.medium))
              .foregroundColor(Color.gray)
              .frame(width: 0.80 * UIScreen.screenWidth, alignment: .leading)

            ImageWithEdit()
          } //: VSTACK
          .frame(width: 0.80 * UIScreen.screenWidth)

          // Images related to business
          VStack(alignment: .leading) {
            Text("Add images related to your Business")
              .font(.caption.weight(.medium))
              .foregroundColor(Color.gray)
              .frame(width: 0.80 * UIScreen.screenWidth, alignment: .leading)
              .padding(.leading, 24)

            AddImagesView()
          } //: VSTACK
          .padding(.bottom)

          // Shop Details
          VStack {

            // Shop Name
            VStack(alignment: .leading) {
              Text("Shop Name")
                .font(.subheadline.weight(.regular))
                .foregroundColor(.secondary)
                .padding(.bottom, 1)

              TextField("Shop Name Here", text: $shopName)
                .font(.title3.weight(.medium))
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(width: UIScreen.screenWidth - 48, alignment: .leading)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("textGreen").opacity(0.2), lineWidth: 1)
            )

            // Shop Address
            VStack(alignment: .leading) {
              Text("Shop Address")
                .font(.subheadline.weight(.regular))
                .foregroundColor(.secondary)
                .padding(.bottom, 1)

              TextField("Shop Address Here", text: $shopAddress)
                .font(.title3.weight(.medium))
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(width: UIScreen.screenWidth - 48, alignment: .leading)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("textGreen").opacity(0.2), lineWidth: 1)
            )

            // Select City
            VStack(alignment: .leading) {
              Text("Select City")
                .font(.subheadline.weight(.regular))
                .foregroundColor(.secondary)
                .padding(.bottom, 1)

              TextField("Enter City", text: $shopCity)
                .font(.title3.weight(.medium))
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(width: UIScreen.screenWidth - 48, alignment: .leading)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("textGreen").opacity(0.2), lineWidth: 1)
            )

            // Select Category
            VStack(alignment: .leading) {
              Text("Select Category")
                .font(.subheadline.weight(.regular))
                .foregroundColor(.secondary)
                .padding(.bottom, 1)

              TextField("Enter Category", text: $shopCategory)
                .font(.title3.weight(.medium))
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(width: UIScreen.screenWidth - 48, alignment: .leading)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("textGreen").opacity(0.2), lineWidth: 1)
            )

            // Shop Location
            HStack {
              VStack(alignment: .leading) {
                Text("Shop Location")
                  .font(.subheadline.weight(.regular))
                  .foregroundColor(.secondary)
                  .padding(.bottom, 1)

                TextField("Enter Location", text: $shopLocation)
                  .font(.title3.weight(.medium))
              } //: VSTACK

              Button(action: {
                // search
              }, label: {
                Image(systemName: "magnifyingglass")
                  .scaleEffect(2)
                  .foregroundColor(Color.gray)

              })
            } //: HSTACK
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(width: UIScreen.screenWidth - 48, alignment: .leading)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("textGreen").opacity(0.2), lineWidth: 1)
            )

            // Discounts
            VStack(alignment: .leading) {
              Text("Discounts")
                .font(.subheadline.weight(.regular))
                .foregroundColor(.secondary)
                .padding(.bottom, 1)

              HStack(spacing: 4) {
                HStack(spacing: 0) {
                  TextField("", text: $discountPercent)
                    .font(.largeTitle)
                    .frame(width: 20, height: 40, alignment: .center)

                  Text("%")
                    .frame(width: 20, height: 28, alignment: .bottom)
                }

                Text("Discount at minimum order of")
                  .frame(width: 230, height: 20, alignment: .leading)
                  .foregroundColor(Color.black.opacity(0.7))

                HStack(spacing: 5) {
                  Image("RupeeIcon")
                    .resizable()
                    .frame(width: 7.76, height: 11.54, alignment: .center)
                  TextField("", text: $minimumOrderForDiscount)
                    .font(.title2)
                    .frame(width: 37, height: 30, alignment: .leading)
                }
              }
              .frame(width: UIScreen.screenWidth - 64, alignment: .leading)

              HStack(spacing: 4) {
                HStack(spacing: 0) {
                  TextField("", text: $discountPercent)
                    .font(.largeTitle)
                    .frame(width: 20, height: 40, alignment: .center)

                  Text("%")
                    .frame(width: 20, height: 28, alignment: .bottom)
                }

                Text("Discount at minimum order of")
                  .frame(width: 230, height: 20, alignment: .leading)
                  .foregroundColor(Color.black.opacity(0.7))

                HStack(spacing: 5) {
                  Image("RupeeIcon")
                    .resizable()
                    .frame(width: 7.76, height: 11.54, alignment: .center)
                  TextField("", text: $minimumOrderForDiscount)
                    .font(.title2)
                    .frame(width: 37, height: 30, alignment: .leading)
                }
              }
              .frame(width: UIScreen.screenWidth - 64, alignment: .leading)

            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical)
            .frame(width: UIScreen.screenWidth - 48, alignment: .leading)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("textGreen").opacity(0.2), lineWidth: 1)
            )

            // Services
            VStack {
              Toggle(isOn: $deliveryEnabled.animation()) {
                    Text("Delivery Service")
                  .font(.body.weight(.medium))
                }
              .padding(.bottom, 8)

              Toggle(isOn: $pickupEnabled.animation()) {
                    Text("Pickup Service")
                  .font(.body.weight(.medium))
                }
            }
            .frame(width: UIScreen.screenWidth - 60, alignment: .leading)
            .padding(.top)
          }
          .padding(.bottom)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
      }
    }
}

struct ManageShop_Previews: PreviewProvider {
    static var previews: some View {
        ManageShop()
    }
}

// Settings Title View
struct SettingsTitleView: View {
  @State var title: String
    var body: some View {
        Text(title)
        .font(.title.weight(.semibold))
        .foregroundColor(Color("deepGreen"))
    }
}




struct ImageWithEdit: View {
    var body: some View {
      ZStack {
        Image("detailShop")
          .resizable()
          .scaledToFit()
          .frame(width: 0.75 * UIScreen.screenWidth, height: 0.21 * UIScreen.screenHeight, alignment: .center)
          .cornerRadius(19)

        // Edit Button
        VStack {
          Spacer()

          HStack {
            Spacer()

            Button(action: {
              // edit
            }, label: {
              Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18, alignment: .center)
                .foregroundColor(.white)
                .padding()
                .background(Color("textGreen"))
                .cornerRadius(12)
            }) //: BUTTON
          } //: HSTACK
        } //: VSTACK
        .frame(width: 0.85 * UIScreen.screenWidth, height: 0.22 * UIScreen.screenHeight, alignment: .center)

      } //: ZSTACK
    }
}


struct AddImagesView: View {
    var gridLayout: [GridItem] {
      return Array(repeating: GridItem(.flexible(), spacing: -55), count: 2)
    }
    var body: some View {
      LazyVGrid(columns: gridLayout, spacing: 5, content: {
        ForEach(1..<4) { _ in
          ImageWithEditAndDelete()
        }
        AddImageButton()
      })
    }
}



// Image with Delete and Edit
struct ImageWithEditAndDelete: View {
    var body: some View {
      ZStack {
        Image("detailShop")
          .resizable()
          .scaledToFit()
          .frame(width: 0.34 * UIScreen.screenWidth, height: 0.095 * UIScreen.screenHeight, alignment: .center)
          .cornerRadius(12)

        // Delete Button
        VStack {
          HStack {
            Spacer()

            Button(action: {
              // delete
            }, label: {
              Image(systemName: "trash")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12, alignment: .center)
                .foregroundColor(.white)
                .padding(8)
                .background(Color("textGreen"))
                .cornerRadius(5)
            }) //: BUTTON
          }

          Spacer()

          HStack {
            Spacer()

            Button(action: {
              // edit
            }, label: {
              Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12, alignment: .center)
                .foregroundColor(.white)
                .padding(8)
                .background(Color("textGreen"))
                .cornerRadius(5)
            }) //: BUTTON
          } //: HSTACK
        } //: VSTACK
        .frame(width: 0.40 * UIScreen.screenWidth, height: 0.1 * UIScreen.screenHeight, alignment: .center)

      } //: ZSTACK
    }
}

// Add Image Button
struct AddImageButton: View {
    var body: some View {
      ZStack {
        Rectangle()
          .frame(width: 0.38 * UIScreen.screenWidth, height: 0.1 * UIScreen.screenHeight, alignment: .center)
          .foregroundColor(Color("addImageButtonColor"))
          .cornerRadius(12)

        Image(systemName: "plus")
          .resizable()
          .scaledToFit()
          .frame(width: 23, height: 23, alignment: .center)
          .padding()
          .background(Color("textGreen"))
          .cornerRadius(10)
          .foregroundColor(.white)
      }
    }
}
