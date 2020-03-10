//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Kelsey Sparkman on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    @IBOutlet weak var nameTextLabel: UITextField!
    @IBOutlet weak var notesTextLabel: UITextView!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    // Mark: - Properties
    var task: Task?
    var dueDateValue: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        dueDateTextField.inputView = dueDatePicker
    }
    
    // Mark: - Actions
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextLabel.text, !name.isEmpty else {return}
        let notes = notesTextLabel.text
        let date = dueDatePicker.date
        
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, due: date)
        } else {
            TaskController.sharedInstance.add(taskWithName: name, notes: notes, due: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        self.dueDateValue = sender.date
        self.dueDateTextField.text = sender.date.dateToString()
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        self.dueDateTextField.resignFirstResponder()
        self.nameTextLabel.resignFirstResponder()
        self.notesTextLabel.resignFirstResponder()
        
    }
    
    func updateViews() {
        guard let task = task, isViewLoaded else {return}
        title = task.name
        nameTextLabel.text = task.name
        notesTextLabel.text = task.notes
        dueDateTextField.text = (task.due as Date?)?.dateToString()
    }

    // MARK: - Table view data source

        // MARK: - Navigation

}
