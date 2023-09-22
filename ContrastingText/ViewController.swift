//
//  ViewController.swift
//  ContrastingText
//
//  Created by Sreekuttan D on 22/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        set(color: UIColor(named: "sampleColor")!)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        view.addGestureRecognizer(tap)
    }
    
    fileprivate func set(color: UIColor) {
        view.backgroundColor = color
        sampleLabel.textColor = color.contrastingColor()
    }
    
    @objc fileprivate func onTap() {
        let newColor = UIColor(light: .random,
                               dark: .random)
        set(color: newColor)
    }
}


