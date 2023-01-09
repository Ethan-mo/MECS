//
//  DeviceViewController_1.swift
//  MECS
//
//  Created by 모상현 on 2022/09/28.
//

import UIKit

class DeviceViewController_1: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var deviceNameLabel: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        제스처부여하기()
    }
    
    // MARK: - Helper
    func 제스처부여하기(){
        let tapGestureImageView = UITapGestureRecognizer(target: self, action: #selector(뷰를눌렀을때))
        selectView.addGestureRecognizer(tapGestureImageView) // 제스처를 추가....
        selectView.isUserInteractionEnabled = true // 유저와의 소통을 가능하게...
    }
    func configureUI() {
        self.title = "기기 연결하기"
        descriptionLabel.text = "연결할 기기를 선택해주세요"
        deviceNameLabel.text = "원형센서 + 알림등"
        selectView.layer.cornerRadius = 10
        selectView.layer.borderWidth = 2
        selectView.layer.borderColor = UIColor.systemGroupedBackground.cgColor
    }
    
    // MARK: - Selector
    @objc func 뷰를눌렀을때(){
        performSegue(withIdentifier: "1to2", sender: nil)
        let vc = DeviceViewController_2()
        vc.modalPresentationStyle = .fullScreen
        print("Tap")
    }

}
