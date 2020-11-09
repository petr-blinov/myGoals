//
//  CreateGoalVC.swift
//  MyGoals
//
//  Created by Петр Блинов on 31.10.2020.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.bindToKeyboard()
        shortTermButton.setDeselectedColor()
        longTermButton.setDeselectedColor()
        goalTextView.delegate = self

    }
    

    @IBAction func shortTermButtonPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }
    
    @IBAction func longTermButtonPressed(_ sender: Any) {
        goalType = .longTerm
        longTermButton.setSelectedColor()
        shortTermButton.setDeselectedColor()

    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(identifier: "FinishGoalVC") as? FinishGoalVC
            else { return }
            
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
    dismissDetail()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
}
