//
//  AchievementsInfoModelMock.swift
//  StashTests
//
//  Created by Varun Mamindla on 4/19/21.
//

@testable import Stash

enum AchievementsInfoModelMock {
    static func getMockModel() -> AchievementInfo {
        let achiementModel = Achievement(achievementId: 1, level: "1", progress: 10, total: 50, imageURL: "", isAcessible: true)
        let infoModel = AchievementInfo(status: true, title: "Smart Investing", achievements: [achiementModel])
        return infoModel
    }
}
