//
//  R_DetailFeedback.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/24/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class R_DetailFeedback: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
        
    var ImageArray: Array<UIImage>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "CustomImageCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
}

//MARK: - CollectionView Data Source
extension R_DetailFeedback: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return ImageArray?.count ?? 1
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomImageCell
        
        cell.image.image = ImageArray?[indexPath.row] ?? UIImage(named: "empty")
        
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension R_DetailFeedback: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension R_DetailFeedback: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        
        return CGSize(width: collectionSize.width - 3, height: collectionSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
