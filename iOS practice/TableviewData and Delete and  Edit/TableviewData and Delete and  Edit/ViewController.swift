//
//  ViewController.swift
//  TableviewData and Delete and  Edit
//
//  Created by patururamesh on 20/07/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var displayedData = ["Ramesh","Mahesh","Suresh","Naresh","Rakesh","Ganesh","Ramesh","Mahesh","Suresh","Naresh","Rakesh","Ganesh"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            if let textField = alertController.textFields?.first, let text = textField.text, !text.isEmpty {
                self?.displayedData.append(text)
                self?.tableView.reloadData()
            }
        }
        
        alertController.addAction(addAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = displayedData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            displayedData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.displayedData.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            let alertController = UIAlertController(title: "Edit Item", message: nil, preferredStyle: .alert)
            
            alertController.addTextField { (textField) in
                textField.text = self.displayedData[indexPath.row]
            }
            
            let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
                if let textField = alertController.textFields?.first, let text = textField.text, !text.isEmpty {
                    self?.displayedData[indexPath.row] = text
                    self?.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            }
            
            alertController.addAction(saveAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        return [deleteAction, editAction]
    }
}

