//
//  KeyChainManager.swift
//  Dio
//
//  Created by onedio on 24.04.2021.
//  Copyright © 2021 onedio. All rights reserved.
//
//******************************************************************************************//
//      TOKENS ARE WRITTEN IN KEY CHAIN AND THIS CLASS MANAGES READ, WRITE PROCESSES        //
//******************************************************************************************//

import Security
import UIKit

class KeyChainManager {

    class func save(key: String, data: Data) -> OSStatus {
        let query = [kSecClass as String: kSecClassGenericPassword as String,
                     kSecAttrAccount as String: key,
                     kSecValueData as String: data] as [String: Any]

        SecItemDelete(query as CFDictionary)

        return SecItemAdd(query as CFDictionary, nil)
    }

    class func load(key: String) -> Data? {
        let query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne ] as [String: Any]

        var dataTypeRef: AnyObject?

        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == noErr {
            return dataTypeRef as! Data?
        } else {
            return nil
        }
    }
    class func remove(key: String) {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword as String,
                                    kSecAttrAccount as String: key]

        let status = SecItemDelete(query as CFDictionary)
        if status != errSecSuccess {
            if let err = SecCopyErrorMessageString(status, nil) {
                print("Remove failed: \(err)")
            }
        }
    }
}
