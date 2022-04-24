//
//  EnterPin.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 20/01/22.
//

import SwiftUI

struct EnterPin: View {
  @State private var name1 = ""
  @State var resetPin = false
  var body: some View {
    NavigationView{
      ZStack{
        Image("Group").offset(x: 100.0, y: -350.0)
        VStack{
          HStack{
              Spacer()
            Text("Enter Your 4-Digit Pin").foregroundColor(Color("5")).font(.system(size: 25)).fontWeight(.medium).padding(.leading)
            Spacer()
          }

          HStack{
            TextField("Pin", text: $name1).frame(width: 350, height: 65, alignment: .center)
              .textFieldStyle(MyTextFieldStyle()).padding(.leading, 3).onTapGesture {
                  self.hideKeyboard()
              }.keyboardType(.numberPad)
            Spacer()
          }

          HStack{
            Spacer()
            Button(action: {
              self.resetPin.toggle()
            }, label: {
              Text("Forgot Pin?")
                .foregroundColor(.gray)
                .font(.caption.weight(.medium))
                .padding(4)
            })
              .padding(.horizontal, 12)
              .padding(.vertical, 4)
              .background(
                Color.black.opacity(0.03)
              )
              .cornerRadius(12, corners: [.topLeft, .bottomLeft])
              .fullScreenCover(isPresented: $resetPin, content: {
                  SetPin()
                })
          }


          Spacer()
          HStack{

            Spacer()
            Button(action: {}, label: {
              Image(systemName: "chevron.right").font(.system(size: 25)).foregroundColor(.white).frame(width: 50, height: 50, alignment: .center)
            }).padding(3).background(Color("textGreen")).clipShape(Circle()).padding()
          }
        }
      }.navigationBarItems(leading: Image(systemName: "arrow.backward")).foregroundColor(Color("5"))
    }
  }
}

struct EnterPin_Previews: PreviewProvider {
  static var previews: some View {
      EnterPin()
  }
}
