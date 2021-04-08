//
//  ViewController.swift
//  Qgenerator
//
//  Created by Ibrahim Qaddoumi on 4/2/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var qrImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func generateAction(_ sender: Any) {
        let myName = name.text
        if let name = myName
        {
            let combinedString = "\(name)\n\(Date())"
            qrImageView.image = generateQRCode(Name: combinedString)
        }
    }
    
    func generateQRCode (Name:String) -> UIImage?
    {
        let name_data = Name.data(using:String.Encoding.ascii)
        
        if let filter = CIFilter(name:"CIQRCodeGenerator")
        {
            filter.setValue(name_data, forKey:"inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform)
            {
                return UIImage(ciImage:output)
            }
        }
        return nil
    }
    
}

