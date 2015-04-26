//
//  MenuItemsParser.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import Foundation
import UIKit

class MenuItem {
    private struct Keys {
        static var nameKey = "name"
        static var imageNameKey = "image_name"
        static var colorKey = "color"
        static var segueKey = "segue"
    }
    
    var name: String
    var imageName: String
    var color: UIColor
    var segueIdentifier: String
    
    init(info: NSDictionary) {
        name = info.parse(Keys.nameKey)
        imageName = info.parse(Keys.imageNameKey)
        color = UIColor.colorWithHexString(info.parse(Keys.colorKey))
        segueIdentifier = info.parse(Keys.segueKey)
    }
}

class MenuItemsParser {
    static var menuItems: [MenuItem] = MenuItemsParser.loadMenuItems()
    
    private class func loadMenuItems() -> [MenuItem] {
        var result: [MenuItem] = []
        var arr = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("MenuItems", ofType: "plist")!)!
        
        for dict in arr as! [NSDictionary] {
            var entity = MenuItem(info: dict)
            result.append(entity)
        }
        
        return result
    }
}