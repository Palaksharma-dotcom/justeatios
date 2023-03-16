//
//  ProductCard.swift
//  JustEat2
//
//  Created by Rapipay on 01/03/23.
//

import SwiftUI

struct ProductCard: View {
//    var restraunt: Restraunt
    var restraunt: HotelModel
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    var food: FoodItems
    @State private var isLiked: Bool = false
    var body: some View {
        VStack{
            ZStack {
            VStack {
                Image("food")
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height * 0.3 * 0.8)
                    .clipped().cornerRadius(8)
            }
            VStack{
                
                HStack{
                    Text("\(restraunt.name!) ◦ ₹\(restraunt.price!)")
//                    Text("\(restraunt.dishes[0].name):  ₹" + "\(restraunt.dishes[0].price)")
                        .padding(.horizontal, 8)
                        .background(.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.black),lineWidth: 1))

                    
                    Spacer()
                    Button(action: {
//                        isLiked.toggle()
                    }, label:
                    {
                        if isLiked{
                            Image(systemName: "heart.fill")
                                .font(.title)
                                .foregroundColor(.red)
                        }
                        else{
                            Image(systemName: "heart")
                                .font(.title).foregroundColor(.white)
                        }
                    }).onTapGesture {
                        isLiked = !isLiked
                    }
                    
                }
                Spacer()
                HStack(alignment: .bottom){
                    VStack(alignment: .leading){
                        Text(restraunt.name!).font(Font.system(size: 30).bold()).foregroundColor(.white)
//
//                        Text(restraunt.category.joined(separator: "•"))
//                            .font(Font.system(size: 20).bold()).foregroundColor(.white).frame(alignment: .leading)
                    }
                    Spacer()
                    HStack{
                        Text(restraunt.rating!).foregroundColor(.white).padding(6)
                        
//                        Image(systemName: "star.fill").foregroundColor(.white)
                    }.background(.green).cornerRadius(10)
                    
                }
                //                .
            }.padding()
//                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height * 0.3 * 0.8)
                    .clipped()
        }.frame(height: UIScreen.main.bounds.height * 0.3 * 0.8)
        Spacer()
        HStack{
            Image(systemName: "clock.arrow.circlepath")
//            Text("\(restraunt.time())")
            Text(restraunt.time())
            Spacer()
            Text("₹" + "\(restraunt.price!)" + " for one")
        }.padding()
        }.frame(height: UIScreen.main.bounds.height * 0.33)
            .background(Color.white)
            .overlay (RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color(.white), lineWidth: 4)).shadow( radius: 30)
    }
//    
//    func addToCart(){
//        for item in users{
//            if item.email! == UserDefaults.standard.value(forKey: "userEmail") as? String {
//                let cart = Cart(context: viewContext)
//                cart.name = food.name
//                cart.isVeg = food.isVeg!
//                cart.price = food.price
//                cart.distance = "12"
//                cart.quantity = 1
//                cart.user = item
//                try? viewContext.save()
//                
//                
//            }
//        }
//        
//    }
}

//color: Color(hue: 1.0, saturation: 0.003, brightness: 0.904),
//struct ProductCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCard(restraunt: HotelModel(data: ["D": true,
//                                                 "F": "2",
//                                                 "G": "100",
//                                                 "H": false,
//                                                 "I": "Hackensack, New Jersey, United States",
//                                                 "col1": "2",
//                                                 "fullName": "Nathus",
//                                                 "id": 49,
//                                                 "rating": "\u{2b50}\u{fe0f}\u{2b50}\u{fe0f}\u{2b50}\u{fe0f}"
//
//                                                ]))
//    }
//}
//        .overlay (
//            RoundedRectangle(cornerRadius: 8, style: .continuous)
//
