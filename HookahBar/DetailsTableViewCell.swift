//
//  DetailsTableViewCell.swift
//  HookahBar
//
//  Created by Игорь Михайлович Ракитянский on 19.07.16.
//  Copyright © 2016 Игорь Михайлович Ракитянский. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLable: UILabel!
    @IBOutlet weak var valueLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
