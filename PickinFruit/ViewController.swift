//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fruitPicker.delegate = self
        self.fruitPicker.dataSource = self
        
        self.fruitPicker.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.fruitsArray[row % self.fruitsArray.count]
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        
        let randomFruit1 = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        let randomFruit2 = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        let randomFruit3 = Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
        
        self.fruitPicker.selectRow(randomFruit1, inComponent: 0, animated: true)
        self.fruitPicker.selectRow(randomFruit2, inComponent: 1, animated: true)
        self.fruitPicker.selectRow(randomFruit3, inComponent: 2, animated: true)
        
        let firstRow = self.fruitPicker.selectedRowInComponent(0)
        let secondRow = self.fruitPicker.selectedRowInComponent(1)
        let thirdRow = self.fruitPicker.selectedRowInComponent(2)
        
        
        if (firstRow == secondRow) && (secondRow == thirdRow) {
            
            self.resultLabel.text = "WINNER!"
            
        } else {
            
            self.resultLabel.text = "TRY AGAIN"
        }
    }
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton() {
        
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



