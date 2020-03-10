//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Kelsey Sparkman on 3/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDeligate: class {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}
   
class ButtonTableViewCell: UITableViewCell {

    // Mark: - Outlets
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    weak var delegate: ButtonTableViewCellDeligate?
    
    // Mark: - Actions
    
    fileprivate func updateButton(_ isComplete: Bool) {
        completeButton.setImage(isComplete ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete") , for: .normal)
    }
    
    func update(withTask task: Task) {
        taskNameLabel.text = task.name
        //dueDateLabel.text = task.due?.formatted
        updateButton(task.isComplete)
    }
 
    @IBAction func completeButtonTaped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
}// End of Class
