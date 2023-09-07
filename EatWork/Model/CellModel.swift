//
//  CellModel.swift
//  EatWork
//
//  Created by Дмитрий Х on 06.09.23.
//

import SwiftUI

struct Status {
    var statusInfo: String
    var statusBadge: String
}

struct RestaurantInfo {
    var restaurantIcon: String
    var restaurantName: String
    var restaurantRating: String
    var restaurantMetro: String
}

struct AdditionalInfoButton {
    var title: String
    var numbers: String
    var action: () -> Void
}

struct CellModel {
    var id = UUID()
    
    var status: Status?
    
    var iconInfo: RestaurantInfo?
    
    var name: String?
    var nameNumber: Int?
    
    var linkButton: AdditionalInfoButton?
    
    var buttonTitle: String?
    
    func getInfo() -> CellModel {
        var model = CellModel()
        
        model.status?.statusInfo = "Пояснение статуса"
        model.status?.statusBadge = "Статус"
        
        return model
    }

}
