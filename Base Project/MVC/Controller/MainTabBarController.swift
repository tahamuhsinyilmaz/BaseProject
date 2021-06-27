//
//  MainTabBarController.swift
//  SurucuKursu
//
//  Created by Taha  YILMAZ on 26.07.2019.
//  Copyright © 2019 Taha  YILMAZ. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var sideMenuDelagte: SideMenuDelegate!
    
    override func viewDidLoad() {
        initNavigationBar()
        setNavBar()
    }
    
    private func initNavigationBar(){
        let btn = UIBarButtonItem(image: UIImage(named: "hamburger"), style: .plain, target: self, action: #selector(hamburgerButton))
        self.navigationItem.leftBarButtonItem = btn
    }
    
    
    @objc func hamburgerButton(){
        sideMenuDelagte.openSideMenu(completion: {
            (isFinished) in
            if isFinished{
                UIView.animate(withDuration: 0.3) {
                    self.sideMenuDelagte.sideMenuViewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
                }
            }
        })
    }
}
