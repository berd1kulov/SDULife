//
//  DevelopentView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct DevelopmentView: View {
    
    let screenSize = UIScreen.main.bounds.size
    var body: some View {
        NavigationView{
                VStack(spacing: 0){
                    NavigationLink(destination: {
                        RecommendationView()
                    }, label: {
                        VStack{
                            Text("For your condition")
                                .font(Font.custom("Poppins-SemiBold", size: 12))
                                .padding(.init(top: 35, leading: 0, bottom: 0, trailing: 0))
                            Spacer()
                            Text("Recommendation")
                                .font(Font.custom("Poppins-SemiBold", size: 24))
                            Spacer()
                            Text("---  items")
                                .font(Font.custom("Poppins-Regular", size: 12))
                                .textCase(.uppercase)
                                .padding(.init(top: 0, leading: 0, bottom: 35, trailing: 0))
                        }.frame(width: screenSize.width, height: screenSize.height/3-50)
                            .background(Color(red: 69/255, green: 7/255, blue: 73/255))
                            .foregroundColor(.white)
                    })
                    NavigationLink(destination: {
                        AppoinmentView()
                    }, label: {
                        VStack{
                            Text("From PhD of Psychology")
                                .font(Font.custom("Poppins-SemiBold", size: 12))
                                .padding(.init(top: 35, leading: 0, bottom: 0, trailing: 0))
                            Spacer()
                            Text("Appointment")
                                .font(Font.custom("Poppins-SemiBold", size: 24))
                            Spacer()
                            Text("---  new items")
                                .font(.system(size: 12))
                                .textCase(.uppercase)
                                .padding(.init(top: 0, leading: 0, bottom: 35, trailing: 0))
                        }.frame(width: screenSize.width, height: screenSize.height/3-50)
                            .background(Color(red: 49/255, green: 56/255, blue: 79/255))
                            .foregroundColor(.white)
                    })
                    NavigationLink(destination: {}, label: {
                        VStack{
                            Text("Skills assessment")
                                .font(Font.custom("Poppins-SemiBold", size: 12))
                                .padding(.init(top: 35, leading: 0, bottom: 0, trailing: 0))
                            Spacer()
                            Text("Test")
                                .font(Font.custom("Poppins-SemiBold", size: 24))
                            Spacer()
                            Text("---  new items")
                                .font(Font.custom("Poppins-Regular", size: 12))
                                .textCase(.uppercase)
                                .padding(.init(top: 0, leading: 0, bottom: 35, trailing: 0))
                        }.frame(width: screenSize.width, height: screenSize.height/3-50)
                            .background(Color(red: 214/255, green: 71/255, blue: 71/255))
                            .foregroundColor(.white)
                    })
                        .disabled(true)
                }
            
            .navigationBarTitle("Development", displayMode: .inline)
        }
    }
}

struct DevelopentView_Previews: PreviewProvider {
    static var previews: some View {
        DevelopmentView()
    }
}
