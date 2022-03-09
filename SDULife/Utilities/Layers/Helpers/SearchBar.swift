//
//  SearchBar.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 15.11.2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
            HStack{
                Image(systemName: "magnifyingglass")
                    .opacity(0.5)
                TextField("Search ...", text: $text)
                    .frame(height: 40)
                    .padding(7)
                
            }
            .padding(.horizontal, 23)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(lineWidth: 0.2)
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    withAnimation{
                        self.isEditing = true
                    }
                }
 
            if isEditing {
                Button(action: {
                    withAnimation{
                        self.isEditing = false
                        self.text = ""
                    }
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                
            }
        }
        .padding(.init(top: 0, leading: 0, bottom: 15, trailing: 0))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
