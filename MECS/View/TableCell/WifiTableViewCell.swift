//
//  WifiTableViewCell.swift
//  MECS
//
//  Created by 모상현 on 2022/09/19.
//

import UIKit

class WifiTableViewCell: UITableViewCell {

    @IBOutlet weak var wifiNameLabel: UIStackView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var wifiImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
