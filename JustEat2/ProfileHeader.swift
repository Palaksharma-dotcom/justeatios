//
//  ProfileHeader.swift
//  JustEat2
//
//  Created by Rapipay on 16/03/23.
//

import SwiftUI

struct ProfileHeader: View {
    
        //    @Binding var i: Bool'
        @State var title: String
        @State private var isTrue = false
        @State private var showAlert = false
//        @State var profilePage = false
        var body: some View {
            
            ZStack{
                Color.clear.background(.ultraThinMaterial)
    //                .blur(radius: 10)
                HStack{
    //                if !profilePage{
                        
                    Text(title).frame(maxWidth: .infinity).font(.largeTitle)
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


struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(title: "Profile")
    }
}
