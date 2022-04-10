//
//  SetDiscount.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 22/01/22.
//

import SwiftUI

struct SetDiscount: View {
  @State var numberOfDiscounts = 0
  @State var minimumDiscount = 0
  @State var maximumDiscount = 50

  @EnvironmentObject var loginViewModel: LoginViewModel
  @StateObject var setDiscountViewModel = SetDiscountViewModel()
  @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

  var body: some View {
      NavigationView {
        VStack {
          // Navigation Bar
          HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 20, height: 20, alignment: .leading)
                .foregroundColor(.primary)
                .padding(.horizontal)
            })

            Spacer()
            BasicScreensTitle(title: "Discount")
            Spacer()
            Spacer()
          } //: HSTACK
          .padding(.bottom)

          ScrollView(.vertical) {
            Text("Set Your Discount")
              .font(.title3.weight(.medium))
              .foregroundColor(Color("deepGreen"))
              .frame(width: UIScreen.screenWidth - 32, alignment: .leading)

            // Set Your Discount
            VStack {
              ForEach(0 ..< numberOfDiscounts, id: \.self) { discount in
                SetYourDiscount(indexOfDiscount: discount, minimumDiscount: minimumDiscount, maximumDiscount: maximumDiscount)
              }

              if numberOfDiscounts < 3 {
                Button(action: {
                  self.appendDiscounts()
                  numberOfDiscounts = numberOfDiscounts + 1
                }, label: {
                  Text("Add More")
                    .font(.subheadline)
                    .foregroundColor(Color("textGreen"))
                    .frame(width: 0.78 * UIScreen.screenWidth, alignment: .leading)
                })
              }
            } //: VSTACK

            HStack {
              Group {
                Image(systemName: "info.circle")
                  .resizable()
                .frame(width: 12, height: 12)
              }
              .frame(height: 42, alignment: .top)

              Text("""
              Set your discounts at minimum order bill value.
              You can also add more discounts at multiple Minimum order bill values.
              """)
                .font(.caption.weight(.regular))
            }
            .foregroundColor(.black.opacity(0.5))
            .frame(height: 50)
            .padding(.horizontal)

            VStack {
              Spacer()
              Text("More Discount = More Customers")
                .font(.body.weight(.semibold))
              .foregroundColor(.black.opacity(0.5))
            }
            .padding(.top)
          } //: SCROLL
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .overlay(
          ZStack {
            BasicScreensBottomBackground()
            HStack {
              BasicScreensBottomLeftText(firstLine: "Discount Margin on all Bills", secondLine: "20%")
                .padding(.leading)
              Spacer()

              Button(action: {
                setDiscountViewModel.uploadDiscounts(uid: loginViewModel.uid)
                loginViewModel.didSetDiscounts = setDiscountViewModel.didUploadDiscounts
                  self.hideKeyboard()
              }, label: {
                BasicScreensBottomRighttText(buttonText: "Next")
              })
            }
          }
          .frame(height: UIScreen.screenHeight, alignment: .bottom)
        ) //: OVERLAY
        .onAppear(perform: {
          if setDiscountViewModel.discounts.count < 1 {
            self.appendDiscounts()
            self.calculateDiscountRange()
            numberOfDiscounts = 1
          }
      })
        .environmentObject(setDiscountViewModel)
      } //: NAV
    }

  func appendDiscounts() {
    setDiscountViewModel.discounts.append(Discount(discountPercentage: 20.0, minBillAmount: ""))
  }

  func calculateDiscountRange() {

    switch loginViewModel.shopCategory {
      case "Food & Beverages":
        minimumDiscount = 5
        maximumDiscount = 40
      case "Fashion":
        minimumDiscount = 5
        maximumDiscount = 50
      case "Salon & Spa":
        minimumDiscount = 5
        maximumDiscount = 50
      case "Stores":
        minimumDiscount = 0
        maximumDiscount = 30
      case "Medical":
        minimumDiscount = 1
        maximumDiscount = 30
      case "Others":
        minimumDiscount = 5
        maximumDiscount = 50
      default: break
    }
  }
}

struct SetDiscount_Previews: PreviewProvider {
    static var previews: some View {
      SetDiscount()
        .environmentObject(LoginViewModel())
    }
}

struct SetYourDiscount: View {
  @EnvironmentObject var setDiscountViewModel: SetDiscountViewModel
  @State var indexOfDiscount: Int
  @State var minimumDiscount: Int
  @State var maximumDiscount: Int
  
  var body: some View {
    VStack(spacing: 1) {
      HStack {
        TextField("Min Billed Amount", text: $setDiscountViewModel.discounts[indexOfDiscount].minBillAmount)
          .padding()
          .font(.subheadline.weight(.regular))
          .frame(width: 0.4 * UIScreen.screenWidth, height: 0.059 * UIScreen.screenHeight, alignment: .center)
          .background(Color.white.cornerRadius(10))
          .background(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color("textGreen").opacity(0.2), lineWidth: 2)
            )

        Spacer()

        Text("\(setDiscountViewModel.discounts[indexOfDiscount].discountPercentage, specifier: "%g")")
          .font(.system(size: 0.21 * UIScreen.screenWidth).weight(.regular))

        Text("%")
          .font(.title.weight(.regular))
          .foregroundColor(Color("textGreen"))
          .frame(height: 0.07 * UIScreen.screenHeight, alignment: .bottom)
      }
      .padding(.horizontal)

      VStack(spacing: 0) {
        Slider(value: $setDiscountViewModel.discounts[indexOfDiscount].discountPercentage, in: Double(minimumDiscount)...Double(maximumDiscount), step: 1)
          .accentColor(Color("textGreen"))

        HStack {
          Text("\(minimumDiscount)")
          Spacer()
          Text("\(maximumDiscount)")
        }
      }
      .padding(.horizontal)
      Spacer()
    }
    .frame(width: 0.885 * UIScreen.screenWidth, height: 0.22 * UIScreen.screenHeight, alignment: .center)
    .background(Color.white.cornerRadius(10))
    .background(
      RoundedRectangle(cornerRadius: 10)
        .stroke(Color("textGreen").opacity(0.2), lineWidth: 2)
    )
    .padding(.horizontal)
  }
}
