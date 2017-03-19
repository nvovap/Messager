//
//  MyImageView.swift
//  MoveSHT
//
//  Created by Vladimir Nevinniy on 12/26/16.
//  Copyright © 2016 Vladimir Nevinniy. All rights reserved.
//

import UIKit


enum TypeStop : Int {
    case one = 0
    case few
}

enum TypePackage: Int {
    case one = 0
    case few
}

class Coordinate {
    var latitude: Double = 0
    var longitude: Double = 0
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}


extension UIImage{
    
    func resizeImageWith(newSize: CGSize) -> UIImage {
        
        var newImage = self
        
        let horizontalRatio = newSize.width / size.width
        let verticalRatio = newSize.height / size.height
        
        let ratio = max(horizontalRatio, verticalRatio)
        if ratio < 1 {
            let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
            UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
            draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        
        return newImage
    }
    
    
}

//@IBDesignable
class MyImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var incorrect: Bool = false 
    
    
    override func awakeFromNib() {
        self.layoutIfNeeded()
        layer.cornerRadius = self.frame.height / 2.0
        layer.masksToBounds = true
        
        if incorrect {
//            let layerIncorrect = CALayer(layer: layer)
//            layerIncorrect.bounds = CGRect(x: 0, y: 0, width: layer.bounds.width+5, height: layer.bounds.height+5)
//            layerIncorrect.position = CGPoint(x: layer.position.x-5, y: layer.position.y - 5)
//            
//            layerIncorrect.backgroundColor = UIColor.red.cgColor
//            
//            layer.insertSublayer(layerIncorrect, at: 0)
            
            
        }
    }
    

}

//@IBDesignable
class MyLabel: UILabel {
    
    var nameCustomFont: String = "BebasNeue"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let font = UIFont(name: nameCustomFont, size: self.font.pointSize) {
            self.font = font
        }
        
        
    }
    
    
}

//@IBDesignable
class MyButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = layer.frame.height / 2
        layer.masksToBounds = true
    }
    
    
}

//@IBDesignable
class MyPickerView: UIPickerView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 5
    }    
}

//@IBDesignable
class MyButton2: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    //Normal state bg and border
    @IBInspectable var normalBorderColor: UIColor? {
        didSet {
            layer.borderColor = normalBorderColor?.cgColor
        }
    }
    
    @IBInspectable var normalBackgroundColor: UIColor? {
        didSet {
            setBgColorForState(color: normalBackgroundColor, forState: .normal)
        }
    }
    
    
    //Highlighted state bg and border
    @IBInspectable var highlightedBorderColor: UIColor?
    
    @IBInspectable var highlightedBackgroundColor: UIColor? {
        didSet {
            setBgColorForState(color: highlightedBackgroundColor, forState: .selected)
        }
    }
    
    
    private func setBgColorForState(color: UIColor?, forState: UIControlState){
        if color != nil {
            setBackgroundImage(UIImage.imageWithColor(color: color!), for: forState)
            
        } else {
            setBackgroundImage(nil, for: forState)
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = layer.frame.height / 2
        clipsToBounds = true
        
        if borderWidth > 0 {
            if state == .normal && layer.borderColor == normalBorderColor?.cgColor {
                layer.borderColor = normalBorderColor?.cgColor
            } else if state == .highlighted && highlightedBorderColor != nil{
                layer.borderColor = highlightedBorderColor!.cgColor
            }
        }
    }
    
    
}

//+19293535550

extension UIImage {
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)     // (0, 0, 1, 1)
        
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 1.0)
        color.setFill()
        UIRectFill(rect)
        
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}


//@IBDesignable
class MyTextView: UITextView {
    
    override func awakeFromNib() {
        self.layoutIfNeeded()
        layer.cornerRadius = self.frame.height / 6
        layer.masksToBounds = true
    }
    
    
}

//@IBDesignable
class MyTextField: UITextField, UITextFieldDelegate {
    
    override func awakeFromNib() {
        self.layoutIfNeeded()
        layer.cornerRadius = self.frame.height / 2.0
        layer.masksToBounds = true
    }

    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x-4, y: self.center.y))
        animation.toValue   = NSValue(cgPoint: CGPoint(x: self.center.x+4, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }

    
    
}
