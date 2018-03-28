//
//  TableViewController.swift
//  AssetManagement
//
//  Created by BS-195 on 3/28/18.
//  Copyright © 2018 rajubd49. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var fruits = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let dataAsset = NSDataAsset(name: "Fruits") {
            let string = String(data:dataAsset.data, encoding:.utf8)
            fruits = (string?.components(separatedBy: ","))!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row].capitalized;
        cell.imageView?.image = UIImage(named: fruits[indexPath.row])
        cell.backgroundColor = (indexPath.row % 2 == 0) ? UIColor(named: "Custom Blue"): UIColor(named: "Custom Green")
        return cell
    }

}
