//
//  ViewController.swift
//  Table View With Button Trying
//
//  Created by Burak Yılmaz on 9.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var yesButtonArray:[String] = [String]()
    var noButtonArray:[String] = [String]()
    var yesbuttonChange = true

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yesButtonArray += ["Yes", "Yes1", "Yes2", "Yes3"]
        noButtonArray += ["No", "No1", "No2", "No3"]
        
        
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func yesButton(_ sender: Any) {
        
        yesbuttonChange = true
        tableView.reloadData()
        
    }
    @IBAction func noButton(_ sender: Any) {
        
        yesbuttonChange = false
        tableView.reloadData()
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if yesbuttonChange == true {
            return yesButtonArray.count
        }
        else {
            return noButtonArray.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if yesbuttonChange {
            cell.textLabel?.text = yesButtonArray[indexPath.row]
        }
        else {
            cell.textLabel?.text = noButtonArray[indexPath.row]
        }
        
        return cell
        
        
    }
    
}

