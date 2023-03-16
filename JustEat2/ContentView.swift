//
//  ContentView.swift
//  JustEat2
//
//  Created by Rapipay on 15/02/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var settings: UserSettings
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    var body: some View {
        NavigationView {
           
                if settings.loggedIn || UserDefaults.standard.bool(forKey: "loggedIn"){
                    //                    TabBar(login: $settings.loggedIn)
                    TabBar(login: $settings.loggedIn).onAppear() {
                        for user in users {
                            if user.email == UserDefaults.standard.value(forKey: "email") as? String     {
                                settings.SetUser(user: user)
                            }
                        }
                    }
                }
                    
            
                else {
                    GetStartedView(logged: $settings.loggedIn)
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
