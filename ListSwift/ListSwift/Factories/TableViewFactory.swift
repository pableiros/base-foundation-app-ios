//
//  TableViewFactory.swift
//  ListSwift
//
//  Created by pablo borquez on 08/09/23.
//

import UIKit

class TableViewFactory: NSObject, UITableViewDataSource, UITableViewDelegate {
    func prepare(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "TableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = "Row: \(indexPath.row)"
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
