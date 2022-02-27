//
//  FoundsCell.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 16.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct FoundsCell: View {
    
    var found: Founds
    var size: CGSize
    var body: some View {
        VStack{
            WebImage(url: URL(string: found.images.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  "https://sdulife.abmco.kz/\(found.images[0].path)"))
                .resizable()
                .scaledToFill()
                .frame(width: size.width/2+4, height: 116, alignment: .center)
                .clipShape(Rectangle())
            Text(found.title)
                .font(Font.custom("Poppins-SemiBold", size: 13))
                .lineLimit(nil)
                .frame(width: size.width/2+4, alignment: .center)
            Spacer()
            
            HStack{
                Text(found.time)
                Spacer()
                Text(found.created_at)
            }
            .font(Font.custom("Poppins-Regular", size: 10))
            .opacity(0.8)
            .padding()
        }
        
        .frame(width: size.width/2+4, height: 232, alignment: .top)
        .border(Color.gray, width: 0.2)
        .contentShape(Rectangle())
        .shadow(color: Color.gray, radius: 0.5, x: 0, y: 0)
        
    }
}

