//
//  NotePad.swift
//  ResearchTest
//
//  Created by Micah Lanier on 2/3/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import Foundation
import UIKit


final class NotePad {
    var notes: [String]

    init(notes: [String]) {
        self.notes = notes
    }

    func add(_ note: String) {
        self.notes.append(note)
    }
}

extension NotePad: CellViewModelItem {
    var type: CellType {
        return .note
    }

    var sectionTitle: String {
        return "Notes"
    }

    var icon: UIImage {
        return self.type.icon
    }

    var rowCount: Int {
        return self.notes.count
    }
}
