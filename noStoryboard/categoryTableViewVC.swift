//
//  categoryTableViewVC.swift
//  noStoryboard
//
//  Created by leyo babu on 16/11/20.
//  Copyright © 2020 leyo babu. All rights reserved.
//

import UIKit

class categoryTableViewVC: UIViewController {

    var categoryTV = UITableView()
    var colorCodeArray = ["#afaefd","#9666c1","#40b5a2","#55ba70","#4e4fcf","#ce6fce"]
    var tableTitleArray = ["Stocks","Etfs","Crypto","BitCoins","Home","Beta"]
    var tableImageArray = ["graph","bell","search","home","team","tips"]
    
    struct Cells {
        static let categoryCell = "categoryCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMethods()
        // Do any additional setup after loading the view.
    }
    
    func initMethods(){
        self.configureTableView()
        self.categoryTV.register(CategoryTableViewCell.self, forCellReuseIdentifier: Cells.categoryCell)
    }
    
    
    func configureTableView(){
        self.view.addSubview(categoryTV)
        self.categoryTV.delegate = self
        self.categoryTV.dataSource = self
        self.categoryTV.rowHeight = 110
//        self.categoryTV.separatorStyle = .none
        categoryTV.translatesAutoresizingMaskIntoConstraints = false
        categoryTV.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        categoryTV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        categoryTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        categoryTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    
    
   
}

extension categoryTableViewVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tableTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.categoryTV.dequeueReusableCell(withIdentifier: Cells.categoryCell, for: indexPath) as? CategoryTableViewCell ?? CategoryTableViewCell()
        cell.categoryTitle.text = self.tableTitleArray[indexPath.row]
        cell.categoryImageView.image = UIImage(named: self.tableImageArray[indexPath.row])
        cell.categoryImageView.contentMode = .scaleAspectFit
        cell.categoryMainView.layer.cornerRadius = self.categoryTV.rowHeight/3
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.categoryMainView.backgroundColor = UIColor(hexFromString: "\(self.colorCodeArray[indexPath.row])")
        return cell
    }
    
    
}
