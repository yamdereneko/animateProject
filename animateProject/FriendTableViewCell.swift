//
//  FriendTableViewCell.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/3/5.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameView: UILabel!
    @IBOutlet weak var DateView: UILabel!
    @IBOutlet weak var TextView: UILabel!
    @IBOutlet weak var BGImageView: UIImageView!
    @IBOutlet weak var numberView: UILabel!
    @IBOutlet weak var goodView: UIImageView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var shareView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
