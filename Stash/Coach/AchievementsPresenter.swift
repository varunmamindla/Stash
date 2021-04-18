//
//  AchievementsPresenter.swift
//  Stash
//
//  Created by Varun Mamindla on 4/18/21.
//

import Foundation

protocol AchievementsPresenting {
    var title: String? { get }
    var noOfRows: Int { get }
    func onViewWillAppear()
}

final class AchievementsPresenter {
    private let interactor: AchievementsInteracting
    weak var view: AchievementsViewing?
    var achievementsInfo: AchievementInfo?
    
    init(view: AchievementsViewing, interactor: AchievementsInteracting = AchievementsInteractor()) {
        self.view = view
        self.interactor = interactor
    }
    
    var achievemnetsUIModel: [AchievementUIModel] {
        var uiModels = [AchievementUIModel]()
        uiModels = achievementsInfo?.achievements.map({ return AchievementUIModel(model: $0) }) ?? []
        return uiModels
    }
}

extension AchievementsPresenter: AchievementsPresenting {
    var title: String? {
        return achievementsInfo?.title
    }
    
    var noOfRows: Int {
        return achievemnetsUIModel.count
    }
    
    func onViewWillAppear() {
        view?.showIndicator()
        interactor.fetchAchievemnts { [weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.view?.hideIndicatior()
            switch result {
            case .failure:
                print("failure")
            case .success(let response):
                strongSelf.achievementsInfo = response
                strongSelf.view?.updateView()
            }
        }
    }
}
