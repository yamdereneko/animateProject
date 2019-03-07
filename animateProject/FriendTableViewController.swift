//
//  FriendTableViewController.swift
//  animateProject
//
//  Created by ヤンデレ猫 on 2019/3/5.
//  Copyright © 2019 ヤンデレ猫. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {
    var Friends: Array<Dictionary<String,String>> = Friend
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Friend.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell
        let section = Friends[indexPath.row]
        cell.ImageView.image = UIImage(named: section["Icon"]!)
        cell.NameView.text = section["Name"]
        cell.DateView.text = section["Date"]
        cell.TextView.text = section["Text"]
        cell.BGImageView.image = UIImage(named: section["BG"]!)
        cell.numberView.text = section["Number"]
        return cell
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.y
        let navigationHide = offSet <= 0
        navigationController?.setNavigationBarHidden(navigationHide, animated: true)
    }
}

