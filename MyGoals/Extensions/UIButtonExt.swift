//
//  UIButtonExt.swift
//  MyGoals
//
//  Created by Петр Блинов on 31.10.2020.
//

import UIKit

extension UIButton {
    
    func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.7882352941, blue: 0.3254901961, alpha: 1)
    }
    
    func setDeselectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8666666667, blue: 0.6862745098, alpha: 1)
    }
}


