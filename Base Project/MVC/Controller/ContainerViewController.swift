//
//  ContainerViewController.swift
//  SurucuKursu
//
//  Created by onedio on 24.01.2021.
//  Copyright © 2021 Taha  YILMAZ. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    private var sideMenu: SideMenuViewController!
    var mainVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSideMenuConstraint()
        setNavBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sideMenuSegue"{
            guard let destination = segue.destination as? SideMenuViewController else {return}
            destination.sideMenuDelegate = self
            destination.containerVC = self
            sideMenuViewController = destination
        }else if segue.identifier == "mainNavSegue"{
            guard let navController = segue.destination as? UINavigationController,
                  let destination = navController.viewControllers.first as? MainTabBarController else {return}
            destination.sideMenuDelagte = self
            self.mainVC = destination
        }
    }
    
    private func initSideMenuConstraint(){
        self.sideMenuConstraint.constant = -(self.view.frame.width)
    }
    
    
}


extension ContainerViewController: SideMenuDelegate{
    var sideMenuViewController: SideMenuViewController {
        get {
            return self.sideMenu
        }set{
            self.sideMenu = newValue
        }
    }
    
    func openSideMenu(completion: ((Bool) -> Void)?) {
        changeSideMenu(to: .open, completion: completion)
    }
    
    func closeSideMenu(completion: ((Bool) -> Void)?) {
        changeSideMenu(to: .closed, completion:completion)
    }
    
    private func changeSideMenu(to status: SideMenuStatus, completion: ((Bool) -> Void)?){
        switch status {
        case .open:
            open(completion: completion)
        case .closed:
            close(completion: completion)
        }
    }
    
    private func open(completion: ((Bool) -> Void)?){
        UIView.animate(withDuration: 0.3, animations: {
            self.sideMenuConstraint.constant = 0
            self.view.layoutIfNeeded()
        }, completion: completion)
    }
    
    private func close(completion: ((Bool) -> Void)?){
        UIView.animate(withDuration: 0.3, animations: {
            self.sideMenuConstraint.constant = -(self.view.frame.width)
            self.view.layoutIfNeeded()
        }, completion: completion)
    }
}



