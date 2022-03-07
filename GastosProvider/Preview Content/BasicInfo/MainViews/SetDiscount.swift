//
//  SetDiscount.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 22/01/22.
//

import SwiftUI

struct SetDiscount: View {
  @State var discount = 20.0
  @State var minAmount = ""
  @State var numberOfDiscounts = 1
  @EnvironmentObject var loginViewModel: LoginViewModel
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
                .frame(width: 20, height: 20, alignment: .leading)
                .foregroundColor(.primary)
            })

            Spacer()

            BasicScreensTitle(title: "Discount")
            Spacer()
          } //: HSTACK
          .padding()

          Text("Set Your Discount")
            .font(.title3.weight(.medium))
            .foregroundColor(Color("deepGreen"))
            .frame(width: UIScreen.screenWidth - 32, alignment: .leading)

          // Set Your Discount
          VStack {
            ForEach(0 ..< numberOfDiscounts, id: \.self) { discount in
              setYourDiscount
            }

            Button(action: {
              numberOfDiscounts = numberOfDiscounts + 1
              print(numberOfDiscounts)
            }, label: {
              Text("Add More")
                .font(.subheadline)
                .foregroundColor(Color("textGreen"))
                .frame(width: 0.78 * UIScreen.screenWidth, alignment: .leading)
            })
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
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .overlay(
          ZStack {
            BasicScreensBottomBackground()
            HStack {
              BasicScreensBottomLeftText(firstLine: "Discount Margin on all Bills", secondLine: "20%")
                .padding(.leading)
              Spacer()

              Button(action: { }, label: {
                BasicScreensBottomRighttText(buttonText: "Next")
              })
            }
          }
          .frame(height: UIScreen.screenHeight, alignment: .bottom)
        ) //: OVERLAY
      }
    }

  // Set Your Discount View
  var setYourDiscount: some View {
    VStack(spacing: 1) {
      HStack {
        TextField("Min Billed Amount", text: $minAmount)
          .padding()
          .font(.subheadline.weight(.regular))
          .frame(width: 0.4 * UIScreen.screenWidth, height: 0.059 * UIScreen.screenHeight, alignment: .center)
          .background(Color.white.cornerRadius(10))
          .background(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color("textGreen").opacity(0.2), lineWidth: 2)
            )

        Spacer()

        Text("\(discount, specifier: "%g")")
          .font(.system(size: 0.21 * UIScreen.screenWidth).weight(.regular))

        Text("%")
          .font(.title.weight(.regular))
          .foregroundColor(Color("textGreen"))
          .frame(height: 0.07 * UIScreen.screenHeight, alignment: .bottom)
      }
      .padding(.horizontal)

      VStack(spacing: 0) {
        Slider(value: $discount, in: 5...40, step: 1)
          .accentColor(Color("textGreen"))
        //.padding()

        HStack {
          Text("5")

          Spacer()

          Text("40")
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

struct SetDiscount_Previews: PreviewProvider {
    static var previews: some View {
        SetDiscount()
        .environmentObject(LoginViewModel())
    }
}
