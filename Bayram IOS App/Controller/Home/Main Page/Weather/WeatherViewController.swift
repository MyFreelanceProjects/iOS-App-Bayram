//
//  WeatherViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/11/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var nowLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var degree: UILabel!
    @IBOutlet weak var topWeatherImage: UIImageView!
    @IBOutlet weak var todayTable: UITableView!
    @IBOutlet weak var tomorrowTable: UITableView!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var tomorrowLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        todayTable.rowHeight = 100
        tomorrowTable.rowHeight = 100
        todayTable.register(WeatherCell.nib(), forCellReuseIdentifier: "cell")
        tomorrowTable.register(WeatherCell.nib(), forCellReuseIdentifier: "cell")
    }
    
    func configureUI() {
        topView.layer.cornerRadius = 50
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        topView.customBorder = 0.3
    }
}

//MARK: -
extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherCell
        
        if tableView == todayTable {
            // configure today's data
            
        } else {
            // configure tomorrow's data
            
        }
        
        return cell
    }
    
    
}
