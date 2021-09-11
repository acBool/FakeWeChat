//
//  FWCTabBarController.swift
//  FakeWeChat
//
//  Created by acBool on 2021/9/11.
//

import UIKit

class FWCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupViewControllers()
    }
    
    
    func setupViewControllers() {
        let messageVC = self.createViewController(title: FWCStyle.shared.messageTabbarTitle(), normalImage: "", selectImage: "", baseVC: FWCMessageViewController())
        let contactVC = self.createViewController(title: FWCStyle.shared.contactTabbarTitle(), normalImage: "", selectImage: "", baseVC: FWCContactViewController())
        let discoveryVC = self.createViewController(title: FWCStyle.shared.discoveryTabbarTitle(), normalImage: "", selectImage: "", baseVC: FWCDiscoveryViewController())
        let meVC = self.createViewController(title: FWCStyle.shared.meTabbarTitle(), normalImage: "", selectImage: "", baseVC: FWCMeViewController())
        viewControllers = [messageVC,contactVC,discoveryVC,meVC]
    }
    
    

    func createViewController(title: String, normalImage: String, selectImage: String, baseVC: FWCBaseViewController) -> FWCBaseNavigationController {
        let navc: FWCBaseNavigationController = FWCBaseNavigationController(rootViewController: baseVC)
        
        navc.tabBarItem.title = title
        navc.tabBarItem.image = UIImage(named: normalImage)
        navc.tabBarItem.selectedImage = UIImage(named: selectImage)
        //controller.tabBarItem!.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: UIControl.State())
        //controller.tabBarItem!.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.tabbarSelectedTextColor], for: .selected)
        return navc
    }
    
}
