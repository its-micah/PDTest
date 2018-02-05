//
//  AddContentViewController.swift
//  ResearchTest
//
//  Created by Micah Lanier on 1/8/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import UIKit

class AddContentViewController: UIViewController {

    @IBOutlet weak var timecodeField: UITextField!
    @IBOutlet weak var contentField: UITextView!
    var event: Event?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    @IBAction func Save(_ sender: Any) {
        if let descrip = contentField.text, let timecode = timecodeField.text {
            event = Event(description: descrip, timestamp: timecode)
            self.performSegue(withIdentifier: "unwindToLog", sender: self)
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
