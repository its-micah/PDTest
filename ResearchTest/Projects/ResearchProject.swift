//
//  ResearchProject.swift
//  ResearchTest
//
//  Created by Micah Lanier on 1/19/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import Foundation



protocol ProjectProtocol {
    var title: String { get }
    var notePad: NotePad { get }
    var projectType: ProjectType { get }
}

final class ResearchProjectClass: ProjectProtocol {
    var title: String
    let projectType: ProjectType
    var eventLog: ResearchLog
    var notePad: NotePad

    init(title: String, projectType: ProjectType, eventLog: ResearchLog, notePad: NotePad) {
        self.title = title
        self.projectType = projectType
        self.notePad = notePad
        self.eventLog = eventLog
    }

}

extension ResearchProjectClass: CellViewModelItem {
    var type: CellType {
        return .researchTitle
    }

    var sectionTitle: String {
        return "Research"
    }


}







