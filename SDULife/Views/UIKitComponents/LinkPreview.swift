//
//  LinkPreview.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 27.02.2022.
//

import Foundation
import SwiftUI
import LinkPresentation

struct LinkPreview: UIViewRepresentable {
    
    var metaData: LPLinkMetadata
    func makeUIView(context: Context) -> LPLinkView {
        let preview = LPLinkView(metadata: metaData)
        
        return preview
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.metadata = metaData
    }
    
}
