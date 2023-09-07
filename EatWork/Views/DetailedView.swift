//
//  DetailedView.swift
//  EatWork
//
//  Created by Дмитрий Х on 05.09.23.
//

import SwiftUI

struct DetailedView: View {
    
    private let item = TableItem(title: "Заголовок", text: "Имеется спорная точка зрения, гласящая примерно следующее: явные признаки победы институционализации подвергнуты целой серии независимых исследований. Но высокое качество позиционных исследований требует анализа дальнейших направлений развития!")
    
    private let verticalFieldOneStack = HStack {
        Text("Поле 1")
            .font(.system(size: 17))
            .kerning(0.7)
            .foregroundColor(Color.gray)
    }
    
    private let verticalFieldTwoStack = VStack {
        Text("Пример текста 123")
            .font(.system(size: 17))
            .kerning(0.7)
    }
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        let items: [TableItem] = [item, item, item]
        
        NavigationView {
            VStack(alignment: .leading, spacing: 12) {
                Divider()
                Text("Заголовок")
                    .font(.system(size: 22, weight: .bold))
                    .kerning(0.5)
                    .padding(.top, 12)
                    .padding(.leading, 20)
                
                HStack {
                    verticalFieldOneStack
                        .padding(.trailing, 24)
                        .padding(.bottom)
                    VStack(alignment: .leading) {
                        verticalFieldTwoStack
                        Divider()
                    }
                }
                .padding(.leading, 20)
                
                HStack {
                    verticalFieldOneStack
                        .padding(.trailing, 24)
                        .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        verticalFieldTwoStack
                        Divider()
                    }
                }
                .padding(.leading, 20)
                TableView(items: items)
            }
            .navigationBarTitle("Название 1", displayMode: .large)
            .navigationBarItems(leading: Button(action: {dismiss()}) { Image(systemName: "arrow.backward")})
        }
        .overlay(Button(action: {}) {
            Text("Кнопка")
                .kerning(0.5)
                .frame(width: 351, height: 44)
                .font(.system(size: 17))
                .padding(.horizontal, 2)
                .background(Color(uiColor: UIColor(red: 0.22, green: 0.5, blue: 1, alpha: 1)))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
            .padding(), alignment: .bottom)
        .navigationBarBackButtonHidden(true)
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView()
    }
}
