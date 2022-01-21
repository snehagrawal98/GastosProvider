//
//  SetPin.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 20/01/22.
//

import SwiftUI

struct SetPin: View {
  @State private var name = Array<String>.init(repeating: "", count: 3)

  var body: some View {
      NavigationView{
          ZStack{
              Image("Layer3").offset(x: 100.0, y: -350.0)
              VStack{
                  HStack{
                      Text("Set Your 4-Digit Pin").foregroundColor(Color("5")).font(.system(size: 25)).fontWeight(.medium).padding(.leading)
                  Spacer()
                  }

                  HStack{
                  TextField("New Pin", text: $name[0]).frame(width: 350, height: 65, alignment: .center)
                      .textFieldStyle(MyTextFieldStyle()).padding(.leading, 3)
                      Spacer()
                  }

                  HStack{
                  TextField("Re-enter Pin", text: $name[1])
                      .frame(width: 350, height: 65, alignment: .center)
                      .textFieldStyle(MyTextFieldStyle()).padding(.leading, 3)
                      Spacer()
                  }


                  Spacer()
                  HStack{

                      Spacer()
                      Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                          Image(systemName: "chevron.right").font(.system(size: 25)).foregroundColor(.white).frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                      }).padding(3).background(Color("textGreen")).clipShape(Circle()).padding()
                  }
              }
          }.navigationBarItems(leading: Image(systemName: "arrow.backward")).foregroundColor(Color("5"))
      }
  }
}

struct SetPin_Previews: PreviewProvider {
  static var previews: some View {
      SetPin()
  }
}


struct MyTextFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
      configuration
      .padding(15)
      .background(
          RoundedRectangle(cornerRadius: 10)
              .shadow(color: Color("gray"), radius: 8, x: 0.0, y: 10.0).foregroundColor(.white)
      )//.padding()
  }
}
