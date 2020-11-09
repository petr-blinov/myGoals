//
//  FinishGoalVC.swift
//  MyGoals
//
//  Created by Петр Блинов on 01.11.2020.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createFinishGoalButton: UIButton!
    
    @IBOutlet weak var pointsTextField: UITextField!
    
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFinishGoalButton.bindToKeyboard()
        
        pointsTextField.delegate = self
    }
    
    
    @IBAction func createFinishGoalButtonPressed(_ sender: Any) {
        
        // Pass data into Core Data Goal Model
        
        if pointsTextField.text != "" {
         
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                
                }
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
           try managedContext.save()
            completion(true)
            print("Data saved successfully")

        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
