//
//  AchievementsInteractorMock.swift
//  StashTests
//
//  Created by Varun Mamindla on 4/19/21.
//

@testable import Stash

final class AchievementsInteractorMock {
    var fetchAchievementsGotCalled = false
    var isResponseWithFailure = true
}

extension AchievementsInteractorMock: AchievementsInteracting {
    func fetchAchievemnts(completion: @escaping AchievementsSummaryResult) {
        fetchAchievementsGotCalled = true
        if isResponseWithFailure {
            completion(.failure(.loadFailed))
        } else {
            let model = AchievementsInfoModelMock.getMockModel()
            completion(.success(model))
        }
    }
}
