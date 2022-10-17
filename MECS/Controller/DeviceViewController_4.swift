//
//  DeviceViewController_4.swift
//  MECS
//
//  Created by 모상현 on 2022/10/17.
//

import UIKit

class DeviceViewController_4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func nextButton(_ sender: UIButton) {
        performSegue(withIdentifier: "4to5", sender: nil)
    }
}
