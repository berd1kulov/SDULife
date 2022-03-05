//
//  Login.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

struct Login: View {
    
    @StateObject private var loginViewModel = LoginViewModel()
    @State private var isSecured: Bool = true
    @State private var emailIsEmpty: Bool = false
    @State private var passwordIsEmpty: Bool = false
    
    @State var fullScreenCover: Bool = UserDefaults.standard.string(forKey: "token") != nil
    var body: some View {
        GeometryReader{ geom in
            ZStack{
                VStack{
                    VStack{
                        Image("logo")
                            .resizable()
                            .frame(width: 68, height: 54)
                        Text("Welcome")
                            .font(Font.custom("Poppins-SemiBold", size: 18))
                            .foregroundColor(.brandPrimary)
                    }
                    .frame(width: 100, height: 250, alignment: .center)
                    
                    TextField("ID", text: $loginViewModel.email)
                        .keyboardType(.numberPad)
                        .font(Font.custom("Poppins-Regular", size: 16))
                        .overlay(Rectangle().frame(height: 1).padding(.top, 35))
                        .frame(width: geom.size.width-48, height: 56)

                    if(emailIsEmpty){
                        HStack{
                            Text("Email can not be empty")
                                .foregroundColor(Color.red)
                                .font(Font.custom("Poppins-Light", size: 13))
                                .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                            Spacer()
                        }
                    }
                    
                    SecureField("Password", text: $loginViewModel.password)
                        .overlay(Rectangle().frame(height: 1).padding(.top, 35))
                        .font(Font.custom("Poppins-Regular", size: 16))
                        .frame(width: geom.size.width-48, height: 56)
                    if(passwordIsEmpty){
                        HStack{
                            Text("Password can not be empty")
                                .foregroundColor(Color.red)
                                .font(Font.custom("Poppins-Light", size: 13))
                                .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                            Spacer()
                        }
                    }
                    if(loginViewModel.error != nil && !emailIsEmpty && !passwordIsEmpty){
                        HStack{
                            Text(loginViewModel.error ?? "")
                                .foregroundColor(Color.red)
                                .font(Font.custom("Poppins-Light", size: 13))
                                .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if(loginViewModel.email.isEmpty){
                            self.emailIsEmpty = true
                        }else{
                            self.emailIsEmpty = false
                        }
                        if(loginViewModel.password.isEmpty){
                            self.passwordIsEmpty = true
                        }else{
                            self.passwordIsEmpty = false
                        }
                        if(!loginViewModel.email.isEmpty && !loginViewModel.password.isEmpty){
                            loginViewModel.login()
                        }
                        
                    }, label: {
                        Text("Log in")
                            .frame(width: geom.size.width-48, height: 56, alignment: .center)
                            .font(Font.custom("Poppins-Regular", size: 16))
                            .foregroundColor(.white)
                            .background(Color.brandPrimary)
                            .cornerRadius(2)
                    })
                        .disabled(loginViewModel.isLoading == true)
                        .padding()
                        .fullScreenCover(isPresented: $loginViewModel.isAuthenticated, content: {
                            SDULifeTabView(fullScreenCover: $loginViewModel.isAuthenticated)
                        })
                }.frame(width: abs(geom.size.width), alignment: .center)
                if loginViewModel.isLoading {
                   
                    LoadingView()
                    
                }
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}


