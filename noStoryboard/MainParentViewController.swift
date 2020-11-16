//
//  MainParentViewController.swift
//  noStoryboard
//
//  Created by leyo babu on 15/11/20.
//  Copyright © 2020 leyo babu. All rights reserved.
//

import UIKit

class MainParentViewController: UIViewController {

    var baseView = UIView()
    var headerView = UIView()
    var subHeaderView = UIView()
    var subHeaderBottomBar = UIView()
    var topSafeAreaHeight: CGFloat = 0
    var bottomSafeAreaHeight: CGFloat = 0
    var containerView = UIView()
    
    var category = UIButton()
    var themes = UIButton()
    var trending = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMethods()
    }
    
    func initMethods(){
        self.fetchingSafeArea()
        self.creatingBaseView()
    }
    
    
    func fetchingSafeArea(){
        if #available(iOS 11.0, *) {
          let window = UIApplication.shared.windows[0]
          let safeFrame = window.safeAreaLayoutGuide.layoutFrame
          topSafeAreaHeight = safeFrame.minY
          bottomSafeAreaHeight = window.frame.maxY - safeFrame.maxY
        }
    }
    
    func creatingBaseView(){
        baseView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height:  self.view.frame.size.height)
        baseView.backgroundColor = .white
        self.view.addSubview(baseView)
        self.creatingHeaderView()
    }
    
    func creatingHeaderView(){
        headerView.frame = CGRect(x: 0, y: topSafeAreaHeight, width: self.baseView.frame.size.width, height: 40)
        self.baseView.addSubview(headerView)
        
        // Creating Hamburger Menu
        let menuButton = UIButton()
        menuButton.frame = CGRect(x: 10, y: headerView.frame.size.height/4, width: 25, height: 25)
        menuButton.setImage(UIImage(named: "hamburger"), for: .normal)
        self.headerView.addSubview(menuButton)
        
        let feedNotification = UIButton()
        feedNotification.frame = CGRect(x: view.frame.size.width-35, y: headerView.frame.size.height/4, width: 30, height: 30)
        feedNotification.setImage(UIImage(named: "bell"), for: .normal)
        self.headerView.addSubview(feedNotification)
        
        // Creating Header Label
        let headerLabel = UILabel()
        headerLabel.text = "Explore"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.textAlignment = .center
        self.headerView.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: menuButton.trailingAnchor, constant: 10).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: feedNotification.leadingAnchor, constant: -10).isActive = true
        self.createSubHeaderView()
    }
    
    func createSubHeaderView(){
        subHeaderView.frame = CGRect(x: 0, y: self.headerView.frame.maxY + 10, width: self.baseView.frame.size.width, height: 40)
        subHeaderView.backgroundColor = .clear
        self.baseView.addSubview(subHeaderView)
        
        // Preparing category button
        category.backgroundColor = .white
        category.setTitle("Category", for: .normal)
        category.setTitleColor(UIColor.black, for: .normal)
        category.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        category.addTarget(self, action: #selector(didTappedCategory), for: .touchUpInside)
        self.subHeaderView.addSubview(category)
        category.translatesAutoresizingMaskIntoConstraints = false
        category.topAnchor.constraint(equalTo: subHeaderView.topAnchor).isActive = true
        category.bottomAnchor.constraint(equalTo: subHeaderView.bottomAnchor).isActive = true
        category.leadingAnchor.constraint(equalTo: subHeaderView.leadingAnchor, constant: 0).isActive = true
        category.widthAnchor.constraint(equalToConstant: (self.subHeaderView.frame.size.width/3)).isActive = true
        
        
        let seprationLineFront = UIView()
        self.subHeaderView.addSubview(seprationLineFront)
        seprationLineFront.translatesAutoresizingMaskIntoConstraints = false
        seprationLineFront.topAnchor.constraint(equalTo: subHeaderView.topAnchor,constant: 10).isActive = true
        seprationLineFront.bottomAnchor.constraint(equalTo: subHeaderView.bottomAnchor,constant: -10).isActive = true
        seprationLineFront.leadingAnchor.constraint(equalTo: category.trailingAnchor, constant: 0).isActive = true
        seprationLineFront.widthAnchor.constraint(equalToConstant: 2).isActive = true
        seprationLineFront.backgroundColor = .lightGray
        
        // Preparing theme button
        themes.backgroundColor = .white
        themes.setTitle("Themes", for: .normal)
        themes.setTitleColor(UIColor.black, for: .normal)
        themes.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        themes.addTarget(self, action: #selector(didTappedThemes), for: .touchUpInside)
        self.subHeaderView.addSubview(themes)
        themes.translatesAutoresizingMaskIntoConstraints = false
        themes.topAnchor.constraint(equalTo: subHeaderView.topAnchor).isActive = true
        themes.bottomAnchor.constraint(equalTo: subHeaderView.bottomAnchor).isActive = true
        themes.leadingAnchor.constraint(equalTo: category.trailingAnchor, constant: 2).isActive = true
        themes.widthAnchor.constraint(equalTo: category.widthAnchor, multiplier: 1.0).isActive = true
        
        let seprationLineBack = UIView()
        self.subHeaderView.addSubview(seprationLineBack)
        seprationLineBack.translatesAutoresizingMaskIntoConstraints = false
        seprationLineBack.topAnchor.constraint(equalTo: subHeaderView.topAnchor, constant: 10).isActive = true
        seprationLineBack.bottomAnchor.constraint(equalTo: subHeaderView.bottomAnchor, constant: -10).isActive = true
        seprationLineBack.leadingAnchor.constraint(equalTo: themes.trailingAnchor, constant: 0).isActive = true
        seprationLineBack.widthAnchor.constraint(equalToConstant: 2).isActive = true
        seprationLineBack.backgroundColor = .lightGray
        
        
        // Preparing trending button
        trending.backgroundColor = .white
        trending.setTitle("Trending", for: .normal)
        trending.setTitleColor(UIColor.black, for: .normal)
        trending.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        trending.addTarget(self, action: #selector(didTappedTrending), for: .touchUpInside)
        self.subHeaderView.addSubview(trending)
        trending.translatesAutoresizingMaskIntoConstraints = false
        trending.topAnchor.constraint(equalTo: subHeaderView.topAnchor).isActive = true
        trending.bottomAnchor.constraint(equalTo: subHeaderView.bottomAnchor).isActive = true
        trending.leadingAnchor.constraint(equalTo: themes.trailingAnchor, constant: 2).isActive = true
        trending.trailingAnchor.constraint(equalTo: subHeaderView.trailingAnchor, constant: 0).isActive = true
        trending.widthAnchor.constraint(equalTo: category.widthAnchor, multiplier: 1.0).isActive = true
        self.prepareBottomBar()
        
        
        
    }
    
    func prepareBottomBar(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let initXValue = self.category.frame.minX + (self.category.frame.size.width/6)
            self.subHeaderBottomBar.frame = CGRect(x: initXValue, y: self.category.frame.maxY-5, width: (self.view.frame.size.width/3)/1.5, height: 2)
            self.subHeaderBottomBar.backgroundColor = .red
            self.subHeaderView.addSubview(self.subHeaderBottomBar)
            self.didTappedCategory()
        }
    }
    
    @objc func didTappedCategory(){
        let initx = self.category.frame.minX
        let initW = self.category.frame.size.width/6
        UIView.animate(withDuration: 0.3) {
            self.subHeaderBottomBar.frame.origin.x = (initx+initW)
        }
        let topValue = self.subHeaderView.frame.maxY + 20
        removeChildVCCompletionHandler { (isFinished) in
            if isFinished == true {
                self.addChildViewControllerWithView(CollectionViewController(), topConstant: topValue, bottomConstant: 0, leadingConstant: 0, trailingConstant: 0, container: self.containerView)
            }
        }
        
        

        
    }
    
    @objc func didTappedThemes(){
        let initx = self.themes.frame.minX
        let initW = self.themes.frame.size.width/6
        UIView.animate(withDuration: 0.3) {
            self.subHeaderBottomBar.frame.origin.x = (initx+initW)
        }
        let topValue = self.subHeaderView.frame.maxY + 20
        removeChildVCCompletionHandler { (isFinished) in
            if isFinished == true {
                self.addChildViewControllerWithView(categoryTableViewVC(), topConstant: topValue , bottomConstant: 0, leadingConstant: 0, trailingConstant: 0, container: self.containerView)
            }
        }
        
    }
    
    @objc func didTappedTrending(){
        let initx = self.trending.frame.minX
        let initW = self.trending.frame.size.width/6
        UIView.animate(withDuration: 0.3) {
            self.subHeaderBottomBar.frame.origin.x = (initx+initW)
        }
        let topValue = self.subHeaderView.frame.maxY + 20
        removeChildVCCompletionHandler { (isFinished) in
            if isFinished == true {
                self.addChildViewControllerWithView(TrendingTableVC(), topConstant: topValue , bottomConstant: 0, leadingConstant: 0, trailingConstant: 0, container: self.containerView)
            }
        }
    }
    
    func removeChildVCCompletionHandler(completionHandler: @escaping (_ isFinished: Bool) -> Void){
        if self.children.count > 0{
            let viewControllers:[UIViewController] = self.children
            for viewContoller in viewControllers{
                viewContoller.willMove(toParent: nil)
                viewContoller.view.removeFromSuperview()
                viewContoller.removeFromParent()
                completionHandler(true)
                return
            }
        }
        completionHandler(true)
    }
    
    
}

extension UIViewController {

    func addChildViewControllerWithView(_ childViewController: UIViewController, toView view: UIView? = nil, topConstant:CGFloat, bottomConstant:CGFloat, leadingConstant:CGFloat, trailingConstant:CGFloat, container:UIView) {
        let view: UIView = view ?? self.view
        childViewController.removeFromParent()
        childViewController.view.removeFromSuperview()
        childViewController.willMove(toParent: self)
        addChild(childViewController)
        childViewController.didMove(toParent: self)
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(childViewController.view)
        view.addConstraints([
            NSLayoutConstraint(item: childViewController.view!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: topConstant),
            NSLayoutConstraint(item: childViewController.view!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: bottomConstant),
            NSLayoutConstraint(item: childViewController.view!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: leadingConstant),
            NSLayoutConstraint(item: childViewController.view!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: trailingConstant)
        ])
        view.layoutIfNeeded()
    }

    func removeChildViewController(_ childViewController: UIViewController) {
        childViewController.removeFromParent()
        childViewController.willMove(toParent: nil)
        childViewController.removeFromParent()
        childViewController.didMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        view.layoutIfNeeded()
    }
   
    
}
