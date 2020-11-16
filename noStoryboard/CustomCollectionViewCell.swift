//
//  CustomCollectionViewCell.swift
//  noStoryboard
//
//  Created by leyo babu on 15/11/20.
//  Copyright © 2020 leyo babu. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "customCell"
    
//    private let thumpnailImageView : UIImageView = {
//        let cellimageView = UIImageView()
//        cellimageView.image = UIImage(systemName: "house")
//        return cellimageView
//    }()
    
//    private let titleLabel : UILabel = {
//        let celltitleLabel = UILabel()
//        celltitleLabel.text = "Category content"
//        return celltitleLabel
//    }()
    var titleLabel = UILabel()
    var thumpnailImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor =  UIColor(hexFromString: "#fafbfc")
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor(hexFromString: "#eef0f9").cgColor
        contentView.addSubview(titleLabel)
        contentView.addSubview(thumpnailImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 5, y: contentView.frame.size.height - 65, width: contentView.frame.size.width-10, height: 50)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 2
        thumpnailImageView.frame = CGRect(x: 5, y: 15, width: contentView.frame.size.width-10, height: contentView.frame.size.height-80)
        thumpnailImageView.contentMode = .scaleAspectFit
        contentView.layer.cornerRadius = 10
    }
    
    
}


extension UIColor {
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

