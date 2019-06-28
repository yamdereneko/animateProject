//
//  ViewController.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/1/13.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
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
extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToTableViewCell", for: indexPath) as! tableTableViewCell
        let section = images[indexPath.row]
        cell.tableImageView.image = UIImage(named:section["image"]!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToTableView", sender: indexPath)
    }
    
    
}

extension HomeViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.y
        let navigationHide = offSet <= 0
        navigationController?.setNavigationBarHidden(navigationHide, animated: true)
        if offSet < 0{
            tableView.transform = CGAffineTransform(translationX: 0, y: offSet)
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

