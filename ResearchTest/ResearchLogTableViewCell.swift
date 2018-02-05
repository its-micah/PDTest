//
//  ResearchLogTableViewCell.swift
//  ResearchTest
//
//  Created by Micah Lanier on 1/6/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import UIKit

class ResearchLogTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: TimeCodeLabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupWith(_ event: Event) {
        let decimal = event.timestamp.replacingOccurrences(of: ":", with: ".")
        let fl = Float(decimal)
        let twoDecimalPlaces = String(format: "%05.2f", fl!)
        let redo = twoDecimalPlaces.replacingOccurrences(of: ".", with: ":")
        self.timeLabel.text = redo
        self.descriptionLabel.text = event.description
        self.timeLabel.layer.cornerRadius = 2
        self.timeLabel.layer.borderWidth = 2.0
        self.timeLabel.layer.borderColor = ProjectType.research.themeColor.cgColor
        self.timeLabel.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
