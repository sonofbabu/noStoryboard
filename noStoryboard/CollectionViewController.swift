//
//  CollectionViewController.swift
//  noStoryboard
//
//  Created by leyo babu on 15/11/20.
//  Copyright © 2020 leyo babu. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
   
    

    private var collectionView: UICollectionView?
    var topSafeAreaHeight: CGFloat = 0
    var bottomSafeAreaHeight: CGFloat = 0
    var collectionTitleArray = ["Stocks","Etfs","Crypto","BitCoins","Home","Beta","Running Around","Art and Culture"]
    var collectionImageArray = ["cloud","coins","corona","coronaCloud","heart","leaf","running","women"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchingSafeArea()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-30, height: (view.frame.size.height/4)-15)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {return}
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = CGRect(x: 20, y: 10, width: self.view.frame.size.width-40, height:  self.view.frame.size.height-((bottomSafeAreaHeight*2)+150))
        collectionView.backgroundColor = .white
    }
    
    func fetchingSafeArea(){
        if #available(iOS 11.0, *) {
          let window = UIApplication.shared.windows[0]
          let safeFrame = window.safeAreaLayoutGuide.layoutFrame
          topSafeAreaHeight = safeFrame.minY
          bottomSafeAreaHeight = window.frame.maxY - safeFrame.maxY
        }
    }
    

    
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.collectionTitleArray.count
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell ?? CustomCollectionViewCell()
        cell.titleLabel.text = self.collectionTitleArray[indexPath.row]
        cell.thumpnailImageView.image = UIImage(named: self.collectionImageArray[indexPath.row])
        return cell
    }
    
    
}
