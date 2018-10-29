//
//  ModelPresenter.swift
//  TableViewProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Foundation
import Alamofire

struct ModelPresenter {
    func getModel(completion: @escaping (ResultAPI?, Error?) -> Void) {
        let utilityQueue = DispatchQueue.global(qos: .utility)
        Alamofire
            .request("https://api.randomuser.me/?nat=US&results=5")
            .responseData(queue: utilityQueue) { (response) in
            switch response.result {
            case .success(let value):
                do {
                    let result = try JSONDecoder().decode(ResultAPI.self,
                                                           from: value)
                    completion(result, nil)
                } catch {
                    print(error)
                    completion(nil, error)
                }
                
            case .failure(let error):
                print(error)
                completion(nil, error)
            }
        }
    }
}
