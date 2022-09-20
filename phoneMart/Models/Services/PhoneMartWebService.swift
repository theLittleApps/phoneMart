//
//  PhoneMartWebService.swift
//  phoneMart
//
//  Created by YEN-JU HUANG on 2022/9/20.
//

import Foundation
import Combine

class PhoneMartWebService {
    let webSer = WebService()
    
    let fetchURL = "https://m.senao.com.tw/apis2/test/marttest.jsp"
    
    init() {}
    
    func fetchPhoneItemList() -> AnyPublisher<PhoneItemList, Error> {
        let request = URLRequest(url: URL(string: fetchURL)!)
        
        return webSer.requestJSON(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
}
