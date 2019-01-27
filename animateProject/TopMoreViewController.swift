//
//  TopMoreViewController.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/1/25.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class TopMoreViewController: UIViewController {

    @IBOutlet weak var topMoreImage: UIImageView!
    var section:[String:String]!
    var sections:[[String:String]]!
    var indexPath: IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()
        topMoreImage.image = UIImage(named: section["image"]!)
    }

}
