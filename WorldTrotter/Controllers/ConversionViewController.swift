//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Guled Ali on 2/5/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//
import UIKit

class ConversionViewController: UIViewController,UITextFieldDelegate {
    
    //The label that display the celsius
    @IBOutlet weak private var celsiusLabel: UILabel!
    //The textfield that takes the user input
    @IBOutlet weak private var textField: UITextField!
    
  
 /*
     Updates the celsius label when the farenheit value is set
     to celsius
  */
        private  var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    // Returns the converted celsius value
   private var celsiusValue: Measurement<UnitTemperature>? {
        if let fahreneitValue = fahrenheitValue {
            return fahreneitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }

    /*
    
     Returns: If the existing string has a decimal separator and replacement string has
      decimal separator.
     
     Returns only one decimal
     
    */
       private func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replaceTextHasDecimalSeparator = string.range(of: ".")
       
    
            if existingTextHasDecimalSeparator != nil, replaceTextHasDecimalSeparator != nil {
                
                return false
            } else {
                return true
            }
  
        }
    
    func darkMode() {
        
        let darkColor = UIColor(red: 51/255, green: 52/255, blue: 50/255, alpha: 1.0)
        let black = UIColor.black
        let greyColor = UIColor(red: 238/255, green: 240/255, blue: 239/255, alpha: 1.0)
        
        let hour = NSCalendar.current.component(.hour, from: NSDate() as Date)
        
        switch hour
        {
        // hours 1 to 6
        case 1...25:
            view.backgroundColor = darkColor
            break
        // hours 7 to 18
        case 26...48:
            view.backgroundColor = greyColor
            break
        //hours 19 to 23 and 0
        case 49...60:
            view.backgroundColor = darkColor
            break
        default:
            view.backgroundColor = black
        }
    }
    

// Calling the update celsius lable once the view is loaded.
override func viewDidLoad() {
    super.viewDidLoad()
    updateCelsiusLabel()
    darkMode()
    
}

    
    //Formates the numbers with 0 as minimum digits and 1 as the maximunm digits.
private let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
    
}()


// When textfield is changed it gets it value and assigns to fahrenheit
@IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    if let text = textField.text, let value = Double(text) {
        fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    } else {
        
        fahrenheitValue = nil
        
    }
}
    
    

    
    //Updating the celsius label once it recieves value
private func updateCelsiusLabel() {
    
    if let celsiusValue = celsiusValue {
        
        celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        
    }
    else {
        celsiusLabel.text = "???"
    }
}

//Dismissing the keyboard once the superview is tapped using gesture recognizer
@IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    textField.resignFirstResponder()
}
    
//Displaying an alert once the textfield recieves value of less than 25.0 degrees
func textFieldDidEndEditing(_ textField: UITextField) {
    let temp = fahrenheitValue?.value
    
    
    if let t = temp, t < 25.0 {
        let alert = UIAlertController(title: "Brrr!", message: "\(t)F is cold", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}



}
