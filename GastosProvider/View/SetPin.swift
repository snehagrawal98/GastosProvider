//
//  SetPin.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 20/01/22.
//

import SwiftUI

struct SetPin: View {
   // @State private var name = Array<String>.init(repeating: "", count: 3)
  @State var showingProfilePage = false
  @State var pin1 = ""
  @State var pin2 = ""
  @EnvironmentObject var loginViewModel: LoginViewModel
  @EnvironmentObject var currentUser: CurrentUser
  @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView{
            ZStack{
                Image("Layer3").offset(x: 100.0, y: -350.0)
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
                    Text("Set Login Pin").foregroundColor(Color("deepGreen")).font(.title2).fontWeight(.semibold).padding(.vertical, 30)
                    Spacer()
                    Spacer()
                  }

                    Text("Create your 4 Digit Login Pin")
                    .font(.title3.weight(.medium))
                    .foregroundColor(Color("deepGreen"))
                    HStack{
                    TextField("New Pin", text: $pin1).frame(width: 350, height: 65, alignment: .center)
                            .textFieldStyle(MyTextFieldStyle()).padding(.leading, 3).keyboardType(.decimalPad).onTapGesture {
                                self.hideKeyboard()
                            }
                        Spacer()
                    }

                    HStack{
                    TextField("Re-enter Pin", text: $pin2)
                        .frame(width: 350, height: 65, alignment: .center)
                        .textFieldStyle(MyTextFieldStyle()).padding(.leading, 3).keyboardType(.decimalPad).onTapGesture {
                            self.hideKeyboard()
                        }
                        Spacer()
                    }


                    Spacer()
                    HStack{
                      Spacer()
//                      NavigationLink(destination: ProfilePage()
//                                      .navigationBarHidden(true)
//                                      .navigationBarBackButtonHidden(true), isActive: $loginViewModel.didSetPin) {
//                        Text("")
//                          .hidden()
//                      }

                      Button(action: {
                        self.didEnterProperPin()
                          self.hideKeyboard()
                      }, label: {
                            Image(systemName: "chevron.right").font(.system(size: 25)).foregroundColor(.white).frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                        .padding(3)
                        .background(Color("textGreen"))
                        .clipShape(Circle())
                        .padding()
                        
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Image(systemName: "arrow.backward")).foregroundColor(Color("5"))
        }
    }

  func didEnterProperPin() {
    if pin1 != "" && pin1 == pin2 {
      loginViewModel.pin = pin1
      currentUser.pin = loginViewModel.pin
      currentUser.uid = loginViewModel.uid
      loginViewModel.registerMerchantPin()
    }
  }
}

struct SetPin_Previews: PreviewProvider {
    static var previews: some View {
      SetPin()
        .environmentObject(LoginViewModel())
        .environmentObject(CurrentUser())
    }
}


struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .shadow(color: Color("gray"), radius: 8, x: 0.0, y: 10.0).foregroundColor(.white)
        )
    }
}


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
