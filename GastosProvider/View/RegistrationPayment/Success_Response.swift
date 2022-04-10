//
//  Success_Response.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 08/04/22.
//

import SwiftUI

struct Success_Response: View {
   // var amount = "500"
    var amount = "\(paymentResponse.TXNAMOUNT!)"
    var active = "Activated"
  @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [Color("5"), Color("1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).overlay{
            VStack{
                Text("Welcome to").foregroundColor(.white).font(.system(size: 20, weight: .medium, design: .default))
                Text("GASTOS PROVIDERS CLUB").foregroundColor(.white).font(.system(size: 20, weight: .medium, design: .default))
                
                VStack{
                    Circle().foregroundColor(Color("1")).frame(width: 75, height: 75, alignment: .center).overlay{
                        Image(systemName:"checkmark").foregroundColor(.white).font(.system(size: 40, weight: .medium))
                    }.offset(y:40).zIndex(1.0)
                    ResponsePay(amount: amount, active: active )
                    HStack{
                        ForEach(0..<9){_ in
                            HStack{
                                Circle().trim(from: 0, to: 0.5).rotation(.degrees(180)).foregroundColor(Color("1")).frame(width: 25    , height: 34, alignment: .center)
                            }.offset(y:-25)
                        }
                    }
                    
                }//.padding(.vertical, 20)
                
                
                JumpToHome_Success()
                
            }
            .padding(.horizontal, 35)
            .environmentObject(loginViewModel)
        }
        
    }
}

struct Success_Response_Previews: PreviewProvider {
    static var previews: some View {
        Success_Response()
    }
}


struct ResponsePay: View{
    var amount : String
    var active: String
    @State var promoCodeApplied = false
 //   var saving: String
    var body: some View{
        VStack{
            Text("Payment Total").foregroundColor(.gray).font(.system(size: 13, weight: .medium, design: .default))
            Text("Rs \(amount)").foregroundColor(.black).font(.system(size: 29, weight: .semibold, design: .default)).padding(.vertical,5)
            Text("\(active)").foregroundColor(.black).font(.system(size: 29, weight: .semibold, design: .default)).padding(.vertical, 10)
            
            HStack(alignment: .bottom){
                Text("Date").foregroundColor(.gray).font(.system(size: 12, weight: .medium, design: .default))
                Spacer()
                Text(Date.now, format: .dateTime.year().month().day())
                    .foregroundColor(.black).font(.system(size: 12, weight: .medium, design: .default))
            }.padding(.vertical,5)
            
            
            HStack(alignment: .bottom){
                Text("Time").foregroundColor(.gray).font(.system(size: 12, weight: .medium, design: .default)).padding(.bottom, 30)
                Spacer()
                Text(Date.now, format: .dateTime.hour().minute().second())
                    .foregroundColor(.black).font(.system(size: 12, weight: .medium, design: .default)).padding(.bottom, 30)
            }.padding(.vertical, 5)
            
            
            
            HStack(alignment: .bottom){
                Text("Service Charge").foregroundColor(.gray).font(.system(size: 12, weight: .medium, design: .default))
                Spacer()
                Text("Rs \(amount)").foregroundColor(.black).font(.system(size: 12, weight: .medium, design: .default))
            }.padding(.vertical, 5)
            
            
            
//            HStack{
//                Text("Savings").foregroundColor(.gray).font(.system(size: 12, weight: .medium, design: .default))
//                Spacer()
//                Text("-Rs \(saving)").foregroundColor(.green).font(.system(size: 12, weight: .medium, design: .default))
//            }.padding(.vertical, 5)
            
            
            
        }.padding(.vertical, 80).padding(.horizontal, 20).background(Color.white).cornerRadius(22)
    }
}


struct JumpToHome_Success: View{
   // @State var click = false
  @EnvironmentObject var loginViewModel: LoginViewModel
    var body: some View{
        Button {
            //self.click.toggle()
          loginViewModel.madeRegistrationPayment = true

        } label: {
            RoundedRectangle(cornerRadius: 22).frame( height: 60, alignment: .center).foregroundColor(.white)
        }//.fullScreenCover(isPresented: $click) {
           // HomeScreen()
       // }
    .overlay{
            Text("Jump to home").foregroundColor(.black).font(.system(size: 20, weight: .medium, design: .default))
        }

        
    }
}
