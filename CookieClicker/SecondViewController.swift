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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        cookieCounter()
        
        
        
    }
    
    func cookieCounter(){
        
        count += 1
        
        let counter = Observable
            .of(count)
            .subscribe({ event in
                
            })
        
        
        
        
    }
    
}

