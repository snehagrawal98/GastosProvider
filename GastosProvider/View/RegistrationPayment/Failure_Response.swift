//
//  Failure_Response.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 08/04/22.
//

import SwiftUI

struct Failure_Response: View {
    var amount = "299.00"
    var active = "Failed"
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color("2")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).overlay{
            VStack{
                Text("Welcome to").foregroundColor(.white).font(.system(size: 20, weight: .medium, design: .default))
                Text("GASTOS PROVIDERS CLUB").foregroundColor(.white).font(.system(size: 20, weight: .medium, design: .default))
                
                ResponsePay(amount: amount, active: active).padding(.vertical, 100)
                
                
                JumpToHome_Failure()
                
            }.padding(.horizontal, 30)
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
