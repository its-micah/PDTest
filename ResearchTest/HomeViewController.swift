//
//  HomeViewController.swift
//  ResearchTest
//
//  Created by Micah Lanier on 1/13/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import UIKit

protocol ProjectBin {
    var projectArray: Array<ProjectProtocol> { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
    var type: CellType { get }
}

class DevelopmentProjectBin: CellViewModelItem, ProjectBin {
    var projectArray: Array<ProjectProtocol>

    var type: CellType {
        return .developmentTitle
    }

    var sectionTitle: String {
        return "Development"
    }

    var rowCount: Int {
        return projectArray.count
    }

    init(withProject project:ProjectProtocol) {
        self.projectArray = [ProjectProtocol]()
        self.projectArray.append(project)
    }
}

class ResearchProjectBin: CellViewModelItem, ProjectBin {
    var projectArray: Array<ProjectProtocol>

    var type: CellType {
        return .researchTitle
    }

    var sectionTitle: String {
        return "Research"
    }

    var rowCount: Int {
        return projectArray.count
    }

    init(researchProjects: Array<ProjectProtocol>) {
        self.projectArray = researchProjects
    }
}


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {

    @IBOutlet weak var homeTableView: UITableView!
    var searchController: UISearchController!
    var items = [ProjectBin]()
    var researchProjects: ResearchProjectBin!
    var developmentProjects: DevelopmentProjectBin!
    var somedayProjects = [String]()
    var selectedProject: ProjectProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.delegate = self
        self.navigationController?.navigationBar.barTintColor = .white
        setupNavBar()

        let proj1 = ResearchProjectClass(title: "Raiders of the Lost Ark", projectType: .research, eventLog: ResearchLog(), notePad: NotePad(notes: [String]()))
        proj1.notePad.add("I wonder what Indy does for fun?")
        proj1.eventLog.add(Event(description: "Indy does a thing", timestamp: "1:45"))
        proj1.notePad.add("This happened and it is crazy")
        proj1.eventLog.add(Event(description: "Indy does another thing", timestamp: "8:45"))
        proj1.notePad.add("Who's Indy's mom?")
        proj1.eventLog.add(Event(description: "That guy's face melts off", timestamp: "65:45"))
        let proj5 = ResearchProjectClass(title: "Stranger Things Ep. 1", projectType: .research, eventLog: ResearchLog(), notePad: NotePad(notes: [String]()))
        proj5.eventLog.add(Event(description: "Will loses his bike", timestamp: "8:12"))
        proj5.notePad.add("Mornings are for coffee and contemplation. Great line by Hopper")

        let proj6 = ResearchProjectClass(title: "E. T. the Extra-Terrestrial", projectType: .research, eventLog: ResearchLog(), notePad: NotePad(notes: [String]()))
        let proj2 = DevelopmentProjectClass(title: "Darker Colors", projectType: .development, ideaLog: [], notePad: NotePad(notes: [String]()), themesLog: [], characterLog: [])
        let proj3 = DevelopmentProjectClass(title: "Counter Terrorism Peach", projectType: .development, ideaLog: [], notePad: NotePad(notes: [String]()), themesLog: [], characterLog: [])
        let proj4 = DevelopmentProjectClass(title: "Whoop Axe", projectType: .development, ideaLog: [], notePad: NotePad(notes: [String]()), themesLog: [], characterLog: [])

        researchProjects = ResearchProjectBin(researchProjects: [proj1, proj5, proj6])
        developmentProjects = DevelopmentProjectBin(withProject: proj2)
        developmentProjects.projectArray.append(proj3)
        developmentProjects.projectArray.append(proj4)

        items.append(researchProjects)
        items.append(developmentProjects)


    }

    func setupNavBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }


    func updateSearchResults(for searchController: UISearchController) {
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        print("The current section is \(items[indexPath.section])")
        let cell = self.homeTableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as! ProjectCell
        cell.setUpWithProject(item, indexPath: indexPath)
        return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        let section = indexPath.section
        selectedProject = items[section].projectArray[row]
        switch selectedProject.projectType {
        case .research:
            ResearchProjectController(presentingViewController: self, selectedProject: (selectedProject as! ResearchProjectClass)).present()
        case .development:
            print("This is a development project")
        case .someday:
            print("This is a someday project")
        }
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = .white
    }


}
