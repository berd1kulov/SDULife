//
//  RecommendedCell.swift
//  SDULife
//
//  Created by Dias Berdikul on 28.01.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecommendedCell: View {
    var cgSize: CGSize
    var body: some View {
        VStack(alignment: .leading){
            WebImage(url: URL(string: "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png"))
                .resizable()
                .frame(width: cgSize.width, height: cgSize.height, alignment: .center)
                .scaledToFill()
            Text("Soul Condition")
                .font(Font.custom("Poppins-Regular", size: 12))
        }
    }
}

struct RecommendedCell_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedCell(cgSize: CGSize(width: 154.06, height: 195.5))
    }
}
