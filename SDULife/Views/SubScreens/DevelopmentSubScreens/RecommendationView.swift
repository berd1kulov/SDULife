//
//  RecommendationView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 27.11.2021.
//

import SwiftUI

struct RecommendationView: View {
    var body: some View {
        ScrollView{
            VStack{
                Group{
                    HStack{
                        Text("Recommended for you")
                            .font(Font.custom("Poppins-SemiBold", size: 14))
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0..<10){i in
                                RecommendedCell(cgSize: CGSize(width: 154, height: 196.5))
                            }
                        }
                    }
                }.padding(.init(top: 0, leading: 17, bottom: 15, trailing: 0))
                
                Group{
                    HStack{
                        Text("Recommended videos")
                            .font(Font.custom("Poppins-SemiBold", size: 14))
                        Spacer()
                    }
                    VStack{
                        ForEach(0..<2){ i in
                            ClubNewsCell()
                            Divider()
                        }
                    }
                }.padding(.init(top: 0, leading: 17, bottom: 15, trailing: 17))
                
                Group{
                    HStack{
                        Text("We Start Every Morning with a Smile")
                            .font(Font.custom("Poppins-SemiBold", size: 14))
                        Spacer()
                    }
                    Text("Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. Aldrin's photo, along with nearly 700 vintage NASA images, will be offered for sale this week in London at a Bloomsbury Auctions' event entitled From the Earth to the Moon. The collection features many photos never released by NASA, including a series of mosaic-like images of the lunar landscape made from stitched-together smaller photos.")
                        .font(Font.custom("Poppins-Light", size: 12))
                }.padding(.init(top: 0, leading: 17, bottom: 15, trailing: 17))
            }
        }
        .navigationBarTitle("Recommendation", displayMode: .inline)
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}
