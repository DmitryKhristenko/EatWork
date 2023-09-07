//
//  SectionTwoView.swift
//  EatWork
//
//  Created by Дмитрий Х on 05.09.23.
//

import SwiftUI

struct SectionTwoView: View {
    var body: some View {
        ZStack {
            Text("Это второй экран")
            Color.green.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SectionTwoView_Previews: PreviewProvider {
    static var previews: some View {
        SectionTwoView()
    }
}
