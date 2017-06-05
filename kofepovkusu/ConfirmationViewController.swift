//
//  ConfirmationViewController.swift
//  kofepovkusu
//
//  Created by Suhakou Yauheni on 05/06/2017.
//  Copyright © 2017 kaff.io. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    @IBAction func confirm(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
