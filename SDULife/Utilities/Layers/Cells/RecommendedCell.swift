//
//  RecommendedCell.swift
//  SDULife
//
//  Created by Dias Berdikul on 28.01.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecommendedCell: View {
    
    var recommendation: Recommendation = Recommendation(id: 1, title: "", description: "", image_id: 1, created_at: "", updated_at: "", videos: [], image: [])
    var cgSize: CGSize
    var body: some View {
        VStack(alignment: .leading){
            WebImage(url: URL(string:recommendation.image.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  (MockData.imageBase + recommendation.image[0].path)))
                .resizable()
                .frame(width: cgSize.width, height: cgSize.height, alignment: .center)
                .scaledToFill()
            Text(recommendation.title)
                .font(Font.custom("Poppins-Regular", size: 12))
        }
    }
}

struct RecommendationVideoCell: View {
    
    var recommendationUrl: String = ""
    var recommendationTitle: String = ""
    var recommendationTime: String = ""
    var body: some View {
        HStack{
            WebImage(url: URL(string: recommendationUrl.isEmpty ? "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png" :  recommendationUrl))
                .resizable()
                .frame(width: 85, height: 85, alignment: .center)
                .scaledToFill()
            VStack(alignment:.leading){
                Text(recommendationTitle)
                Spacer()
                Text(recommendationTime)
                    .font(.system(size: 13))
                    .opacity(0.5)
            }
        }
        .frame(height: 85)
    }
}

struct RecommendedCell_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedCell(cgSize: CGSize(width: 154.06, height: 195.5))
    }
}

struct RecommendationVideoCell_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationVideoCell()
    }
}

