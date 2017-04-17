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

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "coffeeDetailsSegue" {
            let viewController = segue.destination as! DetailsViewController
            if let currentRow = self.tableView.indexPathForSelectedRow?.row {
                viewController.currentCoffee = currentRow
            }
        }
    }

}

