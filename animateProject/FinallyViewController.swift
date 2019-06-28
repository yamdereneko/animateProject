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
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FinallyCell", for: indexPath) as! FinallyCollectionViewCell
        let section  = images[indexPath.row % images.count]
        cell.finallyImage.image = UIImage(named: section["image"]!)
        cell.finallyLabel.text = section["text"]
        cell.layer.transform = animateCell(cellFrame: cell.frame)
        return cell
    }
}

extension FinallyViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let collectionView = scrollView as? UICollectionView{
            for cell in collectionView.visibleCells as! [FinallyCollectionViewCell]{
                let indexPath = collectionView.indexPath(for: cell)!
                let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
                let cellFrame = collectionView.convert(attributes.frame,to:view)
                
                let translationX = cellFrame.origin.x / 5
                cell.finallyImage.transform = CGAffineTransform(translationX: translationX, y: 0)
                
                cell.layer.transform = animateCell(cellFrame: cellFrame)
            }
            
        }
    }
    func animateCell(cellFrame: CGRect) -> CATransform3D{
        let angleFromX = Double((-cellFrame.origin.x) / 10)
        let angle = CGFloat((angleFromX * Double.pi) / 180.0)
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/1000
        let rotation = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        var scaleFromX = (1000 - (cellFrame.origin.x - 200)) / 1000
        let scaleMax: CGFloat = 1.0
        let scaleMin: CGFloat = 0.0
        if scaleFromX > scaleMax{
            scaleFromX = scaleMax
        }
        if scaleFromX < scaleMin{
            scaleFromX = scaleMin
        }
        let scale = CATransform3DScale(CATransform3DIdentity, scaleFromX, scaleFromX, 1)
        return CATransform3DConcat(rotation, scale)
    }
    
}

