//
//  DioCommonSDWebImageHandler.swift
//  Dio
//
//  Created by onedio on 11.11.2019.
//  Copyright © 2019 onedio. All rights reserved.
//

//**********************************************************//
//    This class managing image rendering with sdwebimage   //
//**********************************************************//

import Foundation
import UIKit
import SDWebImage

struct SDWebImageHandler {
    static func setImageView(urlString: String, imageView: UIImageView, placeholderText: String) {

        guard let url = URL(string: urlString) else {
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: placeholderText)
            return
        }
        imageView.sd_setImage(with: url, placeholderImage: UIImage(named: placeholderText))

    }
}
