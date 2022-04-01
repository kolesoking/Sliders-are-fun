//
//  MainViewController.swift
//  Sliders are fun
//
//  Created by катя on 28.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColorValue(_ color: UIColor)
}

class MainViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setBackgroundColor(_ color: UIColor) {
        mainView.backgroundColor = color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.currentColor = CIColor(color: mainView.backgroundColor ?? .red)
        settingsVC.delegate = self
        print(111)
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewColorValue(_ color: UIColor) {
        mainView.backgroundColor = color
        setBackgroundColor(color)
    }
}
