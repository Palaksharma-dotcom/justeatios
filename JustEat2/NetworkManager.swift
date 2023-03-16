//
//  NetworkManager.swift
//  JustEat2
//
//  Created by Rapipay on 09/03/23.,
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    func requestForApi(request: String  ,completionHandler: ((Any)->())?) {
        print("Requesting api")
        var request = URLRequest(url: URL(string: request)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) {data, response, err in
            if let err = err {
                print("Received some error in api \(err.localizedDescription)")
                return
            }
            guard let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) else {
                print("Getting some error on json Sericliaxation")
                return
            }
            print(jsonData)
            completionHandler?(jsonData)
            print("First Api is loaded")
        }.resume()
    }
}
    
//    func requestForApi(completionHandler: ((Any, Any)->())?) {
//        print("Requesting api")
//        var request = URLRequest(url: URL(string: "https://retoolapi.dev/upVf9f/data")!)
//        request.httpMethod = "GET"
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        let session = URLSession.shared
//        session.dataTask(with: request) {data, response, err in
//            if let err = err {
//                print("Received some error in api \(err.localizedDescription)")
//                return
//            }
//            guard let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) else {
//                print("Getting some error on json Sericliaxation")
//                return
//            }
//            print("First Api is loaded")
//            var request1 = URLRequest(url: URL(string: "https://retoolapi.dev/5DddMe/data")!)
//            request1.httpMethod = "GET"
//            request1.setValue("application/json", forHTTPHeaderField: "Accept")
//            request1.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            let session1 = URLSession.shared
//            session1.dataTask(with: request1) {data, response, err in
//                if let err = err {
//                    print("Received some error in api \(err.localizedDescription)")
//                    return
//                }
//                guard let jsonData1 = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) else {
//                    print("Getting some error on json Sericliaxation")
//                    return
//                }
//                print(jsonData1)
//                completionHandler?(jsonData, jsonData1)
//            }.resume()
//        }.resume()
//    }
//}
