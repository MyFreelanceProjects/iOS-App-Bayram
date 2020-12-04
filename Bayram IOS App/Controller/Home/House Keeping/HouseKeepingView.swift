//
//  HouseKeepingView.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/30/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class HouseKeepingView: UIViewController {
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "House Keeping".uppercased()

        secondCollectionView.register(ReservationDetailCell_2.nib(), forCellWithReuseIdentifier: "cell")
    }
    
}

//MARK: - UICollectionViewDelegate
let HouseKeepingCollectionData: [CollectionViewStruct] = [
    CollectionViewStruct(image: UIImage(named: "f_information"), label: "INFORMATION"),
    CollectionViewStruct(image: UIImage(named: "f_repair"), label: "REPAIR"),
    CollectionViewStruct(image: UIImage(named: "f_necessary"), label: "NECESSARY"),
    CollectionViewStruct(image: UIImage(named: "f_cleaning"), label: "CLEANING"),
    CollectionViewStruct(image: UIImage(named: "f_laundry"), label: "LAUNDRY"),
    CollectionViewStruct(image: UIImage(named: "f_feedback"), label: "FEEDBACK"),
]

extension HouseKeepingView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationItem.backBarButtonItem = self.customBackButton
        switch indexPath.row {
            case 0:
                performSegue(withIdentifier: "House_InformationSegue", sender: self)
            case 1:
                performSegue(withIdentifier: "HouseK_Repair", sender: self)
            case 2:
                performSegue(withIdentifier: "HouseK_Necessary", sender: self)
            case 3:
                performSegue(withIdentifier: "HouseK_Cleaning", sender: self)
            case 4:
                performSegue(withIdentifier: "HouseK_Laundry", sender: self)
            case 5:
                performSegue(withIdentifier: "HouseKFeedback", sender: self)
            default:
                return
        }
    }
}

//MARK: - UICollectionViewDataSource
extension HouseKeepingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HouseKeepingCollectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = secondCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReservationDetailCell_2
            
            cell.img.image = HouseKeepingCollectionData[indexPath.row].image
            cell.label.text = HouseKeepingCollectionData[indexPath.row].label
            
            cell.dropShadow(color: UIColor(named: "border")!, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)

            
        return cell
            
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout
extension HouseKeepingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        return CGSize(width: collectionSize.width/2 - 10, height: 85)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

