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
            WebImage(url: URL(string:recommendation.image.isEmpty ? DefaultMock.thumbinalImage :  (MockData.imageBase + recommendation.image[0].path)))
                .resizable()
                .scaledToFill()
                .frame(width: cgSize.width, height: cgSize.height, alignment: .center)
                
                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            Text(recommendation.title)
                .font(Font.custom("Poppins-Regular", size: 12))
        }
        
    }
}

struct RecommendationVideoCell: View {
    
    let screenSize = UIScreen.main.bounds.size
    var recommendationUrl: String = ""
    var recommendationTitle: String = ""
    var recommendationTime: String = ""
    var body: some View {
        HStack{
            WebImage(url: URL(string: !recommendationUrl.isEmpty ? DefaultMock.videoPreviewIcon :  recommendationUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 85, height: 85, alignment: .center)
                .clipShape(Rectangle())
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 20))
            
            VStack(alignment:.leading){
                Text(recommendationTitle)
                Spacer()
                Text(recommendationTime)
                    .font(Font.custom("Poppins-Regular", size: 13))
                    .opacity(0.5)
                    .lineLimit(nil)
            }
            Spacer()
        }
        .background(Color.white)
        .frame(height: 85)
        .padding(.init(top: 0, leading: 15, bottom: 0, trailing: 15))
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
