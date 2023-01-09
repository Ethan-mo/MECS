//
//  DeviceViewController_4.swift
//  MECS
//
//  Created by 모상현 on 2022/10/17.
//

import UIKit

class DeviceViewController_4: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nextPageBtn: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    


    // MARK: - Helper
    func configureUI() {
        self.title = "원형센서+알림등 연결하기"
        descriptionLabel.text = "알림센서를 알림등에 꽂아주세요."
        nextPageBtn.setTitle("다음으로", for: .normal)
    }


    @IBAction func nextPageBtnTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "4to5", sender: nil)
    }
    @IBAction func backPageBtnTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func exitPageBtnTapped(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
}
