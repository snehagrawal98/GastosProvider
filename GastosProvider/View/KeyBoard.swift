//
//  KeyBoard.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 20/01/22.
//

import SwiftUI

struct KeyBoard: View {
  @State var status = false

  var body: some View {

      NavigationView{

          VStack{

              Spacer()
              if status {

              } else {
                  Verification()

              }

          }.onAppear(){
              NotificationCenter.default.addObserver(forName: NSNotification.Name("Success"), object: nil, queue: .main) { (_) in
                  self.status = true

              }
          }.navigationBarItems(leading: Image(systemName: "arrow.backward")).foregroundColor(Color("5"))
          .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
          .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

      }.animation(.spring())
  }
}

struct keyBoard_Previews: PreviewProvider {
  static var previews: some View {
      KeyBoard()
  }
}


struct type: Identifiable{
  var id : Int
  var row : [row]
}

struct row : Identifiable{
  var id : Int
  var value : String
}

struct NumberPad: View{
  @Binding var codes : [String]
  var body: some View{
      VStack(alignment: .leading, spacing: 20){
          ForEach(datas){i in

              HStack(spacing: self.getspacing()){

                  ForEach(i.row){j in
                      Button(action: {
                          if j.value == "delete.left"{
                              self.codes.removeLast()
                          } else {
                              self.codes.append(j.value)
                              if self.codes.count == 7 {

                                  print(self.getCode()) //verification code after notif


                                  NotificationCenter.default.post(name: NSNotification.Name("Success"), object: nil)
                                  self.codes.removeAll()
                              }
                          }
                      }){
                          if j.value == "delete.left"{
                              Image(systemName: j.value).font(.title).padding(.vertical)
                          } else if j.value == "chevron.forward"{
                              Image(systemName: j.value).font(.title).padding(.vertical)
                          } else {
                              Text(j.value).font(.title).font(.system(.title)).padding(.vertical)
                          }

                      }.frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                  }
              }



          }
      }.foregroundColor(.white).background(Color("5"))
      .cornerRadius(25)
  }
  func getspacing() -> CGFloat{
      return UIScreen.main.bounds.width/2.5
  }

  func getCode()->String{
      var code = ""
      for i in self.codes{
          code += i
      }
      return code
  }
}

var datas = [
  type(id:0, row: [row(id:0, value: "1"),row(id:1, value: "2"), row(id:2, value: "3")]),
  type(id:1, row: [row(id:0, value: "4"),row(id:1, value: "5"), row(id:2, value: "6")]),
  type(id:2, row: [row(id:0, value: "7"),row(id:1, value: "8"), row(id:2, value: "9")]),
  type(id:3, row: [row(id:0, value: "delete.left"),row(id:1, value: "0"),row(id:2, value: "")])
]


struct Verification: View{

  @State var code: [String] = []
  var body : some View{

      ZStack{
          Image("Layer3").offset(x: 100.0, y: -350.0)
      VStack(spacing: 20){


          Text("Verify").fontWeight(.semibold).font(.system(size: 35)).foregroundColor(Color("5"))
          Spacer()
          Text("Enter Verification Code").fontWeight(.semibold).font(.system(size: 25)).foregroundColor(Color("5"))
          Spacer()
          HStack{
              ForEach(code, id:\.self){i in
                  Text(i).font(.title).fontWeight(.medium).foregroundColor(Color("5")).multilineTextAlignment(.center)

              }
          }.padding(.vertical)
          Spacer()
          NumberPad(codes: $code)
      }
      }
  }
}
