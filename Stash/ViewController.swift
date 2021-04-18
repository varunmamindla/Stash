//
//  ViewController.swift
//  Stash
//
//  Created by Varun Mamindla on 4/17/21.
//

import UIKit

class ViewController: UIViewController {
    let temp = AchievementsInteractor()
    override func viewDidLoad() {
        super.viewDidLoad()
        temp.fetchAchievemnts { _ in
            print("Done.")
        }
    }
}

