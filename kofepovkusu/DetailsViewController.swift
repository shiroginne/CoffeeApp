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
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var packetCount: UILabel!
    @IBOutlet weak var cupsCount: UILabel!
    @IBOutlet weak var orderBtn: UIButton!

    let coffeeList = FakeDB(jsonString: "coffee_list").load()
    var currentCoffee = 0
    let cupsPerPacket = 25

    override func viewDidLoad() {
        super.viewDidLoad()

        var coffee = coffeeList[currentCoffee]

        if !coffee.isEmpty {
            coffeeNameLabel.text = coffee["name"]
            countryLbl.text = coffee["country"]
            coffeeDescriptionLabel.text = coffee["full_description"]
        }

        self.cupsCount.text = String(describing: cupsPerPacket)
    }

    @IBAction func subsctractBtn(_ sender: Any) {
        var currentCount = Int(self.packetCount.text!)!
        var cupsCount = Int(self.cupsCount.text!)!

        if currentCount <= 1 {
            currentCount = 1
            cupsCount = cupsPerPacket
        } else {
            currentCount = currentCount - 1
            cupsCount = cupsCount - cupsPerPacket
        }

        self.packetCount.text = String(describing: currentCount)
        self.cupsCount.text = String(describing: cupsCount)
        updateOrderBtn(currentCount: currentCount)
    }

    @IBAction func addBtn(_ sender: Any) {
        var currentCount = Int(self.packetCount.text!)!
        currentCount = currentCount + 1
        let cupsCount = cupsPerPacket * currentCount

        self.packetCount.text = String(describing: currentCount)
        self.cupsCount.text = String(describing: cupsCount)
        updateOrderBtn(currentCount: currentCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateOrderBtn(currentCount: Int) {
        var currentName = "Заказать"
        switch currentCount {
        case 3,4:
            currentName.append(" 😬")
        case 5,6:
            currentName.append(" 😆")
        case 7,8,9:
            currentName.append(" 🙃")
        case 10:
            currentName.append(" 😎")
        default:
            print("boooring")
        }

        self.orderBtn.setTitle(currentName, for: .normal)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.

    }
}
