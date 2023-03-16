//
//  RestrauntPage.swift
//  JustEat2
//
//  Created by Rapipay on 06/03/23.
//

import SwiftUI

struct RestrauntPage: View {
//    @State private var isVeg: Bool = true
    @State private var descriptionLineLimit = 3
    @EnvironmentObject var settings: UserSettings
    @State private var showDSSAlert = false
//    @Environment(\.managedObjectContext) var viewContext
//
//    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
////    var food: FoodItems
    var distance: String
    var restrauntid: String
    var food: FoodItems
//    var food: FoodItems
//    var foods: [FoodItems]
//    var name = [Restraunt(restrauntTitle: "Castle cake", category: ["pure veg", "bakery"], dishes: [Food(image: "food", price: 70, name: "cake")], rating: "3.8", distance: 7.0),
//    Restraunt(restrauntTitle: "Paradise Pizza", category: ["veg", "pizza"], dishes: [Food(image: "food", price: 90, name: "tomato pizza")], rating: "3.5", distance: 5.0), Restraunt(restrauntTitle: "sagar ratna", category: ["south indian", "chinese ","Indian"], dishes: [Food(image: "food", price: 70, name: "dosa")], rating: "3.5", distance: 2.0)]
    var body: some View {

            
            HStack{
                
                VStack(alignment: .leading){
                    Image(systemName: "dot.squareshape").foregroundColor(food.isVeg! ? .green : .red )
                    Text("\(food.name!)").font(.system(size: 18, weight: .semibold))
                    HStack{
                        Text("\(food.rating!)").foregroundColor(.white).padding(6).overlay(RoundedRectangle(cornerRadius: 3).stroke(lineWidth: 2)).background(.green).border(.gray)
                        Text("\(food.totalVotes!)").font(.system(size: 17, weight: .regular))
                    }
                    
                    Text("₹" + "\(food.price!)")
                    Text("\(food.description!)").font(.system(size: 17, weight: .regular)).foregroundColor(.gray).lineLimit(descriptionLineLimit)
                        .onTapGesture {
                            descriptionLineLimit = descriptionLineLimit == 3 ? 7 : 3
                        }
                    
                }
                Spacer()
                VStack{
                    
                    Image("\(food.image)").resizable().scaledToFit().frame(width: UIScreen.main.bounds.width*0.45, height: UIScreen.main.bounds.width*0.45)
                        .clipped()
                        .cornerRadius(15)
                        
                    Button("ADD +", action: {
//                        addToCart()
                    })
                    .onTapGesture(perform: {
                        addToCart()
                    })
                    .padding(.horizontal, 20)
                        .foregroundColor(Color("DarkShade"))
                        .font(.headline.weight(.heavy)).padding().background(Color("LightShade")).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("DarkShade"), lineWidth: 3))
                        .cornerRadius(20)
                        .padding(-30)
                        
//                       Divider()
                    
                }
                .padding(.bottom,20)
                    
                
                
            }
       
            
        }
    func addToCart() {
        if (settings.user?.cartItem?.count == 0 || restrauntid == settings.user?.restrauntid ?? "0"){
            settings.user?.restrauntid = restrauntid
            
            PersistenceController.shared.saveCartItem(data: ["name": food.name!, "veg": food.isVeg!, "price": food.price!, "user": settings.user, "distance": distance])
        }
        else{
            showDSSAlert = true
            print("Cart not empty")
        }
//        PersistenceController.shared.saveCartItem(data: ["name": items.name!, "veg": items.isVeg!, "price": items.price!, "user": settings.user, "distance":  distance])
        
       
    }

    }


//struct RestrauntPage_Previews: PreviewProvider {
//    static var previews: some View {
//        RestrauntPage(items: FoodItems(data: [ "D": "Shakes",
//                                               "E": "150",
//                                               "G": "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg",
//                                               "id": 1,
//                                               "col1": "⭐️⭐️⭐️⭐️⭐️",
//                                               "col2": "sweet beverage made by blending milk, ice cream, and flavorings or sweeteners such as butterscotch, caramel sauce, chocolate syrup, fruit syrup, or whole fruit into a thick, sweet, cold mixture.",
//                                               "col3": "250",
//                                               "isUser": "true"])
//        )
//    }
//}



