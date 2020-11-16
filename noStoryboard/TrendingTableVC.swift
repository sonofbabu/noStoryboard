//
//  TrendingTableVC.swift
//  noStoryboard
//
//  Created by leyo babu on 16/11/20.
//  Copyright © 2020 leyo babu. All rights reserved.
//

import UIKit

class TrendingTableVC: UIViewController {

    var trendingTV = UITableView()
    struct Cells {
           static let trendingCell = "trendingCell"
       }
    var sectionArray = [[String]]()
    var sectionSubArray = [[String]]()
    var sectionStockArray = [[String]]()
    var sectionHeader = ["Top Gainer","Top Seller"]
    let gainerArray = ["mediaFast","pinterest","Slack Technoloigies","Evoqua water"]
    let gainerSubviewArray = ["cloud","coins","corona","coronaCloud"]
    let topSellerArray = ["Slack Technoloigies","pinterest","mediaFast","Evoqua water"]
    let topSellerSubArray = ["heart","leaf","running","women"]
    let stockIncline = ["+56.98","-57.98","+55.98","-46.98"]
    let stockDecline = ["-56.98","+77.98","+65.98","-26.98"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMethods()
    }
    

     func initMethods(){
        self.configureTableView()
        self.trendingTV.register(UINib(nibName: "TrendingTableViewCell", bundle: nil), forCellReuseIdentifier: Cells.trendingCell)
        sectionArray.append(gainerArray)
        sectionArray.append(topSellerArray)
        sectionSubArray.append(gainerSubviewArray)
        sectionSubArray.append(topSellerSubArray)
        sectionStockArray.append(stockIncline)
        sectionStockArray.append(stockDecline)
    }
        
        
    func configureTableView(){
        self.view.addSubview(trendingTV)
        self.trendingTV.delegate = self
        self.trendingTV.dataSource = self
        self.trendingTV.rowHeight = 110
//        self.trendingTV.separatorStyle = .none
        trendingTV.translatesAutoresizingMaskIntoConstraints = false
        trendingTV.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        trendingTV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        trendingTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        trendingTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    
}

extension TrendingTableVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.sectionHeader.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 25))
        returnedView.backgroundColor = .white

        let label = UILabel(frame: CGRect(x: 10, y: 7, width: view.frame.size.width, height: 25))
        label.text = self.sectionHeader[section]
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        returnedView.addSubview(label)

        return returnedView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.sectionArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.trendingTV.dequeueReusableCell(withIdentifier: Cells.trendingCell, for: indexPath) as? TrendingTableViewCell ?? TrendingTableViewCell()
        if sectionArray.count > 0 && sectionSubArray.count > 0 {
            let trendingTitle:String = self.sectionArray[indexPath.section][indexPath.row]
            if trendingTitle != "" {
                cell.trendingTitle.text = trendingTitle
            }
            cell.trendingSubtitle.text = self.sectionSubArray[indexPath.section][indexPath.row]
            cell.trendingImage.image = UIImage(named: self.sectionSubArray[indexPath.section][indexPath.row])
            let stockValue:String = self.sectionStockArray[indexPath.section][indexPath.row]
            if stockValue.contains("-"){
                cell.trendingStockView.backgroundColor = .red
            }else{
                cell.trendingStockView.backgroundColor = UIColor(hexFromString: "#83dbcc")
            }
            cell.trendingStockLabel.text = self.sectionStockArray[indexPath.section][indexPath.row]
        }
        return cell
    }
    
    
}
