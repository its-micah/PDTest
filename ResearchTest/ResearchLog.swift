//
//  ResearchLog.swift
//  ResearchTest
//
//  Created by Micah Lanier on 2/3/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import Foundation
import UIKit

struct Event {
    var description: String
    var timestamp: String
}

protocol LogProtocol {
    var logItems: Array<Any> { get }
    func add(_ item: Any)
}

final class ResearchLog: CellViewModelItem, LogProtocol {
    var logItems: Array<Any> = [Event]()

    // I know this is bad below with the force unwrapping, how do I do this better?

    var orderedEvents: [Event] {
        return self.logItems.sorted {
            ($0 as! Event).timestamp.compare(($1 as! Event).timestamp, options: .numeric) == .orderedAscending } as! [Event]
    }

    func add(_ item: Any) {
        self.logItems.append(item)
    }

    var type: CellType {
        return .researchLogEvent
    }

    var rowCount: Int {
        return logItems.count
    }

    var sectionTitle: String {
        return "Log"
    }

    var icon: UIImage {
        return self.type.icon
    }

}
