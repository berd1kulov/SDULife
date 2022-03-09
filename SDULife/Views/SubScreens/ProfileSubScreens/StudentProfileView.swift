//
//  StudentProfileView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI
import PDFKit

struct StudentProfileView: View {
    var user: User = MockUserData.sampleUser
    @StateObject var viewModel = UserViewModel()
    var body: some View {
        ScrollView{
            VStack{
                Image("no_user_image")
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(40)
                    .padding()
                
                Text("\(user.name)")
                    .bold()
                    .font(.system(size: 16))
//                Text("\(user.id)")
//                    .font(.system(size: 12))
//                    .opacity(0.5)
                HStack{
                    Text("Personal Information about Student")
                        .font(Font.custom("Poppins-SemiBold", size: 12))
                    Spacer()
                }
                .padding(.init(top: 15, leading: 0, bottom: 15, trailing: 0))
//                ForEach(viewModel.changedUserTranscrips.keys.sorted(), id: \.self){ keyy in
//                    HStack{
//                        VStack(alignment:.leading){
//                            Text("\(keyy) year")
//                                .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
//                            ForEach(viewModel.changedUserTranscrips[keyy] ?? [], id: \.self){ value in
//                                Text("- \(value)")
//                            }
//                        }
//                        Spacer()
//                    }
//                    Divider()
//                }
                
                ForEach(viewModel.userTranscript, id: \.self){ item in
                HStack{
                    VStack(alignment:.leading){
                        Text("\(String(item.year).replacingOccurrences(of: " ", with: "")) year")
                            .font(Font.custom("Poppins-SemiBold", size: 12))
                            .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                        Text("\(item.date) - \(item.description)")
                            .font(Font.custom("Poppins-Regular", size: 10))
                    }
                    Spacer()
                }
                Divider()
                }
                
                
            }
            .onAppear{
                viewModel.getUserTranscript()
            }
        }
        .sheet(isPresented: $viewModel.isFileLoaded){
            PDFKitView(url: URL(fileURLWithPath: viewModel.filePath))
        }
        .padding(30)
        .navigationBarTitle("Transcript", displayMode: .inline)
        .navigationBarItems(
            trailing: Button(action: {
                viewModel.downdloadTFromServer()
            }, label: {
                Image(systemName: "arrow.down.doc")
            })
        )
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
        }
    }
}

struct StudentProfileView_Previews: PreviewProvider {
    static var previews: some View {
        StudentProfileView()
    }
}
