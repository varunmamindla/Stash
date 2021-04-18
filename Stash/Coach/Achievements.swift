//
//  Achievements.swift
//  Stash
//
//  Created by Varun Mamindla on 4/17/21.
//

import Foundation

struct AchievementInfo: Codable {
    let status: Bool
    let title: String
    let achievements: [Achievement]
    
    enum CodingKeys: String, CodingKey {
        case status = "success"
        case title = "overview"
        case achievements
    }
    enum TitleKeys: String, CodingKey {
        case title
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decode(Bool.self, forKey: .status)
        let overviewInfo = try values.nestedContainer(keyedBy: TitleKeys.self, forKey: .title)
        title = try overviewInfo.decode(String.self, forKey: .title)
        achievements = try values.decode([Achievement].self, forKey: .achievements)
    }
}

struct Achievement: Codable {
    let achievementId: Int
    let level: String
    let progress: Int
    let total: Int
    let imageURL: String
    let isAcessible: Bool
    
    enum CodingKeys: String, CodingKey {
        case achievementId = "id"
        case level
        case progress
        case total
        case imageURL = "bg_image_url"
        case isAcessible = "accessible"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        achievementId = try values.decode(Int.self, forKey: .achievementId)
        level = try values.decode(String.self, forKey: .level)
        progress = try values.decode(Int.self, forKey: .progress)
        total = try values.decode(Int.self, forKey: .total)
        imageURL = try values.decode(String.self, forKey: .imageURL)
        isAcessible = try values.decode(Bool.self, forKey: .isAcessible)
    }
}
