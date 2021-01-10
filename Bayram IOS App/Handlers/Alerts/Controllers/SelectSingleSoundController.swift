//
//  SelectSingleSoundController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/19/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import AudioToolbox

class SelectSingleSoundController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var alertButton: UIButton!
    
    var setButtonName: String?
    var buttonAction: (() -> Void)?
    
    private var soundList: [String] = []
    private let soundDirectory = "/System/Library/Audio/UISounds"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure() {
        self.alertButton.setTitle(setButtonName, for: .normal)
        
        soundList = FileManager.default.enumerator(atPath: soundDirectory)!.map { String(describing: $0) }
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        dismiss(animated: true)
    }

}

//MARK: -  UIPickerViewDataSource, UIPickerViewDelegate

extension SelectSingleSoundController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return soundList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let soundFileName = soundList[row]
        let fullyQualifiedName = soundDirectory + "/" + soundFileName
        let url = URL(fileURLWithPath: fullyQualifiedName)

        var soundId: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(url as CFURL, &soundId)
        return "\(soundFileName)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let soundFileName = soundList[row]
        let fullyQualifiedName = soundDirectory + "/" + soundFileName
        let url = URL(fileURLWithPath: fullyQualifiedName)
        var soundId: SystemSoundID = 0
        
        AudioServicesCreateSystemSoundID(url as CFURL, &soundId)

        AudioServicesPlaySystemSound(soundId)
    }
}
