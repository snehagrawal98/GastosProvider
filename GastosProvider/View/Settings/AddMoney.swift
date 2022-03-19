//
//  AddMoney.swift
//  GastosProvider
//
//  Created by ehsan sat on 3/16/22.
//

import SwiftUI

struct AddMoney: View {
    
    @State var amount: Int = 0
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack {
              Button(action: {
                  presentationMode.wrappedValue.dismiss()
              }, label: {
                Image(systemName: "arrow.left")
                  .resizable()
                  .frame(width: 25, height: 20)
                  .foregroundColor(.primary)
              })

              Spacer()

              SettingsTitleView(title: "Add Money")

              Spacer()
            } //: HSTACK
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.white)
                    .shadow(radius: 20)
                VStack {
                    Text("Enter Amount")
                        .fontWeight(.semibold)
                        .font(.custom("Futura", size: 18))
                    HStack {
                        Text("₹")
                            .fontWeight(.regular)
                            .font(.custom("Futura", size: 50))
                        TextField("0", value: $amount, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            AddMoneyBottom(cost: 200)
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct AddMoneyBottom: View {
    
    var cost: Int
    
    var body : some View {
        
        ZStack {
            Rectangle()
              .frame(width: UIScreen.screenWidth, height: 0.17 * UIScreen.screenHeight)
              .foregroundColor(Color("deepGreen"))
              .cornerRadius(30, corners: [.topLeft, .topRight])
              .ignoresSafeArea(.all)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Adding Amount in wallet")
                        .fontWeight(.regular)
                        .font(.custom("Lato", size: 14))
                        .foregroundColor(Color.white)
                    Text("Rs. \(cost)")
                        .fontWeight(.regular)
                        .font(.custom("Lato", size: 20))
                        .foregroundColor(Color.white)
                }
                .padding(.leading)
                
                Spacer()
                
                Button(action: {
                  // Pay
                }, label: {
                  Text("Add")
                    .font(.body.weight(.bold))
                    .font(.custom("Lato", size: 16))
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

struct AddMoney_Previews: PreviewProvider {
    static var previews: some View {
        AddMoney(amount: 0)
    }
}
