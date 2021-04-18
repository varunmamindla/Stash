//
//  ViewController.swift
//  Stash
//
//  Created by Varun Mamindla on 4/17/21.
//

import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome"
    }
    
    @IBAction func achievementsTapped(_ sender: Any) {
        let viewController = AchievementsBulider.buildAchievementView()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

