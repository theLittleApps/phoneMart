//
//  PhoneItemList.swift
//  phoneMart
//
//  Created by YEN-JU HUANG on 2022/9/20.
//

import Foundation

/*
 {
 "data": [8 items]
 }
 */

struct PhoneItemList: Codable {
    let data: [PhoneItem]
}

/*
 {
 "price": 39950,
 "martShortName": "iPhone 12 Pro Max 256GB",
 "imageUrl": "https://pdinfo.senao.com.tw/octopus/contents/99b404a6bcfb4a74a27e4a10746fb258.jpg",
 "finalPrice": 39950,
 "martName": "iPhone 12 Pro Max 256GB【下殺97折 送保護貼兌換券】",
 "stockAvailable": 30,
 "martId": 1250797
 },
 */

struct PhoneItem: Codable, Identifiable {
    let price: Int
    let martShortName: String
    let imageUrl: String
    let finalPrice: Int
    let martName: String
    let stockAvailable: Int
    let martId: Int
    
    var id: Int {
        return martId
    }
}
