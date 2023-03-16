//
//  RestrauntModel.swift
//  JustEat2
//
//  Created by Rapipay on 02/03/23.
//

import Foundation
struct Food: Identifiable{
    
    let id = UUID()
    var image: String
    var price: Int
    var name: String
}
struct Restraunt: Identifiable{
           let id = UUID()
            var restrauntTitle: String
            var category: [String]
            var dishes: [Food]
            var rating: String
            var distance: Double
    func time()-> String{
        let tym = 10 + Int(distance*5)
        return ("\(tym)-\(tym+5) min")
    }
}

