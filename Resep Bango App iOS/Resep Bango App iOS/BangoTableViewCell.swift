//
//  BangoTableViewCell.swift
//  Resep Bango App iOS
//
//  Created by Jun  on 11/17/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class BangoTableViewCell: UITableViewCell {

    @IBOutlet weak var labelharga: UILabel!
    @IBOutlet weak var labelorang: UILabel!
    @IBOutlet weak var labelwaktu: UILabel!
    @IBOutlet weak var labelnama: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
