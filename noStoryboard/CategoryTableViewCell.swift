//
//  CategoryTableViewCell.swift
//  noStoryboard
//
//  Created by leyo babu on 16/11/20.
//  Copyright © 2020 leyo babu. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    var categoryMainView = UIView()
    var categoryImageView = UIImageView()
    var categoryTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(categoryMainView)
        self.constraintMainView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    
    func configureImageView(){
        
    }
    
    
    func configureTitle(){
        categoryTitle.textColor = UIColor.white
        categoryTitle.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    
  
    
    func constraintMainView(){
        categoryMainView.translatesAutoresizingMaskIntoConstraints = false
        categoryMainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        categoryMainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        categoryMainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        categoryMainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
//        categoryMainView.backgroundColor = .red
        categoryMainView.addSubview(categoryImageView)
        categoryMainView.addSubview(categoryTitle)
        self.constraintImageVew()
        self.constraintTitle()
        self.configureTitle()
        }

    func constraintImageVew(){
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        categoryImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        categoryImageView.widthAnchor.constraint(equalTo: categoryImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func constraintTitle(){
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        categoryTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        categoryTitle.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 10).isActive = true
        categoryTitle.heightAnchor.constraint(equalToConstant: 80).isActive = true
        categoryTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
}
