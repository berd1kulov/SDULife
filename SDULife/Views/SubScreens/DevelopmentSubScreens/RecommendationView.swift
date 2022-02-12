//
//  RecommendationView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 27.11.2021.
//

import SwiftUI
import WebKit

struct RecommendationView: View {
    
    @StateObject var viewModel = RecommendationViewModel()
    var body: some View {
        ZStack{
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
                                ForEach(viewModel.recommendations){ recommendation in
                                    RecommendedCell(recommendation: recommendation, cgSize: CGSize(width: 154, height: 196.5))
                                        .onTapGesture {
                                            viewModel.selectedRecommendation = recommendation
                                        }
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
                            ForEach(viewModel.selectedRecommendation?.videos ?? [], id: \.self ){ video in
                                NavigationLink(destination: {
                                    WebView(request: URLRequest(url: URL(string: video.url)!))
                                }, label: {
                                    RecommendationVideoCell(recommendationUrl: video.url, recommendationTitle: video.title, recommendationTime: "27 Jan 2016")
                                })
                                
                                Divider()
                            }
                        }
                    }.padding(.init(top: 0, leading: 17, bottom: 15, trailing: 17))
                    
                    Group{
                        HStack{
                            Text(viewModel.selectedRecommendation?.title ?? "")
                                .font(Font.custom("Poppins-SemiBold", size: 14))
                            Spacer()
                        }
                        Text(viewModel.selectedRecommendation?.description ?? "")
                            .font(Font.custom("Poppins-Light", size: 12))
                    }.padding(.init(top: 0, leading: 17, bottom: 15, trailing: 17))
                }
                .onAppear {
                    viewModel.getRecommendations()
                }
            }
            if viewModel.isLoading {
                LoadingView()
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

struct WebView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}
