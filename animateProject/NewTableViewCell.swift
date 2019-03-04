//
//  NewTableViewCell.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/2/1.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var agreeNumberLabel: UILabel!
    @IBOutlet weak var commentNumberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
