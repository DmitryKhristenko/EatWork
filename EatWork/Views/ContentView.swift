//
//  ContentView.swift
//  EatWork
//
//  Created by Дмитрий Х on 05.09.23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appSettings: AppSettings
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .trailing) {
                    Text("Вакансии")
                        .font(.system(size: 17).weight(.semibold))
                        .frame(maxWidth: .infinity)
                    Button(action: {
                        appSettings.isDark.toggle()
                    }) {
                        appSettings.isDark ? Text("Светлая") : Text("Темная")
                    }
                    .padding(.trailing, 15)
                }
                SearchBar(text: $searchText)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 14)
                
                TabView {
                    MainInfoView()
                        .tabItem {
                            Label("Раздел 1", image: "briefcase")
                        }
                    SectionTwoView()
                        .tabItem {
                            Label("Раздел 2", image: "heart")
                        }
                }
            }
        }
        .preferredColorScheme(appSettings.isDark ? .dark : .light)
        .background(appSettings.isDark ? Color.black : Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppSettings())
    }
}
