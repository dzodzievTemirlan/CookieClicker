//
//  SecondViewController.swift
//  CookieClicker
//
//  Created by Temirlan Dzodziev on 29.05.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import RxSwift

class SecondViewController: UIViewController {
    @IBOutlet weak var UILabel: UILabel!
    @IBOutlet weak var CookieImage: UIImageView!
    var count:Int = 0
    var val: Int = 0
    
    let userDefault = UserDefaults()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        val = userDefault.integer(forKey: "Value")
        
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        cookieCounter()
        
    }
    
    func cookieCounter(){
        
        count += 1
        
        
        let counter = Observable
            .of(count)
            .subscribe({ event in
                if let valIn = event.element{
                    //                    self.userDefault.set(valIn, forKey: "Value")
                    self.UILabel.text = String(valIn)
                }
            })
        UIView.animate(withDuration: 0.95) {
            self.CookieImage.frame = CGRect(x: 173, y:50 ,width: 10, height: 10)
            self.UILabel.frame = CGRect(x: 173, y:150 ,width: 50, height: 100)
        }
        
        CookieImage.layer.shadowOffset = CGSize(width: 3.0, height: 5.0)
        CookieImage.layer.shadowOpacity = 0.5
        CookieImage.layer.shadowRadius = 2
        
        UILabel.layer.shadowOffset = CGSize(width: 3.0, height: 5.0)
        UILabel.layer.shadowOpacity = 0.5
        UILabel.layer.shadowRadius = 2
    }
}



