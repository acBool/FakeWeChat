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
        let messageVC = self.createViewController(title: FWCStyle.shared.messageTabbarTitle(), normalImage: FWCStyle.shared.tabbarMeNormalImage(), selectImage: FWCStyle.shared.tabbarMeSelectImage(), baseVC: FWCMessageViewController())
        let contactVC = self.createViewController(title: FWCStyle.shared.contactTabbarTitle(), normalImage: FWCStyle.shared.tabbarContactsNormalImage(), selectImage: FWCStyle.shared.tabbarContactsSelectImage(), baseVC: FWCContactViewController())
        let discoveryVC = self.createViewController(title: FWCStyle.shared.discoveryTabbarTitle(), normalImage: FWCStyle.shared.tabbarDiscoveryNormalImage(), selectImage: FWCStyle.shared.tabbarDiscoverySelectImage(), baseVC: FWCDiscoveryViewController())
        let meVC = self.createViewController(title: FWCStyle.shared.meTabbarTitle(), normalImage: FWCStyle.shared.tabbarMeNormalImage(), selectImage: FWCStyle.shared.tabbarMeSelectImage(), baseVC: FWCMeViewController())
        viewControllers = [messageVC,contactVC,discoveryVC,meVC]
    }
    
    

    func createViewController(title: String, normalImage: String, selectImage: String, baseVC: FWCBaseViewController) -> FWCBaseNavigationController {
        let navc: FWCBaseNavigationController = FWCBaseNavigationController(rootViewController: baseVC)
        
        navc.tabBarItem.title = title
        navc.tabBarItem.image = UIImage(named: normalImage)?.withRenderingMode(.alwaysOriginal)
        navc.tabBarItem.selectedImage = UIImage(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        navc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: FWCStyle.shared.tabbarTitleNormalColor()], for: .normal)
        navc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: FWCStyle.shared.tabbarTitleSelectColor()], for: .selected)
        return navc
    }
    
}
