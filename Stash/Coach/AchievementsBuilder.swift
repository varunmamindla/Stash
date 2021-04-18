//
//  AchievementsBuilder.swift
//  Stash
//
//  Created by Varun Mamindla on 4/18/21.
//

import Foundation

enum AchievementsBulider {
    static func buildAchievementView() -> AchievementsViewController {
        let viewController: AchievementsViewController = DefaultNib.viewController()
        let interactor = AchievementsInteractor()
        let presenter = AchievementsPresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        
        return viewController
    }
}
