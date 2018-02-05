//
//  CellType.swift
//  ResearchTest
//
//  Created by Micah Lanier on 2/3/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import Foundation
import UIKit

enum CellType {
    case note
    case researchLogEvent
    case researchTitle
    case devIdea
    case devCharacter
    case developmentTitle
}

extension CellType {
    var icon: UIImage {
        switch self {
        case .devCharacter:
            return UIImage(named: "user")!
        case .devIdea:
            return UIImage(named: "LightningBolt")!
        case .note:
            return UIImage(named: "note")!
        case .researchLogEvent:
            return UIImage(named: "logEvent")!
        case .researchTitle:
            return UIImage(named: "clockBlue")!
        case .developmentTitle:
            return UIImage(named: "clockRed")!
        }
    }
}

protocol CellViewModelItem {
    var type: CellType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

// This extension below provides a default row count of 1 in case there are no arrays to fill tableview

extension CellViewModelItem {
    var rowCount: Int {
        return 1
    }
}
