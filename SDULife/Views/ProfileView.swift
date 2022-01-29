//
//  ProfileView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 19.11.2021.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var isUserLoggedIn: Bool
    var user: User
    var labelHeight: CGFloat = 50
    @State var isNotificationsOn: Bool = true
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Image(user.image)
                        .resizable()
                        .frame(width: 104, height: 104)
                        .cornerRadius(52)
                        .padding()
                    Group{
                        HStack{
                            Text("GENERAL INFORMATION")
                                .font(.system(size: 12))
                                .opacity(0.5)
                            Spacer()
                        }
                        
                        HStack{
                            Text("Full Name")
                                .frame(width: 124, height: 20, alignment: .leading)
                                .font(.system(size: 13))
                                .opacity(0.7)
                            Text("\(user.name) \(user.surname)")
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .frame(height: labelHeight)
                        Divider()
                        
                        HStack{
                            Text("Id number")
                                .frame(width: 124, height: 20, alignment: .leading)
                                .font(.system(size: 13))
                                .opacity(0.7)
                            Text("\(user.id)")
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .frame(height: labelHeight)
                        Divider()
                        
                        HStack{
                            Text("Speciality")
                                .frame(width: 124, height: 20, alignment: .leading)
                                .font(.system(size: 13))
                                .opacity(0.7)
                            Text("\(user.speciality)")
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .frame(height: labelHeight)
                        Divider()
                        
                        HStack{
                            Text("Birthday")
                                .frame(width: 124, height: 20, alignment: .leading)
                                .font(.system(size: 13))
                                .opacity(0.7)
                            Text("\(user.birthday)")
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .frame(height: labelHeight)
                        Divider()
                            .padding(.init(top: 0, leading: 0, bottom: 48, trailing: 0))
                    }
                    
                    Group{
                        HStack{
                            Text("STUDENTS")
                                .font(.system(size: 12))
                                .opacity(0.5)
                            Spacer()
                        }
                        NavigationLink(destination: {
                            HeadStudentsListView()
                        }, label: {
                            HStack{
                                Text("List of my students")
                                    .frame(height: 20, alignment: .leading)
                                    .font(.system(size: 16))
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
                                .font(.system(size: 12))
                                .opacity(0.5)
                            Spacer()
                        }
                        HStack{
                            Text("Phone")
                                .frame(width: 124, height: 20, alignment: .leading)
                                .font(.system(size: 13))
                                .opacity(0.7)
                            Text("\(user.phone)")
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .frame(height: labelHeight)
                        Divider()
                        
                        HStack{
                            Text("Email")
                                .frame(width: 124, height: 20, alignment: .leading)
                                .font(.system(size: 13))
                                .opacity(0.7)
                            Text("\(user.email)")
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .frame(height: labelHeight)
                        Divider()
                            .padding(.init(top: 0, leading: 0, bottom: 48, trailing: 0))
                        
                    }
                    
                    Group{
                        HStack{
                            Text("ACCOUNT SETTINGS")
                                .font(.system(size: 12))
                                .opacity(0.5)
                            Spacer()
                        }
                        NavigationLink(destination: {
                            
                        }, label: {
                            HStack{
                                Text("Language")
                                    .frame(width: 124, height: 20, alignment: .leading)
                                    .font(.system(size: 16))
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .accentColor(Color.primary)
                            .frame(height: labelHeight)
                        })
                        
                        Divider()
                        
                        
                        Toggle(isOn: $isNotificationsOn) {
                            Text("Notifications")
                        }
                            .frame(height: labelHeight)
                        
                        Divider()
                            .padding(.init(top: 0, leading: 0, bottom: 48, trailing: 0))
                    }
                    
                    Group{
                        HStack{
                            Text("TOOLS")
                                .font(.system(size: 12))
                                .opacity(0.5)
                            Spacer()
                        }
                        NavigationLink(destination: {
                            
                        }, label: {
                            HStack{
                                Text("About")
                                    .frame(width: 124, height: 20, alignment: .leading)
                                    .font(.system(size: 16))
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .accentColor(Color.primary)
                            .frame(height: labelHeight)
                        })
                        
                        Divider()
                        
                        
                        NavigationLink(destination: {
                            Button(action: {
                                withAnimation{
                                    UserDefaults.standard.removeObject(forKey: "token")
                                    isUserLoggedIn = false
                                }
                                
                            }, label: {
                                Text("Log Out")
                            })
                        }, label: {
                            HStack{
                                Text("Contacts")
                                    .frame(width: 124, height: 20, alignment: .leading)
                                    .font(.system(size: 16))
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .accentColor(Color.primary)
                            .frame(height: labelHeight)
                        })
                        
                        Divider()
                    }
                    
                    Text("VERSION 1.0")
                        .font(.system(size: 10))
                        .opacity(0.5)
                        .padding()
                    
                }
                .padding(17)
                .navigationBarTitle("Profile", displayMode: .inline)
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isUserLoggedIn: .constant(true), user: User(id: 0001, name: "Bakdaulet", surname: "Berdikul", image: "userImage", speciality: "Computer Science", birthday: "10.01.2000", phone: "+7 777 777 77 77", email: "berdikul.bakdaulet@mail.ru"))
    }
}
