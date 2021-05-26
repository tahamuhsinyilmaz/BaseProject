//
//  DioCommon.swift
//  Dio
//
//  Created by onedio on 9.11.2019.
//  Copyright © 2019 onedio. All rights reserved.
//

// ======================================================================================
/*
 Generic AF.request Method and callback response data...
 */
// ======================================================================================

import Foundation
import Alamofire

class WebServiceHandler {
    private init() {

    }
    static let shared = WebServiceHandler()
    func sendRequest(url: String, method: HTTPMethod, params: [String: Any], headers: HTTPHeaders? = nil, completion: @escaping (_ data: AFDataResponse<Data>?, _ error: Error?) -> Void) {

        AF.request(url, method: method, parameters: params, headers: headers).validate(contentType: ["application/json"])
            .responseData(completionHandler: { (response) in

                switch response.result {
                case .success:
                    guard response.data != nil else {
                        completion(nil, nil)
                        return
                    }
                    completion(response, nil)
                case .failure(let error):
                    completion(nil, error)
                }

            })
//            .responseJSON { (data) in
//                print(data.value)
//        }
    }

    func sendDeleteWithParam(url: String, params: [String: Any], headers: HTTPHeaders? = nil, completion: @escaping (_ data: AFDataResponse<Data>?, _ error: Error?) -> Void) {
        AF.request(url, method: .delete, parameters: params, encoding: URLEncoding.httpBody, headers: headers).validate(contentType: ["application/json"])
            .responseData(completionHandler: { (response) in
                guard response.data != nil else {
                    completion(nil, nil)
                    return
                }
                completion(response, nil)

            })
    }

    func makeGetRequestWithQueryParams(url: String, params: [String: Any], headers: HTTPHeaders, completion: @escaping (_ data: AFDataResponse<Data>?, _ error: Error?) -> Void) {
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding(destination: .queryString), headers: headers).validate(contentType: ["application/json"])
        .responseData(completionHandler: { (response) in
            guard response.data != nil else {
                completion(nil, nil)
                return
            }
            completion(response, nil)
            })
            .responseJSON { (_) in
//            print(data.value)
            }
    }

    func uploadImage(url: String, headers: HTTPHeaders, imageData: Data, completion: @escaping (_ data: AFDataResponse<Data>?, _ error: Error?) -> Void) {
        AF.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageData, withName: "image", fileName: "image.png", mimeType: "image/png")

        }, to: url, headers: headers).responseData(completionHandler: { (response) in
            guard response.data != nil else {
                completion(nil, nil)
                return
            }
            completion(response, nil)
        })
//        AF.upload(multipartFormData: { (multipartFormData) in
//            multipartFormData.append(imageData, withName: "image",fileName: "file.png", mimeType: "image/png")
//        }, to: url, headers: headers).responseJSON { (data) in
//            print(data.value)
//        }
    }

}
