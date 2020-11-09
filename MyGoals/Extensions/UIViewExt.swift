//
//  UIViewExt.swift
//  MyGoals
//
//  Created by Петр Блинов on 31.10.2020.
//

import UIKit

extension UIView {
    
    func bindToKeyboard() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
   
        
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        
        let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey ] as! NSValue).cgRectValue
        
        let endingFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: KeyframeAnimationOptions(rawValue: curve), animations: {
                                    self.frame.origin.y += deltaY }, completion: nil)
    }

}
