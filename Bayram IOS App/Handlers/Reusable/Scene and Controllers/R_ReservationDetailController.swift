//
//  R_ReservationDetailController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/24/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class R_ReservationDetailController: UIViewController {
    @IBOutlet weak var imageCollection: UICollectionView!
    
    let imageCollectionData: Array<UIImage>? = nil
    var reservationIdentifier: String? = nil
    var feedbackIdentifier: String? = nil
    var menuIdentifier: String? = nil
    
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!

    var viewTitle: String = "" {
        didSet{
            self.title = viewTitle
        }
    }
    
    var delegate: ReservationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageCollection.register(ImageCollectionCell.nib(), forCellWithReuseIdentifier: "cell")
        firstCollectionView.register(ReservationDetailCell_1.nib(), forCellWithReuseIdentifier: "cell")
        secondCollectionView.register(ReservationDetailCell_2.nib(), forCellWithReuseIdentifier: "cell")
    }
    
}

//MARK: - CollectionViewData
struct CollectionViewStruct {
    let image: UIImage?
    let label: String?
}
let FirstCollectionViewData: [CollectionViewStruct] = [
    CollectionViewStruct(image: UIImage(named: "library-add"), label: "RESERVATION"),
    CollectionViewStruct(image: UIImage(named: "material-feedback"), label: "FEEDBACK"),
    CollectionViewStruct(image: UIImage(named: "material-person-pin"), label: "DRESS CODE"),
]
let SecondCollectionViewData: [CollectionViewStruct] = [
    CollectionViewStruct(image: UIImage(named: "map-food"), label: "FOOD"),
    CollectionViewStruct(image: UIImage(named: "local-drink"), label: "BEVERAGES"),
    CollectionViewStruct(image: UIImage(named: "wine-glass-alt"), label: "WINE"),
]

//MARK: - UICollectionViewDelegate

extension R_ReservationDetailController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == firstCollectionView {
            if indexPath.row == 0 {
                // coming identifier name from initialize
                delegate?.addReservationSegue(withIdentifier: reservationIdentifier ?? "")
            }
            else if indexPath.row == 1 {
                delegate?.addReservationSegue(withIdentifier: feedbackIdentifier ?? "")
            }
            else if indexPath.row == 2 {
                delegate?.showDressCode(type: "menu_dress_code")
            }
        }
        else if collectionView == secondCollectionView {
            if indexPath.row == 0 {
                // coming identifier name from initialize
                delegate?.addReservationSegue(withIdentifier: menuIdentifier ?? "")
            }
            else if indexPath.row == 1 {
                // coming identifier name from initialize
                delegate?.showDressCode(type: "menu_dress_beverages")
            }
            else if indexPath.row == 2 {
                // coming identifier name from initialize
                delegate?.showDressCode(type: "menu_dress_wine")
            }
        }
    }
}

//MARK: - UICollectionViewDataSource
extension R_ReservationDetailController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView || collectionView == secondCollectionView {
            return 3
        } else {
//            return imageCollectionData?.count ?? 1
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReservationDetailCell_1
            
            cell.img.image = FirstCollectionViewData[indexPath.row].image
            cell.label.text = FirstCollectionViewData[indexPath.row].label
            
            return cell
        } else if collectionView == secondCollectionView {
            let cell = secondCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReservationDetailCell_2
            
            cell.img.image = SecondCollectionViewData[indexPath.row].image
            cell.label.text = SecondCollectionViewData[indexPath.row].label
            
            cell.dropShadow(color: UIColor(named: "border")!, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)

            
            return cell
            
        } else {
            // for image view
            let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionCell
            // open the code at the bottom of this line
//            cell.img.image = imageCollectionData?[indexPath.row] ?? UIImage(named: "empty")
            
            cell.img.image = UIImage(named: "hotel-2")
            
            return cell
        }
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout
extension R_ReservationDetailController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        
        if collectionView == firstCollectionView {
            return CGSize(width: collectionSize.width/3 - 10, height: 60)
        } else if collectionView == secondCollectionView {
            return CGSize(width: collectionSize.width/3 - 10, height: 95)
        } else {
            // for image cell
            return CGSize(width: collectionSize.width, height: collectionSize.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == firstCollectionView {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        } else if collectionView == secondCollectionView {
            return UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
    }
    
    
}

