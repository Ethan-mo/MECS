//
//  MainHomeSensorTableViewCell.swift
//  MECS
//
//  Created by 모상현 on 2022/09/19.
//

import UIKit

class MainHomeSensorTableViewCell: UITableViewCell {

    @IBOutlet weak var stateSensorImage: UIImageView!
    @IBOutlet weak var strapBatteryImage: UIImageView!
    @IBOutlet weak var stateConnectWifiImage: UIImageView!
    
    @IBOutlet weak var sensorNameLabel: UILabel!
    @IBOutlet weak var stateSensorLabel: UILabel!
    @IBOutlet weak var changeTimeLabel: UILabel!
    @IBOutlet weak var changeCountLabel: UILabel!
    @IBOutlet weak var diaperSensorLabel: UILabel!
    @IBOutlet weak var strapLabel: UILabel!
    
    @IBOutlet weak var sensorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func sensorHelpButton(_ sender: Any) {
    }
    @IBAction func changeButton(_ sender: UIButton) {
    }
    @IBAction func detailLogButton(_ sender: Any) {
    }
}
