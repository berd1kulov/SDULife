//
//  ProfileView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 19.11.2021.
//

import SwiftUI
import UserNotifications
import SDWebImageSwiftUI

struct ProfileView: View {
    
    @Binding var isUserLoggedIn: Bool
    var labelHeight: CGFloat = 50
    @State var isNotificationsOn: Bool = false
    @StateObject var viewModel = UserViewModel()
    var body: some View {
        ZStack{
            NavigationView{
                ScrollView{
                    VStack{
                        Image("no_user_image")
                            .resizable()
                            .frame(width: 104, height: 104)
                            .cornerRadius(52)
                            .padding()
                        Group{
                            HStack{
                                Text("GENERAL INFORMATION")
                                    .font(Font.custom("Poppins-Regular", size: 12))
                                    .opacity(0.5)
                                Spacer()
                            }
                            
                            HStack{
                                Text("Full Name")
                                    .frame(width: 124, height: 20, alignment: .leading)
                                    .font(Font.custom("Poppins-Regular", size: 13))
                                    .opacity(0.7)
                                Text("\(viewModel.user.name)")
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(height: labelHeight)
                            Divider()
                            
                            //                        HStack{
                            //                            Text("Id number")
                            //                                .frame(width: 124, height: 20, alignment: .leading)
                            //                                .font(.system(size: 13))
                            //                                .opacity(0.7)
                            //                            Text("\(viewModel.user.id)")
                            //                                .font(.system(size: 16))
                            //                            Spacer()
                            //                        }
                            //                        .frame(height: labelHeight)
                            //
                            //                        Divider()
                            
                            HStack{
                                Text("Speciality")
                                    .frame(width: 124, height: 20, alignment: .leading)
                                    .font(Font.custom("Poppins-Regular", size: 13))
                                    .opacity(0.7)
                                Text("\(viewModel.user.speciality)")
                                    .font(Font.custom("Poppins-Regular", size: 16))
                                Spacer()
                            }
                            .frame(height: labelHeight)
                            Divider()
                            
                            HStack{
                                Text("Birthday")
                                    .frame(width: 124, height: 20, alignment: .leading)
                                    .font(Font.custom("Poppins-Regular", size: 13))
                                    .opacity(0.7)
                                Text("\(viewModel.user.birthdate)")
                                    .font(Font.custom("Poppins-Regular", size: 16))
                                Spacer()
                            }
                            .frame(height: labelHeight)
                            Divider()
                                .padding(.init(top: 0, leading: 0, bottom: 48, trailing: 0))
                        }
                        
                        Group{
                            HStack{
                                Text("MY ACTIVITIES")
                                    .font(Font.custom("Poppins-Regular", size: 12))
                                    .opacity(0.5)
                                Spacer()
                            }
                            NavigationLink(destination: {
                                StudentProfileView(user: viewModel.user)
                            }, label: {
                                HStack{
                                    Text("Transcript")
                                        .frame(height: 20, alignment: .leading)
                                        .font(Font.custom("Poppins-Regular", size: 16))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .accentColor(Color.primary)
                                .frame(height: labelHeight)
                                
                            })
                            
                            Divider()
                                .padding(.init(top: 0, leading: 0, bottom: 48, trailing: 0))
                        }
                        
                        Group{
                            HStack{
                                Text("CONTACTS")
                                    .font(Font.custom("Poppins-Regular", size: 12))
                                    .opacity(0.5)
                                Spacer()
                            }
                            //                        HStack{
                            //                            Text("Phone")
                            //                                .frame(width: 124, height: 20, alignment: .leading)
                            //                                .font(.system(size: 13))
                            //                                .opacity(0.7)
                            //                            Text("---------------")
                            //                                .font(.system(size: 16))
                            //                            Spacer()
                            //                        }
                            //
                            //                        .frame(height: labelHeight)
                            //
                            //                        Divider()
                            
                            HStack{
                                Text("Email")
                                    .frame(width: 124, height: 20, alignment: .leading)
                                    .font(Font.custom("Poppins-Regular", size: 13))
                                    .opacity(0.7)
                                Text("\(viewModel.user.email)")
                                    .font(Font.custom("Poppins-Regular", size: 16))
                                Spacer()
                            }
                            .frame(height: labelHeight)
                            Divider()
                                .padding(.init(top: 0, leading: 0, bottom: 48, trailing: 0))
                            
                        }
                        
                        Group{
                            HStack{
                                Text("ACCOUNT SETTINGS")
                                    .font(Font.custom("Poppins-Regular", size: 12))
                                    .opacity(0.5)
                                Spacer()
                            }
                            NavigationLink(destination: {
                                
                            }, label: {
                                HStack{
                                    Text("Language")
                                        .frame(width: 124, height: 20, alignment: .leading)
                                        .font(Font.custom("Poppins-Regular", size: 16))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .accentColor(Color.primary)
                                .frame(height: labelHeight)
                            }).disabled(true)
                            
                            Divider()
                            
                            
                            Button(action: {
                                guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }, label: {
                                HStack{
                                    Text("Notification")
                                        .frame(width: 124, height: 20, alignment: .leading)
                                        .font(Font.custom("Poppins-Regular", size: 16))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .accentColor(Color.primary)
                                .frame(height: labelHeight)
                            })
                            
                            Divider()
                                .padding(.init(top: 0, leading: 0, bottom: 48, trailing: 0))
                        }
                        
                        Group{
                            HStack{
                                Text("TOOLS")
                                    .font(Font.custom("Poppins-Regular", size: 12))
                                    .opacity(0.5)
                                Spacer()
                            }
                            NavigationLink(destination: {
                                
                            }, label: {
                                HStack{
                                    Text("About")
                                        .frame(width: 124, height: 20, alignment: .leading)
                                        .font(Font.custom("Poppins-Regular", size: 16))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .accentColor(Color.primary)
                                .frame(height: labelHeight)
                            }).disabled(true)
                            
                            Divider()
                            
                            Button(action: {
                                withAnimation{
                                    UserDefaults.standard.removeObject(forKey: "token")
                                    UserDefaults.standard.removeObject(forKey: "userID")
                                    isUserLoggedIn = false
                                }
                                
                            }, label: {
                                HStack{
                                    Text("Log out")
                                        .frame(width: 124, height: 20, alignment: .leading)
                                        .font(Font.custom("Poppins-Regular", size: 16))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .accentColor(Color.primary)
                                .frame(height: labelHeight)
                            })
                            Divider()
                        }
                        Text("VERSION 1.0")
                            .font(Font.custom("Poppins-Regular", size: 10))
                            .opacity(0.5)
                            .padding()
                    }
                    .padding(17)
                    .navigationBarTitle("Profile", displayMode: .inline)
                }
                
            }
            .onAppear{
                
                if(viewModel.user.id == 0){
                    viewModel.getUserInfoFromServer()
                }
            }
            if(viewModel.isLoading){
                LoadingView()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isUserLoggedIn: .constant(true))
    }
}
