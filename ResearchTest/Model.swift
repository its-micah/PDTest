//
//  Model.swift
//  ResearchTest
//
//  Created by Micah Lanier on 1/6/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Project Protocol

/*
 I decided to go with a protocol to build projects since both Development and Research projects both share
 these properties with only slight differences which are oulined below in 'Project Types'.

 Is there a better way of structuring these?
 */


// MARK: - Project Value Types

/*
 The only difference between the two types below are ProjectType and the variables for date on Development projects and the
 variable for runtime on Research projects.

 Again, is there a better way of constructing these two types?

 Look into changing out Notes and Logs in to simple Arrays<String>
 */

/*
struct DevelopmentProject: Project {
    var title: String
    var log: IdeaLog
    var ideaLog: Array<String>
    var notes: Notes
    var developmentNotes: Array<String>
    let date: Date

    var projectType: ProjectType {
        return .development
    }

    var cellType: CellType {
        return .developmentTitle
    }

    var icon: UIImage {
        return UIImage(named: "clockBlue")!
    }
}

struct ResearchProject: Project {
    var title: String
    var log: ResearchLog
    var notes: Notes
//    var researchNotes: Array<String>
    let runtime: String

    var projectType: ProjectType {
        return .research
    }

    var cellType: CellType {
        return .researchTitle
    }

    var icon: UIImage {
        return UIImage(named: "clockRed")!
    }
}
*/


// MARK: - Project Enum

/*
 This enum below gives the Projects above access to computed properties for things
 like theme colors, section header titles for their detail VC tableview, and heading titles
 for the home VC tableview.

 This has been moved to the ProjectType.swift file


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

    var sections: Array<String> {
        switch self {
        case .research:
            return ["Notes", "Log"]
        case .development, .someday:
            return ["Notes", "Idea Log", "Characters", "Themes"]
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
*/


// MARK: - Cell Types

/*
 This are where I have the a lot of questions and I feel like Im losing control haha. There are a
 limited number of cell styles in the app, so I decided to use an enum to categorize them. They each
 have a different icon image depending on the cell's type, seen below in the extension.

 The protocol 'Cell' is adopted by each type that will have data presented in a cell, like 'Notes', 'Events', 'DevIdea', etc...

 Is this a valid structure? I feel like I'm making this more complicated than it needs to be, but it works. Plus I'm repeating
 the code 'self.type.icon' in each type below that adopts the protocol. Is that ok?

 This works for each projects detail VC, but I'm confused as to how I structure this so I can show
 just project titles on the home VC. I'll probably have to show the prototype to better explain what I mean. Do I need to create a
 container type to hold all of the Projects?
 */


// MARK: - NOTE

/*
 Separate data and visual. Don't mix. Rename to be more specific and explicit. Use Classes when wanting to change data/manipulate state.
 Use Structs when wanting to lock things down and not change. Look into moving Section Titles into Celltype Enum
 */

// MARK: - Log Structure

/*
 Ok, here we go. This is a big head-scratch moment for me. So... both Research Projects and Development Projects have
 similar items (named 'Ideas' for Dev and 'Event' for Research) that the user adds which are put in an array for storage and are
 displayed in a tableview, but they have one small difference between the two. Dev Ideas just have a description, where Research
 Events have both a description and a timecode. So I made a protocol with just 'description' since they both share that, and made a
 protocol extension with 'timestamp' so that Research projects have access to it. But.. I don't understand the 'get set' rule below in
 the extension. I have the error that 'Extensions can have stored properties' when I don't have 'get set', and this was the workaround.
 I don't like not understanding this, and I feel it's fundamental.

 I then tried a struct with an extension, but it has the same issue.

 What's the best way to go about this? Do I need two different Event types that both adopt the Event protocol?
 With one having the extra 'timestamp' variable? That seems like alot to just have a one variable differnece.


Option 1 - Protocol
----------------------------------

protocol Event {
    var description: String { get }
}

extension Event {
    var timestamp: String {
        set {
            self.timestamp = newValue
        }

        get {
            return self.timestamp
        }
    }
}

 Option 2 - Struct with Extension
----------------------------------

struct Event {
    var description: String
}

extension Event {
    var timestamp: String {
        set {
            self.timestamp = newValue
        }

        get {
            return self.timestamp
        }
    }
}

 Option 3 - Protocol with 2 different types of Logs
 --------------------------------------------------

 This would also mean creating two different types of Logs: Research Log and Development Log, since
 Research logs need a description AND timestamp, and Development Logs only need a description.

 struct Event {
    let description: String
    let timestamp: String
 }

 struct Idea {
    let idea: String
 }

 protocol LogProtocol {
    var logItems: Array<Any> { get }
    mutating func add(_ item: Any)
 }

 Below, I've used option 3 above, and created 2 different types of logs, 'Research Log', and 'Idea Log'.
 Both of these conform to the 'LogProtocol', which adds a itemArray for storing ideas or events, and it
 also add an add function with adds items to the itemArray.

 Is there a better way of doing this without having to create two different types of Logs?

 */


//class ProjectViewModel: NSObject {
//    var items = [CellViewModelItem]()
//
//}
//
//extension ProjectViewModel: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return items.count
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items[section].rowCount
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // we will configure the cells here
//    }
//}



