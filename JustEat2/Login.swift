//
//  Login.swift
//  JustEat2
//
//  Created by Rapipay on 15/02/23.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var userSetting: UserSettings
    
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var emailShowError:Bool = false
    @State private var passShowError:Bool = false
    @FocusState var isEmailFocused
    @FocusState var isPassFocused
    
    
    @State private var showAlert = false
    @State private var alertMsg = "Logged in Successfully"
    
    @Environment(\.presentationMode) var presentation
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        
    }

    var body: some View {
        VStack{
            Image("Image 2").resizable().scaledToFill().frame(width: 40, height: 200).padding(.vertical,40)
            CustomTextField("Email", showError: $emailShowError, text: $email).focused($isEmailFocused)
                .onSubmit {
                    emailShowError = !isValidEmail(email)
                    isEmailFocused.toggle()
            }

            PasswrdTextField("Password", text: $password, showError: $passShowError)
                .focused($isPassFocused)
                .onSubmit {
//                if password != "palak123"{
//                    passShowError = true
                    passShowError = !validatePswd(pswd: password)
                    isPassFocused.toggle()
//                }
            }
            SecondaryButton(btnTitle: "Log In"){
                
                if authenticateUser(email: email, pswd: password){
                    userSetting.signIn()
                    UserDefaults.standard.set(true, forKey: "loggedIn")
                }
                else{
                    alertMsg = "Invalid Credentials"
                    showAlert = true
                }
            }.alert(alertMsg, isPresented: $showAlert){
                Button("OK",role: .cancel){}
            }.padding(.vertical)
            .buttonStyle(PrimaryButtonStyle())
            .padding(32)
            
        }.padding(24)
    }
    func validatePswd(pswd: String) -> Bool {
        let pswdRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        let pswdPred = NSPredicate(format:"SELF MATCHES %@", pswdRegEx)
        return pswdPred.evaluate(with: pswd)
    }
    func authenticateUser(email: String, pswd: String) -> Bool {
        for user in users {
            if email == user.email! && pswd == user.password! {
                UserDefaults.standard.set(user.email!, forKey: "email")
                UserDefaults.standard.set(user.username!, forKey: "username")
                return true
            }
        }
        return false
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
