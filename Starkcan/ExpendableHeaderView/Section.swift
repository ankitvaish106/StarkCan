
//
//  Sectopm.swift
//  Starkcan
//
//  Created by NTGMM-01 on 01/05/18.
//  Copyright © 2018 Starkcan. All rights reserved.
//

import Foundation
struct Section
{
    var menuName: String!
    var subMenu: [String]?
    var expanded: Bool!
    var iconName:String!
    
    init(menuName: String,subMenu:[String]?,iconName:String, expanded: Bool)
    {
        self.menuName = menuName
        self.subMenu  = subMenu
        self.expanded = expanded
        self.iconName = iconName
    }
    
}
