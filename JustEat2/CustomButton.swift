//
//  CustomButton.swift
//  JustEat2
//
//  Created by Rapipay on 16/02/23.
//

import SwiftUI

struct CustomButton: View {
    var btnTitle: String?
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: action ?? {
            print("NoAction")
        }, label : {
            Spacer()
            Text(btnTitle ?? "Button")
                .font(.title3.weight(.semibold))
            Spacer()
        }).padding().frame(maxWidth: .infinity)
            .overlay {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(Color("ButtonColor"), lineWidth: 2)
                
            }
        foregroundColor(Color("ButtonColor"))
        
//            .background(Color("DarkShade")).cornerRadius(15)
//            .foregroundColor(.white)
            
        }
    }


struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}

struct SecondaryButton: View{
    var btnTitle: String?
    var action: (() ->Void)?
    
    var body: some View {
        Button(action: action ?? {
            print("no action")
        }, label: {
            Spacer()
            Text(btnTitle ?? "Button")
                .font(.title3.weight(.semibold))
            Spacer()
            
        }).padding().frame(maxWidth: .infinity)
            
            
        background(Color("ButtonColor"))

            .foregroundColor(.white)
//            .background(Color("ButtonColor")).cornerRadius(15).foregroundColor(.white)
    }
     
}
struct SecondaryButton_Previews: PreviewProvider{
    static var previews: some View{
        SecondaryButton()
    }
}


struct CartItemIncrement: View{
    @Binding var count: Int
    var body: some View{
        VStack{
            HStack{
                Divider().frame(height: 20)
                Button("-", action:{
                    if count>=1{
                        self.count -= 1
                    }
                })
                Divider().frame(height: 20)
                Text("\(count)")
                Divider().frame(height: 20).border(Color.pink)
                Button("+",action: {
                    self.count += 1
                })
                Divider().frame(height: 20)
                
            }.overlay{RoundedRectangle(cornerRadius: 5,style: .continuous).stroke(.pink, lineWidth: 2)}
           
//            let _ = self.totalval(count)
        }
//        let totalval = { value;: Int)-> Int in
//                 value = count
//             }

    }
}

struct CartItemIncrement_Previews: PreviewProvider{
    static var previews: some View{
        CartItemIncrement(count: .constant(1))
    }
}
