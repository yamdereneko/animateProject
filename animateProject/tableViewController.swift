//
//  tableCollectionViewController.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/1/13.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class tableViewController: UIViewController{
    
    @IBOutlet weak var tableMoreImage: UIImageView!
    var section: [String:String]!
    var sections: [[String:String]]!
    var indexPath: IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()
     tableMoreImage.image = UIImage(named: section["image"]!)
    }

    @IBAction func CloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
