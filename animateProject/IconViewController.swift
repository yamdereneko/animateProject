//
//  IconViewController.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/1/25.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class IconViewController: UIViewController {

    @IBOutlet weak var IconCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IconCollectionView.delegate = self
        IconCollectionView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToMoreIconView"{
            let toIconViewController = segue.destination as! IconMoreViewController
            let indexPath = sender as! IndexPath
            let section = images[indexPath.row % images.count]
            toIconViewController.section = section
            toIconViewController.sections = images
            toIconViewController.indexPath = indexPath
        }
    }

}
extension IconViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruit.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconViewCell", for: indexPath) as! IconCollectionViewCell
        let section = fruit[indexPath.row ]
        cell.IconImageView.image = UIImage(named: section["image"]!)
        cell.IconLabelView.text = section["text"]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToMoreIconView", sender: indexPath)
    }
    
    
}
