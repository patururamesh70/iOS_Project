//
//  ViewController.swift
//  TableviewSearchBar
//
//  Created by patururamesh on 20/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchbar: UISearchBar?
    @IBOutlet weak var tableview: UITableView?
    var data = ["Ntr","Nbk","Nkr","CBN","Apple","Cat","Banana","Dog","Ramesh","Mahesh","A","B","Ntr","Nbk","Nkr","CBN","Apple","Cat","Banana","Dog","Ramesh","Mahesh","Ntr","Nbk","Nkr","CBN","Apple","Cat","Banana","Dog","Ramesh","Mahesh","Ntr","Nbk","Nkr","CBN","Apple","Cat","Banana","Dog","Ramesh","Mahesh","Ntr","Nbk","Nkr","CBN","Apple","Cat","Banana","Dog","Ramesh","Mahesh","Ntr","Nbk","Nkr","CBN","Apple","Cat","Banana","Dog","Ramesh","Mahesh","Ntr","Nbk","Nkr","CBN","Apple","Cat","Banana","Dog","Ramesh","Mahesh","Ntr","Nbk","Nkr","CBN","Apple","Cat","Banana","Dog","Ramesh","Mahesh"]
    
       var searchingNames = [String]()
       var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
      
        
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchingNames.count
        }else {
            return data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if searching {
            cell?.textLabel?.text = searchingNames[indexPath.row]
        }else {
            cell?.textLabel?.text = data[indexPath.row]
        }
        return cell!
    }
    
    
}
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingNames = data.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableview?.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
    }
}
