//
//  WifiSelectViewController.swift
//  MECS
//
//  Created by 모상현 on 2022/09/22.
//

import UIKit
import CoreBluetooth


class WifiConnectDetailInfo {
    var m_sensorDid: Int = 0
    var m_hubDid: Int = 0
    
    init(sensorDid: Int, hubDid: Int) {
        self.m_sensorDid = sensorDid
        self.m_hubDid = hubDid
    }
}

class WifiSelectViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nextPageBtn: UIButton!
    
    var m_detailInfo: WifiConnectDetailInfo?
    var m_popup: WifiSelectView?
    var registerType: HUB_TYPES_REGISTER_TYPE = .new
    var m_peripheral: CBPeripheral?
    
    @IBOutlet weak var wifiSelectTableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

   
// MARK: - Helper
    func configureUI() {
        self.title = "원형센서 + 알림등 연결하기"
        descriptionLabel.text = "알림센서를 알림등에 꽂아주세요."
        nextPageBtn.setTitle("다음으로", for: .normal)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        performSegue(withIdentifier: "5to6", sender: nil)
    }
    @IBAction func backPageBtnTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func exitPageBtnTapped(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
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
