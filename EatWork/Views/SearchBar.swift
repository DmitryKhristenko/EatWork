//
//  SearchBar.swift
//  EatWork
//
//  Created by Дмитрий Х on 07.09.23.
//

import SwiftUI

struct SearchBar: View {
    
    @EnvironmentObject var appSettings: AppSettings
    
    @Binding var text: String
    
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            
            TextField("Поиск", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(appSettings.isDark ? Color(red: 28 / 255, green: 28 / 255, blue: 29 / 255) : Color(.systemGray5))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        let appSettings = AppSettings()
        return SearchBar(text: .constant(""))
            .environmentObject(appSettings)
    }
}
