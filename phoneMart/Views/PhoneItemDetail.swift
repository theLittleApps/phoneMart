//
//  PhoneItemDetail.swift
//  phoneMart
//
//  Created by YEN-JU HUANG on 2022/9/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhoneItemDetail: View {
    
    let item: PhoneItem
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.bottom)
            
            VStack(alignment: .leading) {
                WebImage(url: .init(string: item.imageUrl))
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading){
                    Text("商品編號: \(String(item.martId))")
                        .foregroundColor(.gray)
                        .font(.system(size: 12.0))
                    
                    Text(item.martShortName)
                        .fontWeight(.bold)
                }
                .padding(.bottom, 8.0)
                .padding(.leading, 8.0)
                
                HStack {
                    Text("$\(item.finalPrice)")
                        .foregroundColor(Color.red)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Button {
                    } label: {
                        Image(systemName: "suit.heart")
                            .imageScale(.medium)
                            .foregroundColor(Color.gray.opacity(0.7))
                    }
                    
                    Button {
                    } label: {
                        Image(systemName: "cart")
                            .imageScale(.medium)
                            .foregroundColor(Color.gray.opacity(0.7))
                    }
                }
                .padding(.leading, 8.0)
                .padding(.trailing, 8.0)
                
                Spacer()
            }
            .navigationTitle("商品資訊")
        
        }
        .background(Color.init(uiColor: UIColor(red: 0, green: 144/255, blue: 213/255, alpha: 1.0)))
        
    }
}

//struct PhoneItemDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PhoneItemDetail()
//    }
//}
