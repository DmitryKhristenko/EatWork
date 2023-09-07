//
//  BasicInfoCell.swift
//  EatWork
//
//  Created by Дмитрий Х on 06.09.23.
//

import SwiftUI

struct BasicInfoCell: View {
    @EnvironmentObject var appSettings: AppSettings
    
    @State private var isHeartFilled = false
    
    private let cellModel: CellModel = CellModel(iconInfo: RestaurantInfo(restaurantIcon: "restaurantImage", restaurantName: "Заголовок", restaurantRating: "Рейтинг 4.9", restaurantMetro: "Метро"), name: "Название", nameNumber: 123, buttonTitle: "Кнопка")
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(cellModel.iconInfo?.restaurantIcon ?? "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 56, height: 56)
                    .clipped()
                    .cornerRadius(8)
                    .padding(.trailing)
                VStack(alignment: .leading, spacing: 2) {
                    Text(cellModel.iconInfo?.restaurantName ?? "nil")
                    let star = Text("★")
                        .foregroundColor(Color(uiColor: UIColor(red: 1, green: 0.77, blue: 0.04, alpha: 1)))
                    Text("\(cellModel.iconInfo?.restaurantRating ?? "nil") \(star)")
                        .foregroundColor(Color.gray)
                    
                    let blueDot = Text("•")
                        .foregroundColor(Color(uiColor: UIColor(red: 0.22, green: 0.14, blue: 0.71, alpha: 1)))
                    Text("\(cellModel.iconInfo?.restaurantMetro ?? "nil") \(blueDot)")
                        .foregroundColor(Color.gray)
                }
            }
            .padding(.top, 15)
            
            HStack {
                Text(cellModel.name ?? "nil")
                Spacer()
                Text("\(cellModel.nameNumber ?? 0)")
                    .foregroundColor(Color.gray)
            }
            .padding(.top, 15)
            
            Divider()
            
            HStack(alignment: .center) {
                Button(action: {}) {
                    Text(cellModel.buttonTitle ?? "nil")
                        .frame(width: 90, height: 30)
                        .foregroundColor(Color.white)
                        .font(Font.custom("SF Pro Display", size: 13) .weight(.medium))
                        .background(Color.blue)
                        .cornerRadius(6)
                }
                Spacer()
                Button(action: {
                    isHeartFilled.toggle()
                }) {
                    Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                        .foregroundColor(isHeartFilled ? Color.red : Color.gray)
                        .font(.system(size: 24))
                }
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.top)
            .padding(.bottom, 40)
        }
        .padding(.leading, 20)
        .padding(.trailing, 10)
        .background(appSettings.isDark ? Color(red: 28 / 255, green: 28 / 255, blue: 29 / 255) : Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 6)
        .listRowSeparator(.hidden)
        .listStyle(PlainListStyle())
        
    }
}

struct BasicInfoCell_Previews: PreviewProvider {
    static var previews: some View {
        let appSettings = AppSettings()
        return BasicInfoCell()
            .environmentObject(appSettings)
    }
}
