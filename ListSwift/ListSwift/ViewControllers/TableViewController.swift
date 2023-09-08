//
//  TableViewController.swift
//  ListSwift
//
//  Created by pablo borquez on 08/09/23.
//

import UIKit

class TableViewController: UITableViewController {
    private var factory: TableViewFactory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareFactory()
        self.navigationItem.title = "Swift List"
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    // MARK: - private
    
    private func prepareFactory() {
        self.factory = TableViewFactory()
        self.factory?.prepare(tableView: self.tableView)
    }
}
