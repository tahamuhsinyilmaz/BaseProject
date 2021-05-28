//
//  GenericParser.swift
//  Dio
//
//  Created by Evren Yaşar on 2020-12-03.
//  Copyright © 2020 onedio. All rights reserved.
//
//******************************************************************//
//                        GENERIC JSON PARSER                       //
//******************************************************************//

import Foundation
import Alamofire
class GenericParser {

    static func execute<T: Decodable>(type: T.Type,
                                      data: AFDataResponse<Data>?,
                                      error: Error?,
                                      url: String? = nil,
                                      completion: @escaping (_ data: T?, _ error: Error?) -> Void ) {
        guard let data = data?.data else {
            completion(nil, nil)
            return
        }
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            completion(object, nil)
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }
    }

}
