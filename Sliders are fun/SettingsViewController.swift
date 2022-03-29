//
//  SettingsViewController.swift
//  Sliders are fun
//
//  Created by катя on 28.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    //MARK: - Views
    @IBOutlet weak var viewColorRGB: UIView!
    
    //MARK: - Background Colors
    var redBackgroundColor: CGFloat!
    var greenBackGroundColor: CGFloat!
    var blueBackGroundColor: CGFloat!
    
    //MARK: - Delegate
    var delegate: SettingsViewControllerDelegate!
    
    //MARK: - Sliders
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    //MARK: - Labels
    @IBOutlet weak var redColorValue: UILabel!
    @IBOutlet weak var greenColorValue: UILabel!
    @IBOutlet weak var blueColorValue: UILabel!
    
    //MARK: - Tex Fields
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self

        //MARK: - View Value
        viewColorRGB.layer.cornerRadius = 15
        
        //MARK: - Sliders Value
        sliderRed.value = Float(redBackgroundColor)
        sliderRed.minimumTrackTintColor = .red
        
        sliderGreen.value = Float(greenBackGroundColor)
        sliderGreen.minimumTrackTintColor = .green
        
        sliderBlue.value = Float(blueBackGroundColor)
        
        //MARK: - Text Fields Value
        redTextField.text = sliderStringValue(with: sliderRed)
        greenTextField.text = sliderStringValue(with: sliderGreen)
        blueTextField.text = sliderStringValue(with: sliderBlue)
        
        //MARK: - Labels Value
        redColorValue.text = sliderStringValue(with: sliderRed)
        greenColorValue.text = sliderStringValue(with: sliderGreen)
        blueColorValue.text = sliderStringValue(with: sliderBlue)
        
        //MARK: - Color View
        viewColorRGB.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
    
    //MARK: - Passing value in label and text field
    
    @IBAction func passingValueFromRedSlider() {
        redColorValue.text = sliderStringValue(with: sliderRed)
        redTextField.text = sliderStringValue(with: sliderRed)
        setBackgroundColor()
    }


    @IBAction func passingValueFromGreenSlider() {
        greenColorValue.text = sliderStringValue(with: sliderGreen)
        greenTextField.text = sliderStringValue(with: sliderGreen)
        setBackgroundColor()
    }


    @IBAction func passingValueFromBlueSlider() {
        blueColorValue.text = sliderStringValue(with: sliderBlue)
        blueTextField.text = sliderStringValue(with: sliderBlue)
        setBackgroundColor()
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        delegate.setNewColorValue(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value)
        )
        dismiss(animated: true)
    }
    
    //MARK: - Private func
    
    private func setBackgroundColor() {
        viewColorRGB.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
    
    private func sliderStringValue(with value: UISlider) -> String {
        String(format: "%.2f", value.value)
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == redTextField {
            if let floatValue = Float(textField.text ?? ""), floatValue <= 1 {
                sliderRed.value = Float(floatValue)
                redColorValue.text = sliderStringValue(with: sliderRed)
                greenTextField.becomeFirstResponder()
            } else {
                showAlert(with: "Не", and: "формат")
                textField.text = sliderStringValue(with: sliderRed)
            }
            
            setBackgroundColor()
        } else if textField == greenTextField {
            if let floatValue = Float(textField.text ?? ""), floatValue <= 1 {
                sliderGreen.value = Float(textField.text ?? "") ?? Float(0.1)
                greenColorValue.text = sliderStringValue(with: sliderGreen)
                blueTextField.becomeFirstResponder()
            } else {
                showAlert(with: "Не", and: "формат")
                textField.text = sliderStringValue(with: sliderGreen)
            }
            setBackgroundColor()
        } else {
            if let floatValue = Float(textField.text ?? ""), floatValue <= 1 {
                sliderBlue.value = Float(textField.text ?? "") ?? Float(0.1)
                blueColorValue.text = sliderStringValue(with: sliderBlue)
                setBackgroundColor()
            } else {
                showAlert(with: "Не", and: "формат")
                textField.text = sliderStringValue(with: sliderBlue)
            }
        }
        return true
    }
}

extension SettingsViewController {
    func showAlert(with title: String, and massage: String) {
        let alert = UIAlertController(
            title: title,
            message: massage,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

