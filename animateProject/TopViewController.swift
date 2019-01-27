//
//  TopViewController.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/1/13.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var topPage: UIPageControl!
    var cell: TopCollectionViewCell!
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()

        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        topPage.numberOfPages = images.count
        topCollectionView.isPagingEnabled = true
        createTimer()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToMoreTopView"{
            let toViewController = segue.destination as! TopMoreViewController
            let indexPath = sender as! IndexPath
            let section = images[indexPath.row % images.count]
            toViewController.sections = images
            toViewController.section = section
            toViewController.indexPath = indexPath
        }
    }
    func createTimer(){
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    @objc
    func timerAction(){
        let currentOffsetX = topCollectionView.contentOffset.x
        let offsetX = currentOffsetX + topCollectionView.bounds.width
        if currentOffsetX == CGFloat(2 * images.count - 1) * self.topCollectionView.bounds.width {
            self.topCollectionView.contentOffset.x = CGFloat(images.count - 1) * self.topCollectionView.bounds.width
        }else {
            topCollectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        }
    }
    //定制了pageControl的点位置
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        topPage.currentPage = Int(offsetX / scrollView.bounds.width) % (images.count)
    }
    //松开时重新创建定时器
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        createTimer()
    }
    //拖拽关闭定时器
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer.invalidate()
        timer = nil
        
    }
    //影响拖拽的情况，比如d拖拽到第一个cell，再往左边可以过去，最大同理
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.topCollectionView.contentOffset.x == CGFloat(2 * images.count - 1) * self.topCollectionView.bounds.width{
            self.topCollectionView.contentOffset.x = CGFloat(images.count - 1) * self.topCollectionView.bounds.width
        }else if self.topCollectionView.contentOffset.x == 0{
            self.topCollectionView.contentOffset.x = CGFloat(images.count) * self.topCollectionView.bounds.width
        }
        
    }
}
//设置了cell
extension TopViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count * 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = topCollectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as! TopCollectionViewCell
        let section = images[indexPath.row % images.count]
        cell.topImageView.image = UIImage(named: section["image"]!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToMoreTopView", sender: indexPath)
    }
    
    
}
