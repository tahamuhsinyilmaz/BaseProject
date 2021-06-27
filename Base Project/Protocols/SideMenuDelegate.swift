//
//  SideMenuDelegate.swift
//  SurucuKursu
//
//  Created by onedio on 31.01.2021.
//  Copyright © 2021 Taha  YILMAZ. All rights reserved.
//

import Foundation

protocol SideMenuDelegate{
    var sideMenuViewController: SideMenuViewController { get set}
    func openSideMenu(completion: ((Bool) -> Void)?)
    func closeSideMenu(completion: ((Bool) -> Void)?)
}
