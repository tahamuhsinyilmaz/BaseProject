//
//  APIService.swift
//  Dio
//
//  Created by onedio on 9.11.2019.
//  Copyright © 2019 onedio. All rights reserved.
//

//**************************************************//
//       ALL APP REQUESTS SENDS FROM HERE!!         //
//**************************************************//

import Foundation
import Alamofire

struct RequestManager {
    static let shared = RequestManager()

    private init() {}
    //======================================================================================
    /*
        Set Token Param
     */
    //======================================================================================
    func setParams(page: String, perPage: String) -> [String: Any] {
        return [
            "page": page,
            "perPage": perPage
        ]
    }

    func setAccesTokenAsHeader() -> HTTPHeaders {
        guard let accessToken = TokenProvider.shared.getAccessToken() else {return HTTPHeaders([:])}
        return HTTPHeaders(["Authorization": "Bearer " + accessToken])
    }

}
