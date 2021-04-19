//
//  AchievementUIModel.swift
//  Stash
//
//  Created by Varun Mamindla on 4/18/21.
//

import Foundation

protocol AchievementViewState {
    var level: String { get }
    var completedPoints: String { get }
    var totalPoints: String { get }
    var imageURL: String { get }
    var progressBarFill: Float { get }
    var isAccessible: Bool { get }
}

struct AchievementUIModel {
    let model: Achievement
}

extension AchievementUIModel: AchievementViewState {
    var level: String {
        return model.level
    }
    
    var completedPoints: String {
        let completedPointsString = "\(model.progress)pts"
        return completedPointsString
    }
    
    var totalPoints: String {
        let totalPointsString = "\(model.total)pts"
        return totalPointsString
    }
    
    var imageURL: String {
        return model.imageURL
    }
    
    var isAccessible: Bool {
        return model.isAcessible
    }
    
    var progressBarFill: Float {
        let progress = Float(model.progress) / Float(model.total)
        return progress
    }
}
