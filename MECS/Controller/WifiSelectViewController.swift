//
//  WifiSelectViewController.swift
//  MECS
//
//  Created by 모상현 on 2022/09/22.
//

import UIKit

class WifiSelectViewController: UIViewController {

    var wifiArray:[Wifi] = []
    
    @IBOutlet weak var wifiSelectTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

   

}

extension WifiSelectViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wifiArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WifiCell", for: indexPath) as! WifiTableViewCell
        cell.wifiNameLabel.text = wifiArray[indexPath.row].wifiName
        if wifiArray[indexPath.row].wifiLock == true {
            cell.lockImageView?.isHidden = true
        }else{
            cell.lockImageView?.isHidden = false
        }
        
        
        cell.wifiImageView
        return UITableViewCell()
    }
    
}

extension WifiSelectViewController: UITableViewDelegate{
    
}
