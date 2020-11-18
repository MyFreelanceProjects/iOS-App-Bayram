//
//  DetailFeedbackController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/17/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class DetailFeedbackController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ImageArray = [
        UIImage(named: "hotel-1"),
        UIImage(named: "hotel-2"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        collectionView.register(UINib(nibName: "CustomImageCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
}

//MARK: - CollectionView Data Source
extension DetailFeedbackController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageArray.count
//        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomImageCell
        
        cell.image.image = ImageArray[indexPath.row]
        
        return cell
    }
    
//  UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        
        return CGSize(width: collectionSize.width, height: collectionSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
