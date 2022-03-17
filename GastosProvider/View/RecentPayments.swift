//
//  RecentPayments.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 27/02/22.
//

import SwiftUI

struct RecentPayments: View {
  let rupeeSymbol = "\u{20B9}"
  @State var numberOfPayments = 1
//  @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
      NavigationView {
        ScrollView(.vertical) {
          // Navigation Bar
          HStack {
            Button(action: {             presentationMode.wrappedValue.dismiss()
             }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 20, height: 20)
                .padding()
                .foregroundColor(.black)
            })

            Spacer()
            Text("Recieved Payments")
              .font(.title2.weight(.semibold))
              .foregroundColor(Color("deepGreen"))
            Spacer()

            HStack {
              Image(systemName: "line.3.horizontal.decrease.circle")
                .resizable()
                .frame(width: 11, height: 11)
                .foregroundColor(Color("textGreen"))

              Text("Filter")
                .font(.caption2.weight(.medium))
                .foregroundColor(Color("textGreen"))
            }
            .padding(8)
            .background(
              RoundedRectangle(cornerRadius: 8)
                .stroke(Color("textGreen"), lineWidth: 1)
            )
            .padding(.trailing)
          }

          if numberOfPayments == 0 {
            VStack {
              Image(systemName: "square.and.arrow.down.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 0.11 * UIScreen.screenWidth, height: 0.05 * UIScreen.screenHeight)
                .foregroundColor(Color("textGreen"))
                .background(
                  Circle()
                    .frame(width: 0.37 * UIScreen.screenWidth, height: 0.171 * UIScreen.screenHeight)
                    .foregroundColor(Color("textGreen").opacity(0.2))
                )
                .background(
                  Circle()
                    .stroke(Color("textGreen"), lineWidth: 1)
                    .frame(width: 0.37 * UIScreen.screenWidth, height: 0.171 * UIScreen.screenHeight)
                )
                .padding(50)

              Text("No Payments Recieved")
                .font(.title3.weight(.medium))
                .foregroundColor(Color("textGreen"))
            }
            .offset(y: 0.25 * UIScreen.screenHeight)
          } else {
            ForEach(1..<10, id: \.self) { _ in
              HStack {
                Image("foodItem")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 0.13 * UIScreen.screenWidth)
                  .clipShape(Circle())

                VStack {
                  Text("Santosh Sehgal")
                    .font(.headline.weight(.regular))
                  Spacer()
                  Text("\(rupeeSymbol) 1578")
                    .font(.body.weight(.semibold))
                    .foregroundColor(.gray)
                }
                Spacer()

                VStack {
                  Text("25 Dec 2020")
                    .font(.caption.weight(.semibold))
                    .foregroundColor(.gray)
                  Spacer()
                  Image("Google Pay")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 0.1 * UIScreen.screenWidth, height: 0.05 * UIScreen.screenHeight)
                }
              }
              .frame(width: 0.8 * UIScreen.screenWidth, height: 0.06 * UIScreen.screenHeight)
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 15)
                  .foregroundColor(.white)
                  .shadow(color: .gray.opacity(0.5), radius: 4)
                  .frame(width: 0.88 * UIScreen.screenWidth, height: 0.086 * UIScreen.screenHeight)
              )
            }
          }
          Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
      }
    }
}

struct RecentPayments_Previews: PreviewProvider {
    static var previews: some View {
        RecentPayments()
    }
}
