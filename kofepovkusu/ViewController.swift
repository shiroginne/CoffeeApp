//
//  ViewController.swift
//  kofepovkusu
//
//  Created by Suhakou Yauheni on 18/03/2017.
//  Copyright © 2017 kaff.io. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let coffeeList = FakeDB(jsonString: "coffee_list").load()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset.top = 20
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeCell", for: indexPath)
        let currentCoffee = coffeeList[indexPath.row]

        cell.textLabel?.text = currentCoffee["name"]
        cell.detailTextLabel?.text = currentCoffee["description"]

        return cell
    }

}

