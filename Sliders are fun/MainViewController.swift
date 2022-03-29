//
//  MainViewController.swift
//  Sliders are fun
//
//  Created by катя on 28.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColorValue(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class MainViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    private var redBackgroundColor: CGFloat = 0.7
    private var greenBackGroundColor: CGFloat = 0.5
    private var blueBackGroundColor: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor(
            red: redBackgroundColor,
            green: greenBackGroundColor,
            blue: blueBackGroundColor
        )
    }
    
    private func setBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        mainView.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.redBackgroundColor = redBackgroundColor
        settingsVC.greenBackGroundColor = greenBackGroundColor
        settingsVC.blueBackGroundColor = blueBackGroundColor
        settingsVC.delegate = self
        print(111)
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewColorValue(red: CGFloat, green: CGFloat, blue: CGFloat) {
        redBackgroundColor = red
        greenBackGroundColor = green
        blueBackGroundColor = blue
        
        setBackgroundColor(red: red, green: green, blue: blue)
    }
}
