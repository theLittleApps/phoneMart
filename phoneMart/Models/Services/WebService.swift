//
//  WebService.swift
//  phoneMart
//
//  Created by YEN-JU HUANG on 2022/9/20.
//

import Foundation
import Combine

struct WebService {
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func requestJSON<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                // debug
//                if let dataStr = String(data: result.data, encoding: .utf8) {
//                    print("dataStr:\(dataStr)")
//                }
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
