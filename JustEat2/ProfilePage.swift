//
//  ProfilePage.swift
//  JustEat2
//
//  Created by Rapipay on 27/02/23.
//

import SwiftUI

struct ProfilePage: View {
    @State private var showAlert: Bool = false
    @Binding var profilePage: Bool
    @State var email = UserDefaults.standard.value(forKey: "email") as? String
    @State var name = UserDefaults.standard.value(forKey: "username") as? String
    @Binding var log: Bool
    @EnvironmentObject var settings: UserSettings
//    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>

    var body: some View {
//        NavigationView{
            ZStack(alignment: .top){
                
                Color("DarkShade").ignoresSafeArea()
                VStack{
                    
                    HStack(alignment: .top, spacing: 0){
                        VStack(alignment: .leading){
                            
//
                            Text(name ?? "palak").foregroundColor(.black).font(.system(size:30)).frame(height: 30)
                            Text(email ?? "palak@gmail.com").tint(.black)
                            
                            HStack{
                                Text("view activity").foregroundColor(.pink)
                                Image(systemName: "arrowtriangle.right.fill").frame(width: 10, height: 5).foregroundColor(Color("DarkShade"))
                            }
                        }
                        Spacer()
//                        Image("profile").resizable().scaledToFit()
//                            .frame(width: 100, height: 100)
                        Image(systemName: ((name?[name!.startIndex].lowercased() ?? "")! + ".circle.fill"))
                            .resizable().scaledToFit()
                            .frame(width: 80, height: 80)
                        
                        
                    }.padding().background(Color(.white)).cornerRadius(20)
                    
                    List {
                        
                        Section(header:
                                    HStack{
                            Divider() .frame(width: 4)
                                .background(Color.pink)
                            Text("Food orders")
                        }.padding(.leading,-20))
                        {
                            HStack{
                                Image(systemName: "bag.fill")
                                //                                .overlay(RoundedRectangle)
                                //                                .clipShape(Circle())
                                    .foregroundColor(Color("DarkShade"))
                                Text("Your orders")
                                Spacer()
                                Image(systemName: "chevron.forward").foregroundColor(Color.gray)
                                
                            }
                            HStack{
                                Image(systemName: "book.closed.circle").foregroundColor(Color("DarkShade")).frame(width: 20, height: 20)
                                Text("Address book")
                                Spacer()
                                Image(systemName: "chevron.forward").foregroundColor(Color.gray)
                                
                            }
                            
                        }
                    }.listStyle(InsetListStyle()).frame(height: 150).cornerRadius(20)
                    
                    List{
                        
                        Section(header:
                                    HStack{
                            Divider() .frame(width: 4, alignment: .leading).overlay(Color.pink)
                            //                            .background(Color.blue)
                            Text("More")
                        }.padding(.leading,-20))
                        {
                            HStack{
                                Image(systemName: "info.circle").foregroundColor(Color("DarkShade"))
                                Text("About")
                                Spacer()
                                Image(systemName: "chevron.forward")               .foregroundColor(Color.gray)
                            }
                            HStack{
                                Image(systemName: "power.circle.fill").foregroundColor(Color("DarkShade"))
                                Text("Log out")
                                Spacer()
                                Image(systemName: "chevron.forward").foregroundColor(Color.gray)
                            }.alert("Are you sure you want to Log Out",isPresented: $showAlert){
                                Button("Logout") {
                                    log = false
                                }.onTapGesture(perform: {
                                    //                                    NavigationLink()
                                })
                                Button("Cancle"){
                                    
                                }
                            }.onTapGesture(perform: {
                                showAlert = true
//                                
                                
                                
                                
                                
                            })
                        }
                        
                    }.listStyle(InsetListStyle()).cornerRadius(20).frame(height: 150)
                    
                    
                    
                }.padding().cornerRadius(20)
                
            }.padding(.top,70)
            .overlay(ProfileHeader(title: "Profile"))
//            .overlay(HeaderContent(pageTitle: "Profile", profilePage: profilePage))
//            .overlay(HeaderContent(pageTitle: "Profile", profilePage: false))
//        .overlay(HeaderContent(i: .constant(true)))
    }
}

//struct ProfilePage_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilePage( log: .constant(false))
//    }
//}
