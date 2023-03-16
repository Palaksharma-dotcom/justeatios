//
//  FoodItems.swift
//  JustEat2
//
//  Created by Rapipay on 07/03/23.
//

import Foundation
//[fooditem]
class FoodItems: ObservableObject {
    var name: String?
    var price: String?
    var rating: String?
    var id: Int?
    var image: String?
    var description: String?
    var totalVotes: String?
    var isVeg: Bool?
    
    
      init(data: [String: Any]) {
          if let isVeg = data["isUser"] as? String {
              self.isVeg = String(isVeg) == "true" ? true : false
          }
         
          if let price = data["col3"] as? String {
              self.price = String(price)
          }
          if let rating = data["col1"] as? String {
              self.rating = String(rating)
          }
          if let image = data["G"] as? String {
              self.image = String(image)
          }
          if let id = data["id"] as? Int {
              self.id = Int(id)
          }
          if let name = data["D"] as? String {
              self.name = String(name)
          }
          if let description = data["col2"] as? String {
              self.description = String(description)
          }
          if let totalVotes = data["E"] as? String {
              self.totalVotes = String(totalVotes)
          }
      }
  }
    
    
    
//    init(data: [String: Any]) {
//        if let isVeg = data["isUser"] as? Bool{
//            self.isVeg = Bool(isVeg)
//        }
//        if let price = data["E"] as? String {
//            self.price = String(price)
//        }
//        if let rating = data["col1"] as? String {
//            self.rating = String(rating)
//        }
//        if let  id = data["id"] as? Int {
//            self.id = Int(id)
//        }
//        if let image = data["image"] as? String {
//            self.image = String(image)
//        }
//        if  let description = data["description"] as? String {
//            self.description = String(description)
//        }
//        if let name = data["name"] as? String {
//            self.name = String(name)
//        }
//        if let totalVotes = data["totalVotes"] as? String {
//            self.totalVotes = String(totalVotes)
//        }
//
//    }
//}
//
////    let isVeg, name: String?
////    let price: String?
////    let id: Int
////    let col1, col2, col3: String?
////    let isUser: Bool
//
////    enum CodingKeys: String, CodingKey {
////        case d = "D"
////        case e = "E"
////        case g = "G"
////        case id, col1, col2, col3, isUser
////    }
////}
//
//
//
