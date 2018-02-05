//
//  ProjectType.swift
//  ResearchTest
//
//  Created by Micah Lanier on 1/28/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import Foundation
import UIKit

enum ProjectType {
    case research
    case development
    case someday

    var themeColor: UIColor {
        switch self {
        case .research:
            return UIColor(red: 0, green: 184/255, blue: 239/255, alpha: 1)
        case .development:
            return UIColor(red: 241/255, green: 90/255, blue: 41/255, alpha: 1)
        case .someday:
            return UIColor.gray
        }
    }

    var titleIcon: UIImage {
        switch self {
        case .research:
            return UIImage(named: "clockBlue")!
        case .development:
            return UIImage(named: "clockRed")!
        case .someday:
            return UIImage(named: "")!
        }
    }

    var heading: String {
        switch self {
        case .research:
            return "Research"
        case .development:
            return "Development"
        case .someday:
            return "Someday"
        }
    }
}
