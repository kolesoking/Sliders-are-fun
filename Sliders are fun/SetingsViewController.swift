//
//  ViewController.swift
//  Sliders are fun
//
//  Created by катя on 16.03.2022.
//

import UIKit

class SetingsViewController: UIViewController {
    
    //MARK: - Views
    @IBOutlet weak var viewColorRGB: UIView!
    
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

        //MARK: - View Value
        viewColorRGB.layer.cornerRadius = 15
        
        
        //MARK: - Sliders Value
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
        
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
    
    //MARK: - Passing value in label
   
    @IBAction func passingValueFromRedSlider() {
        redColorValue.text = sliderStringValue(with: sliderRed)
        redTextField.text = sliderStringValue(with: sliderRed)
        setBackgroundColor()
        print(viewColorRGB.backgroundColor ?? 111)
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
    
    //MARK: - Private func
    
    private func setBackgroundColor() {
        viewColorRGB.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
    
//    private func
    
    private func sliderStringValue(with value: UISlider) -> String {
        String(format: "%.2f", value.value)
    }
    
}

