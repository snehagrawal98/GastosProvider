//
//  Resp.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 05/04/22.
//

import SwiftUI

struct Resp: View {
    @State var model : [Response] = []
    var body: some View {
        VStack{
            
        }.onAppear(perform: {
            guard let url : URL = URL(string: "https://gastos-paytm-gatway.herokuapp.com/paywithpaytmresponse") else {
                return
            }
            
            var urlRequest:URLRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            URLSession.shared.dataTask(with: urlRequest, completionHandler:  { (data, response, error) in
                guard let data = data else {
                    print("invalid response")
                    return
                }
                do{
                    
                 self.model = try JSONDecoder().decode([Response].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            }).resume()
        })
    }
}

struct Resp_Previews: PreviewProvider {
    static var previews: some View {
        Resp()
    }
}
