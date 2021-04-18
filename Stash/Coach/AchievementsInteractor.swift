//
//  AchievementsInteractor.swift
//  Stash
//
//  Created by Varun Mamindla on 4/17/21.
//

import Foundation

enum AchievementsSummaryError: Swift.Error {
    case loadFailed
}

typealias AchievementsSummaryResult = (Result<AchievementInfo?, AchievementsSummaryError>) -> Void

protocol AchievementsInteracting {
    func fetchAchievemnts(completion: @escaping AchievementsSummaryResult)
}

final class AchievementsInteractor {}

extension AchievementsInteractor: AchievementsInteracting {
    func fetchAchievemnts(completion: @escaping AchievementsSummaryResult) {
        if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                //let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let achievementInfo = try JSONDecoder().decode(AchievementInfo.self, from: data)
                completion(.success(achievementInfo))
            } catch {
                completion(.failure(.loadFailed))
            }
        }
        completion(.failure(.loadFailed))
    }
}
