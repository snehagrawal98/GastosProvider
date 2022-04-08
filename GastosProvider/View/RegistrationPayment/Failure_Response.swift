//
//  Failure_Response.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 08/04/22.
//

import SwiftUI

struct Failure_Response: View {
    var amount = "\(paymentResponse.TXNAMOUNT!)"
    var active = "Failed"
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color("2")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).overlay{
            VStack{
                Text("Welcome to").foregroundColor(.white).font(.system(size: 20, weight: .medium, design: .default))
                Text("GASTOS PROVIDERS CLUB").foregroundColor(.white).font(.system(size: 20, weight: .medium, design: .default))
                VStack{
                    Circle().foregroundColor(Color("2")).frame(width: 75, height: 75, alignment: .center).overlay{
                        Image(systemName:"multiply").foregroundColor(.white).font(.system(size: 40, weight: .medium))
                    }.offset(y:40).zIndex(1.0)
                ResponsePay(amount: amount, active: active)
                    HStack{
                        ForEach(0..<9){_ in
                            HStack{
                                Circle().trim(from: 0, to: 0.5).rotation(.degrees(180)).foregroundColor(Color("2")).frame(width: 25    , height: 34, alignment: .center)
                            }.offset(y:-25)
                        }
                    }
                }
                JumpToHome_Failure()
                
            }.padding(.horizontal, 35)
        }
        
    }
}

struct Failure_Response_Previews: PreviewProvider {
    static var previews: some View {
        Failure_Response()
    }
}



struct JumpToHome_Failure: View{
    @State var click = false
    var body: some View{
        Button {
            self.click.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 22).frame( height: 60, alignment: .center).foregroundColor(.white)
        }.fullScreenCover(isPresented: $click) {
            RegistrationPayment()
        }.overlay{
            Text("Jump to home").foregroundColor(.black).font(.system(size: 20, weight: .medium, design: .default))
        }

        
    }
}
