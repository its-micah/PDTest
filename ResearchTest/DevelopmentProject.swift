//
//  DevelopmentProject.swift
//  ResearchTest
//
//  Created by Micah Lanier on 1/19/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import Foundation

final class DevelopmentProjectClass: ProjectProtocol {
    var title: String
    let projectType: ProjectType
    var ideaLog: Array<String>
    var notePad: NotePad
    var themesLog: Array<String>
    var characterLog: Array<String>

    init(title: String, projectType: ProjectType, ideaLog: [String], notePad: NotePad, themesLog: [String], characterLog: [String]) {
        self.title = title
        self.projectType = projectType
        self.ideaLog = ideaLog
        self.notePad = notePad
        self.themesLog = themesLog
        self.characterLog = characterLog
    }

}


extension DevelopmentProjectClass: CellViewModelItem {
    var type: CellType {
        return .developmentTitle
    }

    var sectionTitle: String {
        return "Development"
    }


}

