//
//  ConcertDetailController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/6/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ConcertDetailController: UIViewController {
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var openingTime: UILabel!
    @IBOutlet weak var closingTime: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewTitle: String = "" {
        didSet {
            self.title = viewTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        tableView.register(EventsAndActivitiesCell.nib(), forCellReuseIdentifier: "cell")
        firstCollectionView.register(ReservationDetailCell_1.nib(), forCellWithReuseIdentifier: "cell")
        tableView.rowHeight = 250
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        menuView.addGestureRecognizer(tap)
    }
    
    func configureUI() {
        menuView.dropShadowView(color: .black, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        timeView.dropShadowView(color: .black, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
    }
    
    // - get menu
    
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer?) {
        performSegue(withIdentifier: "showConcertSingleMenu", sender: self)
    }
}


//MARK: - UITableViewDelegate, UITableViewDataSource

extension ConcertDetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventsAndActivitiesCell

        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        if let identifier = segue.identifier {
            navigationItem.backBarButtonItem = self.customBackButton
         
            switch identifier {
                case "showConcertDressCode":
                    let destinationVC = segue.destination as! ConcertDressCode
                    destinationVC.codeTitle = "DRESS CODE"
                
                default:
                    return
            }
        }
        
    }
    
}

//MARK: - UICollectionViewDelegate

extension ConcertDetailController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == firstCollectionView {
            // performSegues
            navigationItem.backBarButtonItem = self.customBackButton
            if indexPath.row == 0 {
                performSegue(withIdentifier: "showConcertReservation", sender: self)
            }
            else if indexPath.row == 1 {
                performSegue(withIdentifier: "showConcertFeedback", sender: self)
            }
            else if indexPath.row == 2 {
                performSegue(withIdentifier: "showConcertDressCode", sender: self)
            }
        }
    }
}

//MARK: - UICollectionViewDataSource
extension ConcertDetailController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FirstCollectionViewData3.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReservationDetailCell_1
        
        cell.img.image = FirstCollectionViewData3[indexPath.row].image
        cell.label.text = FirstCollectionViewData3[indexPath.row].label
        
        return cell
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout
extension ConcertDetailController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        
        return CGSize(width: collectionSize.width/3 - 10, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
    }
    
    
}

