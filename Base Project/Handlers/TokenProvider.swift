//
//  TokenProvider.swift
//  Dio
//
//  Created by onedio on 7.04.2020.
//  Copyright © 2020 onedio. All rights reserved.
//

//******************************************************************//
//       HOLDS THE ALL TOKENS THAT USED FROM THE APP                //
//******************************************************************//

import Foundation
class TokenProvider {
    private init() {}
    static var shared = TokenProvider()

    enum TokenType {
        case accessToken, appToken, refreshToken
    }

    func getAccessToken() -> String? {
        guard let data = KeyChainManager.load(key: Constants.shared.accesTokenKey) else {return nil}
        return String(decoding: data, as: UTF8.self)
    }

    func getAppToken() -> String? {
        guard let data = KeyChainManager.load(key: Constants.shared.appTokenKey) else {return nil}
        return String(decoding: data, as: UTF8.self)
    }

    func getRefreshToken() -> String? {
        guard let data = KeyChainManager.load(key: Constants.shared.refreshTokenKey) else {return nil}
        return String(decoding: data, as: UTF8.self)
    }

    func setToken(token: String?, tokenType: TokenType) {
        if let tokenString = token {
            let data = Data(tokenString.utf8)
            switch tokenType {
            case .accessToken:
                _ = KeyChainManager.save(key: Constants.shared.accesTokenKey, data: data)
            case .appToken:
                _ = KeyChainManager.save(key: Constants.shared.appTokenKey, data: data)
            case .refreshToken:
                _ = KeyChainManager.save(key: Constants.shared.refreshTokenKey, data: data)
            }
        } else {
            switch tokenType {
            case .accessToken:
                KeyChainManager.remove(key: Constants.shared.accesTokenKey)
            case .appToken:
                KeyChainManager.remove(key: Constants.shared.appTokenKey)
            case .refreshToken:
                KeyChainManager.remove(key: Constants.shared.refreshTokenKey)
            }
        }
    }
}
