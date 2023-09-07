//
//  DetailedViewCell.swift
//  EatWork
//
//  Created by Дмитрий Х on 07.09.23.
//

import SwiftUI

struct TableItem {
    var id = UUID()
    var title: String
    var text: String
}

struct DetailedViewCell: View {
    let item: TableItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(item.title)
                .font(.system(size: 22, weight: .bold))
                .kerning(0.5)
            
            Text(item.text)
                .font(.system(size: 18))
                .kerning(0.7)
        }
        .listRowSeparator(.hidden)
    }
}

struct TableView: View {
    var items: [TableItem]
    var body: some View {
        List(items, id: \.id) { item in
            DetailedViewCell(item: item)
        }
        .listStyle(PlainListStyle())
    }
}

struct DetailedViewCell_Previews: PreviewProvider {
    static var previews: some View {
        let item = TableItem(title: "Заголовок", text: "Имеется спорная точка зрения, гласящая примерно следующее: явные признаки победы институционализации подвергнуты целой серии независимых исследований. Но высокое качество позиционных исследований требует анализа дальнейших направлений развития!")
        let items = [item, item, item]
        return TableView(items: items)
    }
}
