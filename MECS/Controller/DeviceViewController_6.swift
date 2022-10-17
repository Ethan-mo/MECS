//
//  DeviceViewController_6.swift
//  MECS
//
//  Created by 모상현 on 2022/10/17.
//

import UIKit

class DeviceViewController_6: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextButton(_ sender: UIButton) {
        performSegue(withIdentifier: "6to7", sender: nil)
    }
}
