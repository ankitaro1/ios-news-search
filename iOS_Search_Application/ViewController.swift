//
//  ViewController.swift
//  iOS_Search_Application
//
//  Created by Ankit sharma7 on 13/09/21.
//

import UIKit

public class ViewController: UIViewController {

    @IBOutlet public var enterNewsButton: UIButton?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.enterNewsButton?.layer.borderWidth = CGFloat(1)
        self.enterNewsButton?.layer.borderColor =  UIColor.white.cgColor
        self.enterNewsButton?.layer.cornerRadius = CGFloat(12)
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func enterNewsButtonAction(_ sender: Any) {
        let targetVC = ABCNewsViewController()
        self.navigationController?.pushViewController(targetVC, animated: false)
    }
    
}

