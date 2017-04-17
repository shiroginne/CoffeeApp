//
//  DetailsViewController.swift
//  kofepovkusu
//
//  Created by Suhakou Yauheni on 17/04/2017.
//  Copyright © 2017 kaff.io. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var coffeeDescriptionLabel: UILabel!

    let coffeeList = FakeDB(jsonString: "coffee_list").load()
    var currentCoffee = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let coffee = coffeeList[currentCoffee]

        if !coffee.isEmpty {
            coffeeNameLabel.text = coffee["name"]
            coffeeDescriptionLabel.text = coffee["full_description"]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.

    }

}
