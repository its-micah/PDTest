//
//  IdeaLog.swift
//  ResearchTest
//
//  Created by Micah Lanier on 2/15/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import Foundation
import UIKit

final class IdeaLog: CellViewModelItem, LogProtocol {
    var idea: String
    var logItems: Array<Any> = [String]()
    
    func add(_ item: Any) {
        self.logItems.append(item)
    }
    
    var type: CellType {
        return .devIdea
    }
    
    var rowCount: Int {
        return logItems.count
    }
    
    var sectionTitle: String {
        return "Ideas"
    }
    
    var icon: UIImage {
        return self.type.icon
    }
    
    init(idea: String) {
        self.idea = idea
    }
    
}
