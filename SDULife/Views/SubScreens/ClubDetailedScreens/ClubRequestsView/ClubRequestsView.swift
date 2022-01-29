//
//  ClubRequestsView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct ClubRequestsView: View {
    
    @State private var club: Club = MockData.sampleClub
    
    @State private var isAccepted = false
    @State private var isNotAccepted = false
    var body: some View {
        Text("Club request")
//        List(club.requests ?? []){ user in
//            HStack{
//                UserListCell()
//                Spacer()
//                Button(action: {
//                    isNotAccepted = true
//                    if(isNotAccepted){
//                        club.requests?.remove(at: club.requests?.firstIndex(of: user) ?? 0)
//                    }
//                }, label: {
//                    Image(systemName: "xmark")
//                        .frame(width: 32, height: 32, alignment: .center)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        .cornerRadius(16)
//                })
//                Button(action: {}, label: {
//                    Image(systemName: "checkmark")
//                        .frame(width: 32, height: 32, alignment: .center)
//                        .background(Color(red: 69/255, green: 7/255, blue: 73/255))
//                        .foregroundColor(.white)
//                        .cornerRadius(16)
//                })
//            }
//        }
//        .listStyle(.plain)
//        .navigationBarTitle("Follow Request", displayMode: .inline)
    }
}

struct ClubRequestsView_Previews: PreviewProvider {
    static var previews: some View {
        ClubRequestsView()
    }
}
