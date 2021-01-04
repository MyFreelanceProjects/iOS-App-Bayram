//
//  SpaReservationDetailController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/28/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SpaReservationDetailController: UIViewController {
    @IBOutlet weak var imageCollection: UICollectionView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var readMoreView: UIView!
    
    let alert = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        
        imageCollection.register(ImageCollectionCell.nib(), forCellWithReuseIdentifier: "cell")
        firstCollectionView.register(ReservationDetailCell_1.nib(), forCellWithReuseIdentifier: "cell")
    }
    
    func configureViews() {
        textView.customShadow()
        timeView.customShadow()
        readMoreView.customShadow()
    }
    
    @IBAction func readMorePressed(_ sender: UIButton) {
//        performSegue(withIdentifier: "SpaReadMore", sender: self)
    }
    
}

//MARK: - CollectionViewData
let FirstCollectionViewData2: [CollectionViewStruct] = [
    CollectionViewStruct(image: UIImage(named: "library-add"), label: "RESERVATION"),
    CollectionViewStruct(image: UIImage(named: "material-feedback"), label: "FEEDBACK"),
    CollectionViewStruct(image: UIImage(named: "material-person-pin"), label: "DRESS CODE"),
]

//MARK: - UICollectionViewDelegate

extension SpaReservationDetailController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == firstCollectionView {
            // performSegues
            navigationItem.backBarButtonItem = self.customBackButton
            if indexPath.row == 0 {
                performSegue(withIdentifier: "spaReservation", sender: self)
            }
            else if indexPath.row == 1 {
                performSegue(withIdentifier: "spaFeedback", sender: self)
            }
            else if indexPath.row == 2 {
                performSegue(withIdentifier: "SpaDressCodeController", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            navigationItem.backBarButtonItem = self.customBackButton
            if identifier == "SpaDressCodeController" {
                let destinationVC = segue.destination as! SpaDressCodeController
                destinationVC.title = "DRESS CODE"
            }
            else if identifier == "SpaReadMore" {
                let destinationVC = segue.destination as! SpaReadMore
                destinationVC.viewTitle = self.navigationItem.title
            }
        }
        
    }
}

//MARK: - UICollectionViewDataSource
extension SpaReservationDetailController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView{
            return 3
        } else {
//            return imageCollectionData?.count ?? 1
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReservationDetailCell_1
            
            cell.img.image = FirstCollectionViewData2[indexPath.row].image
            cell.label.text = FirstCollectionViewData2[indexPath.row].label
            
            return cell
        } else {
            // for image view
            let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionCell
            // open the code at the bottom of this line
//            cell.img.image = imageCollectionData?[indexPath.row] ?? UIImage(named: "empty")
            
            cell.img.image = UIImage(named: "spa-test")
            
            return cell
        }
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout
extension SpaReservationDetailController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        
        if collectionView == firstCollectionView {
            return CGSize(width: collectionSize.width/3 - 10, height: 60)
        }else {
            // for image cell
            return CGSize(width: collectionSize.width, height: collectionSize.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == firstCollectionView {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
    }
    
    
}

