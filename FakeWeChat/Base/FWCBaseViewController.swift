//
//  FWCBaseViewController.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/11.
//

import UIKit

class FWCBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = FWCStyle.shared.mainBgColor()
        self.setupNavigationBackButton()
    }
    
    func setupNavigationBackButton() {
        if let value = self.navigationController?.viewControllers.count {
            if value > 1 {
                let btn = UIButton(type: .custom)
                btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
                btn.adjustsImageWhenHighlighted = false
                btn.contentHorizontalAlignment = .left
                btn.setImage(UIImage(named: FWCStyle.shared.navigationItemBlackImage()), for: .normal)
                btn.addTarget(self, action: #selector(popBackAction), for: .touchUpInside)
                let barItem = UIBarButtonItem(customView: btn)
                self.navigationItem.leftBarButtonItems = [barItem]
            }
        }
    }
    
    @objc func popBackAction() {
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    deinit {
        #if DEBUG
            print("---deinit---%@",self)
        #endif
    }

}
