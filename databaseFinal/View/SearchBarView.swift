//
//  SearchBar.swift
//  databaseFinal
//
//  Created by Kris on 6/11/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @State private var isEditing = false
    
    var body: some View
    {
        HStack
        {
            TextField("搜尋 ...", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    withAnimation(.default) {
                        self.isEditing = false
                        self.searchText = ""
                        dismissKeyboard()
                    }
                }) {
                    Text("取消")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
    
    func dismissKeyboard()
    {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
