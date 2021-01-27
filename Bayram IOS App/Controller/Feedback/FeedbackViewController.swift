//
//  FeedbackViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/17/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import Toast
import Alamofire
import Foundation

class FeedbackViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomFeedbackButton: UIView!
    @IBOutlet weak var BFeedbackLabel: UILabel!
    var feedbacks: Feedbacks = Feedbacks()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        getFeedbacks()
    }
    
    func configureUI() {
        tableView.register(UINib(nibName: "FeedbackViewCell", bundle: .main), forCellReuseIdentifier: "feedbackCell")
        bottomFeedbackButton.customShadow()
    }
    
    func getFeedbacks() {
        self.view.makeToastActivity(.center)
        
        let parameters: [String: String] = [
            "auth_token": "0",
            "user_id": "200051",
            "lang_index": "en",
        ]
        
        let multipartFormData: MultipartFormData = MultipartFormData()
        multipartFormData.append(Data(parameters["auth_token"]!.utf8), withName: "auth_token")
        multipartFormData.append(Data(parameters["user_id"]!.utf8), withName: "user_id")
        multipartFormData.append(Data(parameters["lang_index"]!.utf8), withName: "lang_index")

        NetworkManager().request(endpoint: "/select_my_feedbacks.php", multipartFormData: multipartFormData) { [self]response in
            self.view.hideToastActivity()

            switch response {
            case.success(let response):
                if response == 1 {
                    self.view.makeToast("Wrong Password or ID")
                } else {
                    // getting correct result
                    
                    // writing user info to FileManager
                    let jsonDecoder = JSONDecoder()
                    do {
                        let data = try response.rawData()
                        let feedbacks = try jsonDecoder.decode(Feedbacks.self, from: data)
                        self.feedbacks = feedbacks.feedback
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }

                    } catch {
                        return
                    }
                }
            
            case .failure(let error):
                self.view.makeToast(error.localizedDescription)
            }
        }
    }
}

//MARK: - UITableView DataSource and Delegate methods
extension FeedbackViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feedbackCell", for: indexPath) as? FeedbackViewCell {
            cell.feedbackTitle.text = self.feedbacks[indexPath.row].service_name
            cell.bodyText.text = self.feedbacks[indexPath.row].feedback_body

            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailFeedback", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailFeedback" {
            let vc = segue.destination as! DetailFeedbackController
        }
    }
}

// MARK: - FeedbackModel
public class Feedbacks: Codable {
    let feedback: [Feedback]
}

public class Feedback: Codable {
    let _id: String?
    let service_name: String?
    let service_type: String?
    let sub_service_type: String?
    let service_id: String?
    let service_rating: String?
    let fb_rating: String?
    let activity_rating: String?
    let feedback_body: String?
    let date_time: Date?
}
