//
//  DioCommonFontSearcher.swift
//  Dio
//
//  Created by onedio on 27.11.2019.
//  Copyright © 2019 onedio. All rights reserved.
//

import Foundation
import UIKit

struct FontSearcher {
    static func searchFonts() {
        UIFont.familyNames.forEach({ familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName, fontNames)
        })
    }
}
