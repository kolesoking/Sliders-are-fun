//
//  ViewController.swift
//  Sliders are fun
//
//  Created by катя on 16.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Red Slider
        sliderRed.value = 1
        sliderRed.minimumValue = 0
        sliderRed.maximumValue = 1
        sliderRed.minimumTrackTintColor = .red
        
        //MARK: - Green Slider
        sliderGreen.value = 1
        sliderGreen.minimumValue = 0
        sliderGreen.maximumValue = 1
        sliderGreen.minimumTrackTintColor = .green
        
        //MARK: - Blue Slider
        sliderBlue.value = 1
        sliderBlue.minimumValue = 0
        sliderBlue.maximumValue = 1
        sliderBlue.minimumTrackTintColor = .blue
        
        //MARK: - View
        viewColorRGB.layer.cornerRadius = 15
        

    }

    //MARK: - Passing value in label
   
    @IBAction func passingValueFromRedSlider() {
        redColorValue.text = String(format: "%.2f", sliderRed.value)
        viewColorRGB.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
    
    
    @IBAction func passingValueFromGreenSlider() {
        greenColorValue.text = String(format: "%.2f", sliderGreen.value)
        viewColorRGB.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
    
    
    @IBAction func passingValueFromBlueSlider() {
        blueColorValue.text = String(format: "%.2f", sliderBlue.value)
        viewColorRGB.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
}

