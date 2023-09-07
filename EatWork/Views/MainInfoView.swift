//
//  MainInfoView.swift
//  EatWork
//
//  Created by Дмитрий Х on 05.09.23.
//

import SwiftUI

struct MainInfoView: View {
    var body: some View {
        NavigationView {
            List {
                AdditionalInfoCell()
                BasicInfoCell()
                BasicInfoCell()
            }
            .listRowSeparator(.hidden)
            .listStyle(PlainListStyle())
        }
    }
}

struct MainInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let appSettings = AppSettings()
        MainInfoView()
            .environmentObject(appSettings)
    }
}
