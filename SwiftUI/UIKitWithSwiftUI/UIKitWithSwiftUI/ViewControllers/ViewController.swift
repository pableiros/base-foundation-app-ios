//
//  ViewController.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 21/09/23.
//

import UIKit

class ViewController: UIViewController {
    private var factory: CollectionViewFactory?
    
    override func loadView() {
        self.factory = CollectionViewFactory()
        self.view = self.factory?.createCollectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.maximumContentSizeCategory = .extraExtraExtraLarge
        self.title = "Health Demo"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

