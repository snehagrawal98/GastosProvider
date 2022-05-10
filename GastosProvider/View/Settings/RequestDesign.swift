//
//  RequestDesign.swift
//  GastosProvider
//
//  Created by Sneha Agrawal on 17/03/22.
//

import SwiftUI

struct RequestDesign: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showingPopover = false
    @State var brandName = ""
    @State var brandTagline = ""
    @State var color = ""
    @State var text: String = ""
@State var placeholderText = "Describe your vision for design"
    @State var text1: String = ""
@State var placeholderText1 = "Any comments you want to add"
    var designType = ["Visiting Card", "Flyer", "Brochure(Trifold)", "Logo", "Banner", "Menu","Others(Specify)"]
    @State var showDesign = false
    @State var design = ""


    var body: some View {
        ZStack{
            VStack(alignment: .leading){
            HStack {
              Button(action: {
                  presentationMode.wrappedValue.dismiss()
              }, label: {
                Image(systemName: "arrow.left")
                  .resizable()
                  .frame(width: 24, height: 20)
                  .foregroundColor(.primary)
              })

              Spacer()

                SettingsTitleView(title: "Request Design").padding(.horizontal)
                
               
              Spacer()
            }
                ScrollView{
                Text("Graphic Type").foregroundColor(.black).font(.system(size:15, weight: .bold, design: .default))
                    
                    
                    VStack {
                      Button(action: {
                        showDesign.toggle()
                      }, label: {
                        HStack {
                          Group {
                            if design.isEmpty {
                              Text("Select Design Type")
                            } else {
                              Text(design)
                            }
                          }
                          .font(.headline.weight(.regular))
                          .foregroundColor(Color("basicDetailsText"))
                          .padding(.leading, 17)
                          .padding(.vertical, 10)

                          Spacer()

                          Image(systemName: "chevron.down")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 17)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                        }) //: BUTTON
                        .confirmationDialog("Designs", isPresented: $showDesign, titleVisibility: .visible) {
                          ForEach(0..<designType.count, id: \.self) { category in
                            Button(action: {
                                design = designType[category]
                            }, label: {
                                Text(designType[category]).foregroundColor(.gray)
                            })
                          }
                        }
                    }
                    .frame(width: 0.885 * UIScreen.screenWidth, height: 0.053 * UIScreen.screenHeight, alignment: .leading)
                    .background(Color.white.cornerRadius(10))
                    .background(
                      RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("textGreen").opacity(0.2), lineWidth: 2)
                    )
                    
                    
                    TextField("Brand Name", text: $brandName)
                        .textFieldStyle(BasicDetailsTextFieldStyle()).padding(.horizontal)
                
                        TextField("Brand Tagline", text: $brandTagline)
                            .textFieldStyle(BasicDetailsTextFieldStyle()).padding(.horizontal)
                    
                        TextField("Preferred Color Theme", text: $color)
                            .textFieldStyle(BasicDetailsTextFieldStyle()).padding(.horizontal)
                    
                    ZStack {
                        if self.text.isEmpty {
                                TextEditor(text:$placeholderText)
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .disabled(true)
                                    .padding(.horizontal,19)
                        }
                        TextEditor(text: $text)
                            .opacity(self.text.isEmpty ? 0.25 : 1)
                            .font(.headline.weight(.regular))
                            .foregroundColor(Color("basicDetailsText"))
                            .padding(.leading, 17)
                            .padding(.vertical, 2)
                            .frame(width: 0.885 * UIScreen.screenWidth, height: 0.153 * UIScreen.screenHeight, alignment: .leading)
                           
                            .background(
                              RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("textGreen").opacity(0.2), lineWidth: 2)
                          )
                    }
                    
                    
                    ZStack {
                        if self.text1.isEmpty {
                                TextEditor(text:$placeholderText1)
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .disabled(true)
                                    .padding(.horizontal,19)
                        }
                        TextEditor(text: $text1)
                            .opacity(self.text1.isEmpty ? 0.25 : 1)
                            .font(.headline.weight(.regular))
                            .foregroundColor(Color("basicDetailsText"))
                            .padding(.leading, 17)
                            .padding(.vertical, 2)
                            .frame(width: 0.885 * UIScreen.screenWidth, height: 0.153 * UIScreen.screenHeight, alignment: .leading)
                           
                            .background(
                              RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("textGreen").opacity(0.2), lineWidth: 2)
                          )
                    }
                
                    
                    
                    
                }
                Spacer()
            }.padding().overlay(
                ZStack {
                  BasicScreensBottomBackground()
                  HStack {
                    BasicScreensBottomLeftText(firstLine: "Wallet Balance ", secondLine: "Rs 2400")
                      .padding(.leading)
                    Spacer()

                    Button(action: { //self.didEnterAllData()
                        self.showingPopover = true
                        self.hideKeyboard()
                        
                    }, label: {
                      BasicScreensBottomRighttText(buttonText: "Next")
                    })
                  }
                }.padding()
                    .frame(height: UIScreen.screenHeight, alignment: .bottom).offset(y:25)
        )
            
            if showingPopover{
                Alert1(show: $showingPopover)
              //  popUp1(dismiss: $showingPopover)
            }
        }
    }
}

struct RequestDesign_Previews: PreviewProvider {
    static var previews: some View {
        RequestDesign()
    }
}
