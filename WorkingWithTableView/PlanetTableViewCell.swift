//
//  PlanetTableViewCell.swift
//  WorkingWithTableView
//
//  Created by Sihem MOHAMED on 10/10/19.
//  Copyright © 2019 Simo. All rights reserved.
//

import UIKit

class PlanetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var planetLabel: UILabel!
    @IBOutlet weak var planetImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.planetImageView.layer.cornerRadius = 10
        self.planetImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
