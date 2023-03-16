//
//  GetStartedView.swift
//  JustEat2
//
//  Created by Rapipay on 17/02/23.
//

import SwiftUI

struct GetStartedView: View {
    @State private var  loginIsActive = false
    @State private var signupIsActive = false
    var body: some View {
//        NavigationView{
            ZStack{
                Color("DarkShade").ignoresSafeArea()
                VStack{
                    HStack{
                        Spacer()
                        Image("PizzaBW").resizable().scaledToFill().frame(width: 150,height: 150)
                    }
                    Spacer()
                    Text("Food For You")
                    Text("With Greatest Ingredient")
                    NavigationLink(destination: Login(), isActive: $loginIsActive){
                        Button("Log In"){
                            loginIsActive = true
                        }.padding(.horizontal,20)
                    }
                    
                    NavigationLink(destination: SignUp(), isActive: $signupIsActive){
                        Button("SignUp"){
                            signupIsActive = true
                        }.padding(.horizontal,20)
                    }
                     
                    Spacer()
                    HStack{
                        Spacer()
                        Image("Pizza").resizable().scaledToFill().frame(width: 150, height: 150)
                    }
                }
            }
//        }
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
