//
//  HeaderContent.swift
//  JustEat2
//
//  Created by Rapipay on 28/02/23.
//

import SwiftUI

struct HeaderContent: View {
    //    @Binding var i: Bool'
    @State var pageTitle: String
    @State private var isTrue = false
    @State private var showAlert = false
    @State var profilePage = false
    var body: some View {
        
        ZStack{
            Color.clear.background(.ultraThinMaterial)
//                .blur(radius: 10)
            HStack{
//                if !profilePage{
                    NavigationLink(destination: ProfilePage(profilePage:  $profilePage, log: .constant(false)) , isActive: $isTrue){
                        Button(action:{
                            isTrue = true
                        }){
//                            if !profilePage{
                            //label
                            Image(systemName: "figure.wave").font(.title).foregroundColor(Color("DarkShade"))
                            
//                        }
                            
                        }
                }
                Text(pageTitle).frame(maxWidth: .infinity).font(.largeTitle)
                Spacer()
                Button(action:{}){
                    Image(systemName: "mappin").font(.title).foregroundColor(Color("DarkShade"))
                }
                    
//                Button(action:{}){
////                    .alert("Change the language from phone settings!", isPresented: $showAlert)
//                    Image(systemName: "character.book.closed.hi").font(.title).foregroundColor(Color("DarkShade"))
//                }

                Button{
                    showAlert.toggle()
                } label: {
                    Image(systemName: "character.book.closed.hi").font(.title).foregroundColor(Color("DarkShade"))
                }
                .alert( isPresented: $showAlert){
                    Alert(
                        title: Text("Change the language from phone settings"),
                        primaryButton: .destructive(Text("cancel")){},
                        secondaryButton:
                                .default(Text("settings"))
//                                .destructive(Text("cancel")){}
                            
                        )
                    
                }

                
//                Button(action:{}){
////                    .alert("Change the language from phone settings!", isPresented: $showAlert)
//                    Image(systemName: "character.book.closed.hi").font(.title).foregroundColor(Color("DarkShade"))
//                }

                
//                location language
                //                    ProfilePage(log: .constant(false))
                
                
            }
        }.padding(.horizontal,20)
            .frame(height: 70)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct HeaderContent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderContent(pageTitle: "")
    }
}
