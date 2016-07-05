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
        
        loadVCName()
        self.tabBar.tintColor = UIColor.orangeColor()
    
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        addComposeButton()
  
    }
    
    /**
     获取子控制器VC的名字string
     */
    func loadVCName()  {
        addChildVC("BBBOneViewController", title: "One", imageName: "tabbar_home", highlightedImageName: "tabbar_home_highlighted")
        addChildVC("BBBTwoViewController", title: "One", imageName: "tabbar_home", highlightedImageName: "tabbar_home_highlighted")
        addChildVC("BBBFiveViewController", title: "One", imageName: "tabbar_home", highlightedImageName: "tabbar_home_highlighted")
        addChildVC("BBBThreeController", title: "One", imageName: "tabbar_home", highlightedImageName: "tabbar_home_highlighted")
        addChildVC("BBBFourController", title: "One", imageName: "tabbar_home", highlightedImageName: "tabbar_home_highlighted")
    }
    
    /**
     添加tabBar中间button
     */
    private func addComposeButton() {
        let ComposeButton = UIButton()
        ComposeButton.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        ComposeButton.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        ComposeButton.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        ComposeButton.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        ComposeButton.addTarget(self, action: #selector(composeButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        let buttonW = UIScreen.mainScreen().bounds.size.width / CGFloat(viewControllers!.count)
        let buttonH = tabBar.bounds.size.height
        let buttonX = tabBar.bounds.size.width * 0.5
        let buttonY = tabBar.bounds.size.height * 0.5
        ComposeButton.frame = CGRectMake(0, 0, buttonW, buttonH)
        ComposeButton.center = CGPointMake(buttonX, buttonY)
        
        tabBar.addSubview(ComposeButton)
    }
    
    /**
     中间button的点击方法
     */
     func composeButtonClick()  {
        let fiveVC = BBBFiveViewController()
        self.presentViewController(fiveVC, animated: true, completion: nil)
        
        print(#function)
    }


    
    /**
     传进字符串创建tabbar子控制器方法
     
     - parameter childVC:              控制器
     - parameter title:                tabbarItem和navigation文字
     - parameter imageName:            tabbarItem图片名
     - parameter highlightedImageName: tabbarItem高亮图片名
     */
    private func addChildVC(childVCName:String,
                    title:String,
                    imageName:String,
                    highlightedImageName:String){
        //将string 转成 UIViewController类
        let bundleName = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        let className: AnyClass? = NSClassFromString(bundleName + "." + childVCName)
        print(className)
        let VCClass = className as! UIViewController.Type
        //通过类创建控制器
        let childVC = VCClass.init()
        print(childVC)
        //设置页面
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
