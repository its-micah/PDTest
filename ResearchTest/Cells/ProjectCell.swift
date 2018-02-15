//
//  iconCell.swift
//  ResearchTest
//
//  Created by Micah Lanier on 1/14/18.
//  Copyright © 2018 Micah Lanier. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {

    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpWithProject(_ project: ProjectBin, indexPath: IndexPath) {
        self.iconImageView.image = project.type.icon
        self.descriptionLabel.text = project.projectArray[indexPath.row].title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
