//
//  RoomServiceView.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/3/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class RoomServiceView: UIViewController {
    @IBOutlet weak var orderButtonView: UIView!
    @IBOutlet weak var cleanButtonView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var cleanLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    
    let alert = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Room service".uppercased()
        
        configureUI()
    }
    
    func configureUI() {
        firstCollectionView.register(ReservationDetailCell_1.nib(), forCellWithReuseIdentifier: "cell")
        
        textView.customShadow()
        timeView.customShadow()
        orderButtonView.customShadow()
        cleanButtonView.customShadow()
        orderButtonView.cornerRadius = 5
        cleanButtonView.cornerRadius = 5
    }
    
    @IBAction func orderPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showRoomServiceOrder", sender: self)
    }
    
    @IBAction func cleanPressed(_ sender: UIButton) {
        let alertVC = alert.confirmation(buttonFirst: "NO",
                                         buttonSecond: "YES",
                                         buttonTextHidden: true
                                         ) {
                                            print("completed")
        }
        
        present(alertVC, animated: true)
    }
}


//MARK: - CollectionViewData
let FirstCollectionViewData5: [CollectionViewStruct] = [
    CollectionViewStruct(image: UIImage(named: "mini-bar"), label: "MINI-BAR"),
    CollectionViewStruct(image: UIImage(named: "material-feedback"), label: "FEEDBACK"),
]

//MARK: - UICollectionViewDelegate9

extension RoomServiceView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == firstCollectionView {
            // performSegues
            navigationItem.backBarButtonItem = self.customBackButton
            if indexPath.row == 0 {
                // set miniBar alert
                let alertVC = alert.confirmation(bodyText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the. ",
                                                 buttonFirst: "CLOSE",
                                                 buttonSecond: "ACCEPT") {
                                                    print("completed")
                }
                
                present(alertVC, animated: true)
                
            }
            else if indexPath.row == 1 {
                performSegue(withIdentifier: "showRoomServiceFeedback", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            navigationItem.backBarButtonItem = self.customBackButton
            
            
        }
        
    }
}

//MARK: - UICollectionViewDataSource
extension RoomServiceView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FirstCollectionViewData5.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReservationDetailCell_1
        
        cell.img.image = FirstCollectionViewData5[indexPath.row].image
        cell.label.text = FirstCollectionViewData5[indexPath.row].label
        
        return cell
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout
extension RoomServiceView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        
        if collectionView == firstCollectionView {
            return CGSize(width: collectionSize.width/2 - 20, height: 60)
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

