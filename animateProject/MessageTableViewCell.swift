//
//  MessageTableViewCell.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/3/4.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var MessageImageView: UIImageView!
    @IBOutlet weak var messageView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
