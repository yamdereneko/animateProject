//
//  ViewController.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/1/13.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        tableCollectionView.delegate = self
        tableCollectionView.dataSource = self
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToTableView" {
            let toViewController = segue.destination as! tableViewController
            let indexpath = sender as! IndexPath
            let section = images[indexpath.row]
            toViewController.section = section
            toViewController.sections = images
            toViewController.indexPath = indexpath
        }
    }

}
extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCell", for: indexPath) as! tableCollectionViewCell
        let section = images[indexPath.row]
        cell.tableImage.image = UIImage(named: section["image"]!)
        cell.layer.transform = animateCell(cellFrame: cell.frame)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToTableView", sender: indexPath)
    }
    
    
}
extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.y
        let navigationHide = offSet <= 0
        navigationController?.setNavigationBarHidden(navigationHide, animated: true)
        if offSet < 0{
            tableCollectionView.transform = CGAffineTransform(translationX: 0, y: offSet)
        }
        if let collectionView = scrollView as? UICollectionView{
            for cell in collectionView.visibleCells as! [tableCollectionViewCell]{
                let indexPath = collectionView.indexPath(for: cell)!
                let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
                let cellFrame = collectionView.convert(attributes.frame,to:view)
                
                let translationX = cellFrame.origin.x / 5
                cell.tableImage.transform = CGAffineTransform(translationX: translationX, y: 0)
                
                
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

