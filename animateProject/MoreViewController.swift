//
//  MoreViewController.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/2/14.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    @IBAction func safiriButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "More to Web", sender: "https://spectrum.chat/design-code")
    }
    @IBAction func twitterButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "More to Web", sender: "https://twitter.com")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "More to Web"{
            let toNav = segue.destination as! UINavigationController
            let toVC = toNav.viewControllers.first! as! WebViewController
            toVC.urlString =  sender as? String
        }
    }
    
}
extension MoreViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "To MoreCollection", for: indexPath) as! MoreCollectionViewCell
        let section = icon[indexPath.row]
        cell.IconView.image = UIImage(named: section["image"]!)
        cell.LabelView.text = section["label"]
        return cell
    }
    
    
}
