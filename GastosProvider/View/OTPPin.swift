//
//  OTPPin.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 20/01/22.
//

import SwiftUI

struct OTPPin: View {
  @State var nextPin = false
  @EnvironmentObject var loginViewModel: LoginViewModel
 // @EnvironmentObject var currentUser: CurrentUser
 // @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

  @State var otp = ["","","","","",""]

  var body: some View {
    NavigationView {
      ZStack{
        Image("Layer3").offset(x: 95.0, y: -300.0)
        VStack{
          // Navigation bar
          HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 25, height: 15)
                .foregroundColor(Color("deepGreen"))
                .padding()
            })

            Spacer()
            Text("Verify").foregroundColor(Color("deepGreen")).font(.system(size: 25)).fontWeight(.medium).padding(.vertical, 30)
            Spacer()
            Spacer()
          }

          Text("We have sent an OTP on your ").foregroundColor(Color("deepGreen")).font(.system(size: 18)).fontWeight(.medium)
          Text("number \(loginViewModel.auth.phone)").foregroundColor(Color("deepGreen")).font(.system(size: 18)).fontWeight(.medium).padding(.bottom, 100)

          HStack{
            TextField("Enter OTP", text: $loginViewModel.code).textFieldStyle(MyTextFieldStyle()).onTapGesture {
                self.hideKeyboard()
            }

//            TextField("", text: $otp[0]).frame(width: 30, height: 30, alignment: .center).underlineTextField().keyboardType(.decimalPad)
//            TextField("", text:$otp[1]).frame(width: 30, height: 30, alignment: .center).underlineTextField().keyboardType(.decimalPad)
//            TextField("", text:$otp[2]).frame(width: 30, height: 30, alignment: .center).underlineTextField().keyboardType(.decimalPad)
//
//            Text("-")
//              .scaleEffect(2)
//              .foregroundColor(Color("deepGreen"))
//
//            TextField("", text:$otp[3]).frame(width: 30, height: 30, alignment: .center).underlineTextField().keyboardType(.decimalPad)
//            TextField("", text:$otp[4]).frame(width: 30, height: 30, alignment: .center).underlineTextField().keyboardType(.decimalPad)
//            TextField("", text:$otp[5]).frame(width: 30, height: 30, alignment: .center).underlineTextField().keyboardType(.decimalPad)

            }.padding().background(
                RoundedRectangle(cornerRadius: 40)
                    .shadow(color: Color("gray"), radius: 43, x: 0.0, y: 10.0).foregroundColor(.white)
            )
            HStack{
                Spacer()
                Button(action: {
                  loginViewModel.requestCode()
                    self.hideKeyboard()
                }, label: {
                Text("Resend OTP").foregroundColor(.gray).fontWeight(.medium).font(.system(size: 13))
            }).padding(.horizontal).background(
                Capsule().stroke(Color.gray)
                    .shadow(color: Color("gray"), radius: 43, x: 0.0, y: 10.0).foregroundColor(.white)
            ).padding(9)
            }
            Spacer()

            HStack{
              Spacer()

//              NavigationLink(destination: SetPin()
//                        .navigationBarHidden(true)
//                        .navigationBarBackButtonHidden(true), isActive: $loginViewModel.status) {
//                Text("")
//                  .hidden()
//              }

              Button(action: {
                //loginViewModel.code = self.otp.joined()
                loginViewModel.verifyCode()
              }, label: {
                Image(systemName: "chevron.right").font(.system(size: 25)).foregroundColor(.white).frame(width: 50, height: 50, alignment: .center)
            }).padding(3).background(Color("textGreen")).clipShape(Circle()).padding()
            }
        }
      }
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
        .alert(isPresented: $loginViewModel.error) {
          Alert(title: Text("Message"), message: Text(loginViewModel.errorMsg), dismissButton: .default(Text("Ok")))
      }
    }
  }
}

struct OTPPin_Previews: PreviewProvider {
    static var previews: some View {
      OTPPin()
//        .environmentObject(LoginViewModel())
//        .environmentObject(CurrentUser())

    }
}

extension View {
  func underlineTextField() -> some View {
      self
          .padding(.vertical, 10)
          .overlay(Rectangle().frame(height: 2).padding(.top, 35))
          .foregroundColor(Color("deepGreen"))
          .padding(5)
  }
}
