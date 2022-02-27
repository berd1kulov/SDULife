//
//  AnnouncementDetailView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI
struct AnnouncementDetailView: View {
    
    @GestureState private var dragOffset = CGSize.zero
    @State private var isLiked: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var announcement: Announcement
    var body: some View {
        GeometryReader{ geom in
            VStack(alignment:.leading){
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 10){
                        
                        HStack{
                            Text(announcement.created_at)
                                .font(Font.custom("Poppins-Regular", size: 10))
                                .opacity(0.5)
                            Spacer()
                        }
                        Text(announcement.title)
                            .font(Font.custom("Poppins-SemiBold", size: 24))
                        WebImage(url: URL(string: announcement.images.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  "https://sdulife.abmco.kz/\(announcement.images[0].path)"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: geom.size.width-30, height: 331, alignment: .center)
                            .clipShape(Rectangle())
                            
                        
                        Text(announcement.description)
                            .font(Font.custom("Poppins-Regular", size: 15))
                            .opacity(0.8)
                        
                        Divider()
                        
                        HStack{
                            Label("Like", systemImage: isLiked ? "heart.fill" : "heart")
                                .onTapGesture {
                                    isLiked.toggle()
                                }
                            Label("Comment", systemImage: "bubble.left")
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                        }
                        .opacity(0.7)
                        Spacer()
                    }
                }
                .padding(.init(top: 0, leading: 17, bottom: 0, trailing: 17))
//                .navigationBarItems(leading: Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }, label: {
//                    Image(systemName: "chevron.left")
//                }))
                .navigationBarTitle("Announcement", displayMode: .inline)
            }
            }
        
//        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
//             if(value.startLocation.x < 20 &&
//                        value.translation.width > 100) {
//                 self.presentationMode.wrappedValue.dismiss()
//             }
//        })
//                 )
        
    }
}

//struct AnnouncementDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnnouncementDetailView(announcement: Announcement(id: 001, title: "KERMEZ", image: "", club: MockData.sampleClub, date: "25/10/2020"))
//    }
//}
