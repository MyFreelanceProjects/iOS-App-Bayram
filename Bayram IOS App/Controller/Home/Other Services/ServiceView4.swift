//
//  ServiceView4.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/2/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ServiceView4: UIViewController {
    @IBOutlet weak var imageCollection: UICollectionView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var readMoreView: UIView!
    
    let alert = AlertService()
    
    var viewTitle: String = "Other Service 4" {
        didSet {
            self.title = viewTitle.uppercased()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        
        imageCollection.register(ImageCollectionCell.nib(), forCellWithReuseIdentifier: "cell")
        firstCollectionView.register(ReservationDetailCell_1.nib(), forCellWithReuseIdentifier: "cell")
    }
    
    func configureViews() {
        textView.customShadow()
    }
    
    @IBAction func readMorePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "OtherSMore", sender: self)
    }
    
}

//MARK: - CollectionViewData
let FirstCollectionViewData3: [CollectionViewStruct] = [
    CollectionViewStruct(image: UIImage(named: "library-add"), label: "RESERVATION"),
    CollectionViewStruct(image: UIImage(named: "material-feedback"), label: "FEEDBACK"),
    CollectionViewStruct(image: UIImage(named: "material-person-pin"), label: "DRESS CODE"),
]

//MARK: - UICollectionViewDelegate

extension ServiceView4: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == firstCollectionView {
            // performSegues
            navigationItem.backBarButtonItem = self.customBackButton
            if indexPath.row == 0 {
                performSegue(withIdentifier: "showOtherSReservation", sender: self)
            }
            else if indexPath.row == 1 {
                performSegue(withIdentifier: "showOtherSFeedback", sender: self)
            }
            else if indexPath.row == 2 {
                performSegue(withIdentifier: "showOtherSDressCode", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            navigationItem.backBarButtonItem = self.customBackButton
            
            switch identifier {
                case "OtherSMore":
                    let destinationVC = segue.destination as! OtherSReadMore
                    destinationVC.viewTitle = self.navigationItem.title!
                
                default:
                    return
            }
        }
        
    }
}

//MARK: - UICollectionViewDataSource
extension ServiceView4: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FirstCollectionViewData3.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReservationDetailCell_1
            
            cell.img.image = FirstCollectionViewData3[indexPath.row].image
            cell.label.text = FirstCollectionViewData3[indexPath.row].label
            
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
extension ServiceView4: UICollectionViewDelegateFlowLayout {
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

