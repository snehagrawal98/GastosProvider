//
//  EnterMobileNumber.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 20/01/22.
//

import SwiftUI

struct EnterMobileNumber: View {
  @State var nextScreen = false
  @State private var mNo = ""
  @State private var countryPin = ""


  var body: some View {

      ZStack{

          Image("Layer").offset(x: 100.0, y: -250.0)
      VStack{

          HStack{
              Text("Welcome to").fontWeight(.semibold).font(.system(size: 25)).foregroundColor(Color("5")).padding(.horizontal)
              Spacer()
          }

          HStack{
              Text("Gastos").fontWeight(.bold).font(.system(size: 40)).foregroundColor(Color("5")).padding(.horizontal)
              Spacer()
          }

        HStack{
            Text("Provider").fontWeight(.bold).font(.system(size: 40)).foregroundColor(Color("5")).padding(.horizontal)
            Spacer()
        }.padding(.bottom, 30)

          HStack{
              Text("Enter Mobile Number").fontWeight(.regular).font(.system(size: 25)).foregroundColor(Color("5")).padding(.horizontal)
              Spacer()
          }

          HStack(spacing:0){
              TextField("+91", text: $countryPin).frame(width: 60, height: 60, alignment: .center).textFieldStyle(MyTextFieldStyle())
              TextField("Mobile Number", text: $mNo).textFieldStyle(MyTextFieldStyle())

          }.padding(.horizontal)

        //  TextField("")
          Spacer()

          HStack{

              Spacer()
              Button(action: {
                  self.nextScreen.toggle()
              }, label: {
                Image(systemName: "chevron.right").font(.system(size: 25)).foregroundColor(.white).frame(width: 50, height: 50, alignment: .center)
              }).padding(3).background(Color("textGreen")).clipShape(Circle()).padding().fullScreenCover(isPresented: $nextScreen){
                  OTPPin()
              }
          }
      }.padding(.vertical, 50)
      }
  }
}

struct EnterMobileNumber_Previews: PreviewProvider {
  static var previews: some View {
      EnterMobileNumber()
  }
}



extension View {
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
      clipShape( RoundedCorner(radius: radius, corners: corners) )
  }
}

struct RoundedCorner: Shape {

  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .bottomLeft

  func path(in rect: CGRect) -> Path {
      let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
      return Path(path.cgPath)
  }
}
