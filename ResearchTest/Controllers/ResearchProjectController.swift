//
//  ResearchProjectController.swift
//  ResearchTest
//
//  Created by Micah Lanier on 2/4/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import Foundation
import UIKit

class ResearchProjectController: NSObject, UINavigationControllerDelegate {

    weak var presentingViewController: UIViewController?
    let selectedProject: ResearchProjectClass

    init(presentingViewController: UIViewController, selectedProject: ResearchProjectClass) {
        self.presentingViewController = presentingViewController
        self.selectedProject = selectedProject
    }

    func present() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "ResearchVC") as! ViewController
        vc.researchProject = self.selectedProject
        presentingViewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
}
