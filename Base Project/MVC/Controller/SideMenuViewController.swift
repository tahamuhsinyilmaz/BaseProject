//
//  SideMenuViewController.swift
//  SurucuKursu
//
//  Created by onedio on 24.01.2021.
//  Copyright © 2021 Taha  YILMAZ. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    var sideMenuDelegate: SideMenuDelegate!
    weak var containerVC: ContainerViewController!
    
    @IBOutlet weak var sideMenuContainer: UIView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closeSideMenu()
    }
    
    @IBAction func closeButton(){
        closeSideMenu()
    }
    
    private func closeSideMenu(){
        self.view.backgroundColor = .clear
        sideMenuDelegate.closeSideMenu(completion: nil)
    }
    
    
    fileprivate func presentAccount(withURLString urlString : String){
        if let url = URL(string: urlString){
            UIApplication.shared.open(url, options: [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly : 0], completionHandler: nil)
            
        }else{
//            self.present(linkIsNilAlert, animated: true, completion: nil)
        }
    }
    
    
}

