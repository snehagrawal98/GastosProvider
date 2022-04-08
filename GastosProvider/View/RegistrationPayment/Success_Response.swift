//
//  Success_Response.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 08/04/22.
//

import SwiftUI

struct Success_Response: View {
    var amount = "299.00"
    var active = "Activated"
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("5"), Color("1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).overlay{
            VStack{
                Text("Welcome to").foregroundColor(.white).font(.system(size: 20, weight: .medium, design: .default))
                Text("GASTOS PROVIDERS CLUB").foregroundColor(.white).font(.system(size: 20, weight: .medium, design: .default))
                
                ResponsePay(amount: amount, active: active).padding(.vertical, 100)
                
                
                JumpToHome_Success()
                
            }.padding(.horizontal, 30)
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
    var body: some View{
        VStack{
            Text("Payment Total").foregroundColor(.gray).font(.system(size: 13, weight: .medium, design: .default))
            Text("Rs \(amount)").foregroundColor(.black).font(.system(size: 29, weight: .semibold, design: .default)).padding(.vertical,5)
            Text("\(active)").foregroundColor(.black).font(.system(size: 29, weight: .semibold, design: .default)).padding(.vertical, 14)
            
            HStack{
                Text("Date").foregroundColor(.gray).font(.system(size: 12, weight: .medium, design: .default))
                Spacer()
                Text(Date.now, format: .dateTime.year().month().day())
                    .foregroundColor(.black).font(.system(size: 12, weight: .medium, design: .default))
            }.padding(.vertical,5)
            
            
            HStack{
                Text("Time").foregroundColor(.gray).font(.system(size: 12, weight: .medium, design: .default))
                Spacer()
                Text(Date.now, format: .dateTime.hour().minute().second())
                    .foregroundColor(.black).font(.system(size: 12, weight: .medium, design: .default))
            }.padding(.vertical, 5)
            
            
            
            HStack{
                Text("Service Charge").foregroundColor(.gray).font(.system(size: 12, weight: .medium, design: .default))
                Spacer()
                Text("Rs 345").foregroundColor(.black).font(.system(size: 12, weight: .medium, design: .default))
            }.padding(.vertical, 5)
            
            
            
            HStack{
                Text("Savings").foregroundColor(.gray).font(.system(size: 12, weight: .medium, design: .default))
                Spacer()
                Text("-Rs 345").foregroundColor(.green).font(.system(size: 12, weight: .medium, design: .default))
            }.padding(.vertical, 5)
            
            
            
        }.padding(.vertical, 20).padding(.horizontal, 20).background(Color.white).cornerRadius(22)
    }
}


struct JumpToHome_Success: View{
    @State var click = false
    var body: some View{
        Button {
            self.click.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 22).frame( height: 60, alignment: .center).foregroundColor(.white)
        }.fullScreenCover(isPresented: $click) {
            HomeScreen()
        }.overlay{
            Text("Jump to home").foregroundColor(.black).font(.system(size: 20, weight: .medium, design: .default))
        }

        
    }
}
