//
//  BBBTabBarController.swift
//  项目swift
//
//  Created by LinBin on 16/6/24.
//  Copyright © 2016年 LinBin. All rights reserved.
//

import UIKit

class BBBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = UIColor.orangeColor()
        
        
        let oneVC = BBBOneViewController()
        self.addChildVC(oneVC, title: "One", imageName: "tabbar_home", highlightedImageName: "tabbar_home_highlighted")
        
        let twoVC = BBBTwoViewController()
        self.addChildVC(twoVC, title: "Two", imageName: "tabbar_home", highlightedImageName: "tabbar_home_highlighted")
        
        let threeVC = BBBThreeController()
        self.addChildVC(threeVC, title: "Three", imageName: "tabbar_home", highlightedImageName: "tabbar_home_highlighted")
        
        let fourVC = BBBFourController()
        self.addChildVC(fourVC, title: "Four", imageName: "tabbar_home", highlightedImageName: "tabbar_home_highlighted")
        
        

   
        

        
    }
    
    /**
     包装tabbar子控制器方法
     
     - parameter childVC:              控制器
     - parameter title:                tabbarItem和navigation文字
     - parameter imageName:            tabbarItem图片名
     - parameter highlightedImageName: tabbarItem高亮图片名
     */
    func addChildVC(childVC:UIViewController,
                    title:String,
                    imageName:String,
                    highlightedImageName:String){
        //创建并设置第一个页面
        childVC.title = title
        childVC.tabBarItem.image = UIImage(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage(named: highlightedImageName)
        
        //添加导航栏
        let navVC = UINavigationController()
        navVC.addChildViewController(childVC)
        //添加到TabBarController
        self.addChildViewController(navVC)
    }
    



}
