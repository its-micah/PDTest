//
//  ResearchLog.swift
//  ResearchTest
//
//  Created by Micah Lanier on 2/3/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import Foundation
import UIKit

protocol LogProtocol {
    var logItems: Array<Any> { get }
    func add(_ item: Any)
}

struct Event {
    var description: String
    var timestamp: String?
}

final class ResearchLog: LogProtocol {
    var logItems: Array<Any> = [Event]()

    var logItemsWithTime:Array<Event> = [Event]()

//    func orderedEvents(listOfThings:[Any]) -> [Event] {
//
//    }

    var orderedEvents: [Event] {
//        let nonNilArray = self.logItems.flatMap{ thing in
//            if let actualThing = thing as? Event {
//                if let thingWithTime = actualThing.timestamp {
//                    return actualThing
//                }
//
//                return nil
//            }
//
//            return nil
//
////            guard let actualThing = thing as? Event,
////            let thingWithTime = actualThing.timestamp else {
////                return nil
////            }
////            return thingWithTime
//        }
//
//       return nonNilArray.sorted {($0 as! Event).timestamp.compare(($1 as! Event).timestamp, options: .numeric) == .orderedAscending } as! [Event]

        return self.logItems.sorted {($0 as! Event).timestamp!.compare(($1 as! Event).timestamp!, options: .numeric) == .orderedAscending } as! [Event]
    }

    func add(_ item: Any) {
        self.logItems.append(item)
    }
}

extension ResearchLog: CellViewModelItem {
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
