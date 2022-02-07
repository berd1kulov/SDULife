//
//  FoundsDetailView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 16.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI
struct FoundsDetailView: View {
    
    @GestureState private var dragOffset = CGSize.zero
    
    @Environment(\.presentationMode) var presentationMode
    var founds: Founds = Founds(id: 001, user_id: 001,title: "Some title", description: "Some description", status: 0, created_at: "22:22", updated_at: "22:22",time: "10:23", images: [])
    @State var choosenImage = 0
    var body: some View {
        GeometryReader{ geom in
                ScrollView{
                    VStack(alignment: .leading){
                        WebImage(url: URL(string: founds.images.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  "https://sdulife.abmco.kz/\(founds.images[choosenImage].path)"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: geom.size.width, height: 331, alignment: .center)
                            .clipShape(Rectangle())
                            
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(founds.images, id: \.self){ image in
                                    WebImage(url: URL(string: "https://sdulife.abmco.kz/\(image.path)"))
                                        .resizable()
                                        .frame(width: 71, height: 70, alignment: .center)
                                        .scaledToFit()
                                        .onTapGesture {
                                            choosenImage = founds.images.firstIndex(of: image) ?? 0
                                        }
                                }
                            }.padding(.leading, 26)
                        }
                        
                        Text(founds.title)
                            .bold()
                            .font(.system(size: 24))
                            .padding(.init(top: 20, leading: 26, bottom: 10, trailing: 26))
                        Text(founds.description)
                            .font(.system(size: 15))
                            .padding(.init(top: 0, leading: 26, bottom: 10, trailing: 26))
                        
                    }
                }
//                .navigationBarItems(leading: Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }, label: {
//                    Image(systemName: "chevron.left")
//                }))
                .navigationBarTitle("Founds", displayMode: .inline)
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

struct FoundsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoundsDetailView()
    }
}
