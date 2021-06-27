//
//  NavigationBarCustomization.swift
//  SurucuKursu
//
//  Created by Taha  YILMAZ on 9.07.2019.
//  Copyright © 2019 Taha  YILMAZ. All rights reserved.
//

import UIKit

class NavigationBarCustomization{
    
    
    fileprivate class func setImage(navigationItem:UINavigationItem, navigationBar:UINavigationBar){
        let imageView = UIImageView()
        let imageName: String = "navBarImage"
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    fileprivate class func setTitle(navigationItem:UINavigationItem, title:String){
        navigationItem.title = title
    }
    
    fileprivate class func setColor(viewController:UIViewController){
        let barColor = UIColor.red
        viewController.navigationController?.navigationBar.barTintColor = barColor
        viewController.navigationController?.navigationBar.tintColor = barColor
    }
    
    
    
}

extension UIViewController{
    func setNavBar(){
        NavigationBarCustomization.setColor(viewController: self)
        guard let navigationBar = self.navigationController?.navigationBar else{return}
        NavigationBarCustomization.setImage(navigationItem: self.navigationItem, navigationBar:navigationBar)
    }
}

