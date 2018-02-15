//
//  ViewController.swift
//  ResearchTest
//
//  Created by Micah Lanier on 1/6/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIToolbarDelegate {

    var events = [Event]()
    var notes = [String]()
    var projectType = ProjectType.research
    var items = [CellViewModelItem]()
    var researchProject: ResearchProjectClass?
    var tableViewSections = [String]()

    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var logTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.toolbar.delegate = self
        self.logTableView.delegate = self
        self.logTableView.dataSource = self

        self.navigationController?.navigationBar.topItem?.title = researchProject?.title
        customizeSegmentController()
        appendItems()

    }

    func appendItems() {
        items.append(researchProject!.notePad)
        items.append(researchProject!.eventLog)
    }

    func customizeSegmentController() {
        segmentedController.backgroundColor = .clear
        segmentedController.tintColor = .clear
        segmentedController.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont(name: "OpenSans", size: 16)!,
            NSAttributedStringKey.foregroundColor: UIColor.lightGray
            ], for: .normal)

        segmentedController.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont(name: "OpenSans", size: 16)!,
            NSAttributedStringKey.foregroundColor: UIColor.black
            ], for: .selected)

    }

    @IBAction func onAddEventTapped(_ sender: Any) {
        
    }

    // MARK: - Tableview Delegate functions


    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = items[indexPath.section]
        switch item.type {
        case .note:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "noteCell")
            cell.textLabel?.text = researchProject?.notePad.notes[indexPath.row]
            return cell
        case .researchLogEvent:
            let cell = self.logTableView.dequeueReusableCell(withIdentifier: "logCell") as! ResearchLogTableViewCell
            cell.setupWith((researchProject?.eventLog.orderedEvents[indexPath.row])!)
            return cell
        case .devIdea, .devCharacter, .researchTitle, .developmentTitle:
            let cell = UITableViewCell()
            return cell
        }


    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
        (view as! UITableViewHeaderFooterView).textLabel?.font = UIFont(name: "OpenSans-Bold", size: 16)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    

    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.topAttached
    }

    // MARK: - Unwind IBAction function

    @IBAction func unwindToLog(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddContentViewController {
            if let newEvent = sourceViewController.event {
                researchProject!.eventLog.add(newEvent)
                items.removeAll()
                appendItems()
                self.logTableView.reloadData()
            }
        }

    }


}

