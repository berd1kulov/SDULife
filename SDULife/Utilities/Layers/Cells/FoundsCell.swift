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
            WebImage(url: URL(string: found.images.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  found.images[0]))
                .resizable()
                .frame(width: size.width/2, height: 116, alignment: .center)
                .scaledToFit()
            Text(found.description)
                .bold()
                .font(.system(size: 13))
                .lineLimit(nil)
                .frame(width: size.width/2, alignment: .center)
            
            HStack{
                Text(found.created_at.split(separator: "T")[0])
            }
            .font(.system(size: 10))
            .opacity(0.8)
            .padding()
        }
        .frame(width: size.width/2, height: 232, alignment: .top)
        
    }
}

