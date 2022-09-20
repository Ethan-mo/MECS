//
//  MainHomeHubTableViewCell.swift
//  MECS
//
//  Created by 모상현 on 2022/09/19.
//

import UIKit

class MainHomeHubTableViewCell: UITableViewCell {

    @IBOutlet weak var stateHubImage: UIImageView!
    @IBOutlet weak var stateConnectWifiImage: UIImageView!
    
    
    @IBOutlet weak var hubNameLabel: UILabel!
    @IBOutlet weak var stateHubLabel: UILabel!
    @IBOutlet weak var changeTemLabel: UILabel!
    @IBOutlet weak var changeHumLabel: UILabel!
    @IBOutlet weak var wifiNameLabel: UILabel!
    
    
    @IBOutlet weak var hubView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func hubHelpButton(_ sender: UIButton) {
    }
    
}
