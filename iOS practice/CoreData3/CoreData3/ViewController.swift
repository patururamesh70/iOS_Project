//
//  ViewController.swift
//  CoreData3
//
//  Created by patururamesh on 17/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var StudentTableviewList: UITableView!
    var students: [Student] = []
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        ReadStudents()
    }
    func ReadStudents(){
        students = CoreDataManger.shared.fetch()
        print(students)
        StudentTableviewList.reloadData()
    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  else {return UITableViewCell() }
        
        cell.textLabel?.text = students[indexPath.row].name
        cell.detailTextLabel?.text = students[indexPath.row].adress
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = students[indexPath.row]
        student.name = "Updated name"
        CoreDataManger.shared.saveContext()
        ReadStudents()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let student = students[indexPath.row]
        CoreDataManger.shared.delete(student: student)
        ReadStudents()
    }
    
    
}

