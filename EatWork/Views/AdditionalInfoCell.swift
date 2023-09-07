//
//  AdditionalInfoCell.swift
//  EatWork
//
//  Created by Дмитрий Х on 05.09.23.
//

import SwiftUI

struct AdditionalInfoCell: View {
    @EnvironmentObject var appSettings: AppSettings
    
    @State private var isHeartFilled = false
    
    let cellModel: CellModel = CellModel(status: Status(statusInfo: "Пояснение статуса", statusBadge: "Статус"), iconInfo: RestaurantInfo(restaurantIcon: "restaurantImage", restaurantName: "Заголовок", restaurantRating: "Текст 1", restaurantMetro: "Текст 2"), name: "Название", nameNumber: 123, linkButton: AdditionalInfoButton(title: "Название 1", numbers: "12.12.689", action: {}), buttonTitle: "Кнопка")
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(cellModel.status?.statusInfo ?? "nil")
                    .foregroundColor(Color(uiColor: UIColor(red: 0.88, green: 0.25, blue: 0.33, alpha: 1)))
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(uiColor: UIColor(red: 0.88, green: 0.25, blue: 0.33, alpha: 1)))
                    .frame(width: 70, height: 20)
                    .overlay(
                        Text(cellModel.status?.statusBadge ?? "nil")
                            .font(Font.custom("SF Pro Display", size: 16) .weight(.bold))
                            .foregroundColor(Color.white), alignment: .center)
            }
            .padding(.top, 24)
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
                    
                    let redDot = Text("•")
                        .foregroundColor(Color.red)
                    Text("\(cellModel.iconInfo?.restaurantMetro ?? "nil") \(redDot)")
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
            
            NavigationLink(destination: DetailedView()) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(cellModel.linkButton?.title ?? "nil")
                        Text(cellModel.linkButton?.numbers ?? "nil")
                            .foregroundColor(Color.gray)
                            .font(Font.custom("SF Pro Display", size: 12))
                    }
                    Spacer()
                        .foregroundColor(Color.gray)
                }
            }
            .frame(maxWidth: .infinity)
            
            HStack {
                Button(action: {}) {
                    Text(cellModel.buttonTitle ?? "nil")
                        .font(Font.custom("SF Pro Display", size: 13).weight(.medium))
                        .kerning(0.5)
                        .frame(width: 90, height: 30)
                        .foregroundColor(Color.white)
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
        .listStyle(PlainListStyle())
        .listRowSeparator(.hidden)
    }
}

struct AdditionalInfoCell_Previews: PreviewProvider {
    static var previews: some View {
        let appSettings = AppSettings()
        return AdditionalInfoCell()
            .environmentObject(appSettings)
    }
}
