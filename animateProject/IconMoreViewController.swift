//
//  IconMoreViewController.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/1/25.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class IconMoreViewController: UIViewController {

    @IBOutlet weak var IconMoreImageView: UIImageView!
    var section:[String:String]!
    var sections:[[String:String]]!
    var indexPath: IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()
        IconMoreImageView.image = UIImage(named: section["image"]!)
    }
    @IBAction func CloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
