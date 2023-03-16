//
//  ApiData.swift
//  JustEat2
//
//  Created by Rapipay on 15/03/23.
//

import Foundation
class ApiData: ObservableObject {
    @Published var restraunts: [HotelModel]
    @Published var foods: [FoodItems]
    
    init() {
        restraunts = []
        foods = []
    }
    
    init(restraunts: [HotelModel], foods: [FoodItems]) {
        self.restraunts = restraunts
        self.foods = foods
    }
    
    func setRestraunts(restraunts: [HotelModel]) {
        self.restraunts = restraunts
    }
    
    func setFoods(foods: [FoodItems]) {
        self.foods = foods
    }
}
