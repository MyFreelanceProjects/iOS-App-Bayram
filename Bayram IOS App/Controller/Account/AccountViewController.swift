//
//  AccountViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/11/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import Toast
import SwiftyJSON

class AccountViewController: UIViewController, UIPickerViewDelegate, UINavigationControllerDelegate {
    
    private var room: String           = ""
    private var check_in_date: String  = ""
    private var check_in_time: String  = ""
    private var check_out_date: String = ""
    private var check_out_time: String = ""
    private var room_class: String     = ""
    private var child_count: String    = ""
    private var baby_count: String     = ""
    private var adult_count: String    = ""
    
    @IBOutlet private weak var leftTableView: UITableView!
    @IBOutlet private weak var rightTableView: UITableView!
    
    @IBOutlet private weak var profileLabel: UILabel!
    
    @IBOutlet private weak var profileImageButton: UIButton!
    @IBOutlet private weak var profileImage: UIImageView!
    
    let alertService = AlertService()
    
    var imagePicker  = UIImagePickerController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAccountInfo()
        self.view.makeToastActivity(.center)
    }
    
    func getAccountInfo() {
        GettingUserDataFromManager.sharedInstance.decodeUserInfo { (user_data) -> Void in
            if let user_data = user_data {
                if  let auth_token = user_data.auth_token,
                    let user_id    = user_data._id,
                    let privilege  = user_data.privilege {
                    
                    // get user_data from Api
                    let params: [String: String] = [
                        "auth_token" : auth_token,
                        "user_id"    : user_id,
                        "privilege"  : privilege,
                    ]
                    
                    AccountManager.sharedInstance.getUserInfo(endpoint: "/get_account_info.php", params: params) { result in
                        switch result {
                        case .success(let json):
                            self.setupInfo(with: json[0])
                        case .failure(let error):
                            self.view.makeToast(error.localizedDescription)
                        }
                    }
                } else {
                    self.view.makeToast("Some User Info Is nil!")
                }
                
            } else {
                self.view.makeToast("Cannot get User Info!")
            }
        }
    }
    
    func configureUI() {
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        profileImage.layer.borderColor  = UIColor(named: "star_border")?.cgColor
        profileImage.layer.borderWidth  = 7
        profileImage.layer.masksToBounds = false
        profileImage.clipsToBounds = true
        
        imagePicker.delegate = self
        
        leftTableView.register(UINib(nibName: "LeftTableCell", bundle: .main), forCellReuseIdentifier: "check_in")
        
        rightTableView.register(UINib(nibName: "RightTableCell", bundle: .main), forCellReuseIdentifier: "check_out")
    }
    
    private func setupInfo(with json: JSON) {
        room           = json["room_number"].stringValue

        check_in_time  = json["check_in_time"].stringValue
        check_in_date  = check_in_time
        
        check_out_time = json["check_out_time"].stringValue
        check_out_date = check_out_time
        
        room_class     = json["room_class"].stringValue
        child_count    = json["child_count"].stringValue
        baby_count     = json["baby_count"].stringValue
        adult_count    = json["adult_count"].stringValue
                
        leftTableView.reloadData()
        rightTableView.reloadData()
        
        DispatchQueue.main.async { [self] in
            self.profileLabel.text = json["fullname"].stringValue
        }
        
        self.view.hideToastActivity()
    }
    
//  MARK: -updating profile image
    @IBAction func profileImageButtonClicked(_ sender: UIButton) {
        imagePicker.sourceType    = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    
    //MARK: - Buttons Pressed
    @IBAction func AboutButtonPressed(_ sender: UIButton) {
        let alert = alertService.info(
                                    bodyText: "\"Guest Assistant\" is hotel-guest POS and management system...",
                                    buttonTitle: "Close")
        
        present(alert, animated: true)
    }
    
    @IBAction func rateAppButtonPressed(_ sender: UIButton) { }
    
    @IBAction func signOutPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
        
        UserDefaults.standard.removeObject(forKey: "logged")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
    }
}

//MARK: - Table Cell
extension AccountViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == leftTableView ? 2 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // check cell
        if tableView == leftTableView {
            let cell = leftTableView.dequeueReusableCell(withIdentifier: "check_in", for: indexPath) as! LeftTableCell
            
            // add each value
            cell.label.text = indexPath.row == 0 ? "CHECK-IN" : "CHECK-OUT"
            cell.icon.image = indexPath.row == 0 ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "multiply.circle")
            cell.icon.tintColor = indexPath.row == 0 ? UIColor(named: "stars") : UIColor.red
            
            if indexPath.row == 0 {
                cell.date.text = check_in_date.formattedDateForAccount
                cell.time.text = check_in_time.formatterTimeForAccount
                
            } else {
                cell.date.text = check_out_date.formattedDateForAccount
                cell.time.text = check_in_time.formatterTimeForAccount
            }

            return cell
        }
        else if tableView == rightTableView {
            let cell = rightTableView.dequeueReusableCell(withIdentifier: "check_out", for: indexPath) as! RightTableCell
            print(indexPath.row)
            var textValue: String? = nil

            // add each value
            switch indexPath.row {
                case 0:
                    cell.icon.image = UIImage(named: "metro-home-account")
                    textValue = "Room: \(room)"
                case 1:
                    cell.icon.image = UIImage(named: "metro-calculator")
                    textValue = "Count: \(adult_count)+\(child_count)+\(baby_count)"
                case 2:
                    cell.icon.image = UIImage(named: "feather-star")
                    textValue = "Class: \(room_class)"
            default:
                textValue = "unknown"
            }
            cell.label.text = textValue
            return cell
        }

        return UITableViewCell()

    }
    
}

//MARK: - UIImagePickerControllerDelegate
extension AccountViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        self.view.makeToastActivity(.center)
        
        if var _image = info[.editedImage] as? UIImage {
            
//            let _image_compressed = compressImage(_image)
            
            let imagetosave = _image.jpegData(compressionQuality: 1.0)
            guard let base64encodedImage  = imagetosave?.base64EncodedString() else {
                return self.view.makeToast("Cannot getting image :(")
            }
            
            postRequestToUploadingImage(with: base64encodedImage)
            
        }
    }
    
    
    func postRequestToUploadingImage(with imagebase64String: String) {
        GettingUserDataFromManager.sharedInstance.decodeUserInfo { (user_data) -> Void in
            if let user_data = user_data {
                if  let auth_token = user_data.auth_token,
                    let user_id    = user_data._id,
                    let privilege  = user_data.privilege {
                    
                    // get user_data from Api
                    let params: [String: String] = [
                        "auth_token" : auth_token,
                        "user_id"    : user_id,
                        "encoded_image" : imagebase64String
                    ]
                    
                    print(params["auth_token"])
                    
                    AccountManager.sharedInstance.editProfileImage(endpoint: "/upload_guest_profile_image.php", params: params) { result in
                        switch result {
                        case .success(let json):
                            print(json)
                            
                        case.failure(let error):
                            print(error)
                            self.view.makeToast("\(error)")
                        }
                        
                        self.view.hideToastActivity()
                    }
                } else {
                    self.view.makeToast("Some User Info Is nil!")
                }
                
            } else {
                self.view.makeToast("Cannot get User Info!")
            }
        }
    }
}
