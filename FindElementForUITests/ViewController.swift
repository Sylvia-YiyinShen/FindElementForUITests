//
//  ViewController.swift
//  FindElementForUITests
//
//  Created by Zhihui Sun on 25/5/19.
//  Copyright © 2019 Sylvia Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonWithIdentifier: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        buttonWithIdentifier.accessibilityIdentifier = "buttonWithIdentifier"
        configureTableview()
    }

    private func configureTableview() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    
    
}

