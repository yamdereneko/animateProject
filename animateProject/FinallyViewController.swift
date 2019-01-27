//
//  FinallyViewController.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/1/26.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class FinallyViewController: UIViewController {
    @IBOutlet weak var FinallyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FinallyCollectionView.delegate = self
        FinallyCollectionView.dataSource = self
        
    }
}
extension FinallyViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count * 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FinallyCell", for: indexPath) as! FinallyCollectionViewCell
        let section  = images[indexPath.row % images.count]
        cell.finallyImage.image = UIImage(named: section["image"]!)
        cell.finallyLabel.text = section["text"]
        return cell
    }
    
    
}
