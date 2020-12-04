//
//  ServiceView3.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/2/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ServiceView3: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    
    
    let alert = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Other Service 3".uppercased()
        
        firstCollectionView.register(ReservationDetailCell_1.nib(), forCellWithReuseIdentifier: "cell")
    }
    
    @IBAction func readMorePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "OtherSMore", sender: self)
    }
    
}

//MARK: - CollectionViewData
let FirstCollectionViewData4: [CollectionViewStruct] = [
    CollectionViewStruct(image: UIImage(named: "reservationTime"), label: "09:00-20:00"),
    CollectionViewStruct(image: UIImage(named: "material-feedback"), label: "FEEDBACK"),
]

//MARK: - UICollectionViewDelegate

extension ServiceView3: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            performSegue(withIdentifier: "showOtherSFeedback", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            navigationItem.backBarButtonItem = self.customBackButton
           
            switch identifier {
                case "OtherSMore":
                        let destinationVC = segue.destination as! OtherSReadMore
                        
                        destinationVC.viewTitle = self.title!
                
                case "showOtherSFeedback":
                    let destinationVC = segue.destination as! OtherSFeedback
                default:
                    return
            }
        }
    }
}

//MARK: - UICollectionViewDataSource
extension ServiceView3: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return FirstCollectionViewData4.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReservationDetailCell_1
        
        cell.img.image = FirstCollectionViewData4[indexPath.row].image
        cell.label.text = FirstCollectionViewData4[indexPath.row].label
        
        return cell
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout
extension ServiceView3: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        
        return CGSize(width: collectionSize.width/3 - 10, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let collectionSize = collectionView.frame.size
        
        return UIEdgeInsets(top: 0, left: collectionSize.width/3 - 40, bottom: 0, right: 0)
    }
    
}

