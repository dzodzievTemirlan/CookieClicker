//
//  ViewController.swift
//  CookieClicker
//
//  Created by Temirlan Dzodziev on 28.05.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

private enum Keys: String{
    case userResult
}

class ViewController: UIViewController {
    
    let userDefault = UserDefaults.standard
    @IBOutlet weak var UILabel: UILabel!
    @IBOutlet weak var CookieImage: UIImageView!
    @IBOutlet weak var UIButton: UIButton!
    @IBOutlet weak var nextViewButton: UIButton!
    
    
    
    var counter: Int = 0{
        willSet(someValue){
            if someValue % 2 == 0{
            animate()
            }
        }
        
        didSet{
            UILabel.text = String(counter)
            userDefault.set(counter, forKey: Keys.userResult.rawValue)
        }
    }
//    private let navColor = UIColor(red: 48, green: 57, blue: 86, alpha: 100)
//
//    override func viewWillAppear(_ animated: Bool) {
//           guard let navBar = navigationController?.navigationBar else {
//               fatalError("Navigation controller does not exist")
//           }
//        navBar.backgroundColor = navColor
//       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = userDefault.integer(forKey: Keys.userResult.rawValue)
    }
    
    
    @IBAction func UIButtonPressed(_ sender: UIButton) {
        
        counter += 1
        
    }
    
    func animate(){
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
        
        nextViewButton.layer.shadowOffset = CGSize(width: 2.0, height: 5.0)
        nextViewButton.layer.shadowOpacity = 0.5
        nextViewButton.layer.shadowRadius = 2
    }
}



