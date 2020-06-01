//
//  ViewController.swift
//  CookieClicker
//
//  Created by Temirlan Dzodziev on 28.05.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import CoreData

private enum Keys: String{
    case userResult
}
class ViewController: UIViewController {
    
    let imageArray: [UIImage?] = [UIImage(named: "cookie-1"),
                                  UIImage(named: "cookie-2"),
                                  UIImage(named: "cookie-3"),
                                  UIImage(named: "cookie-4"),
                                  UIImage(named: "cookie-5"),
                                  UIImage(named: "cookie-6"),
                                  UIImage(named: "cookie-7"),
                                  UIImage(named: "cookie-8"),
                                  UIImage(named: "cookie-9"),
                                  UIImage(named: "cookie-10"),
                                  UIImage(named: "cookie-11"),
                                  UIImage(named: "cookie-12") ]
    
    let price = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    
    let desct = ["Печенька№1",
                 "Печенька№2",
                 "Печенька№3",
                 "Печенька№4",
                 "Печенька№5",
                 "Печенька№6",
                 "Печенька№7",
                 "Печенька№8",
                 "Печенька№9",
                 "Печенька№10",
                 "Печенька№11",
                 "Печенька№12"]
    
    
    
    let userDefault = UserDefaults.standard
    var delegate: ViewController?
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var cookieImage: UIImageView!
    @IBOutlet weak var cookieButton: UIButton!
    @IBOutlet weak var nextViewButton: UIButton!
    
    
    
    
    var counter: Int = 0{
        willSet(someValue){
            if someValue % 2 == 0{
                animate()
            }
        }
        
        didSet{
            counterLabel.text = String(counter)
            userDefault.set(counter, forKey: Keys.userResult.rawValue)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        fetchLastImage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = userDefault.integer(forKey: Keys.userResult.rawValue)
        navBarCustom()
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        if UserDefaults.standard.bool(forKey: "isStarted") {
            print("Already started")
            
        }else {
            print("Started first ")
            for i in imageArray.indices{
                saveData(oneItemImage: imageArray[i]!, OnePriceItem: price[i], descrip: desct[i])
            }
            UserDefaults.standard.set(true, forKey: "isStarted")
        }
        
        
    }
    
    @IBAction func shopButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    @IBAction func cookieButtonPressed(_ sender: UIButton) {
        counter += 1
    }
    
    func animate(){
        UIView.animate(withDuration: 0.95) {
            self.cookieImage.frame = CGRect(x: 173, y:50 ,width: 10, height: 10)
            self.counterLabel.frame = CGRect(x: 173, y:150 ,width: 50, height: 100)
        }
        cookieImage.layer.shadowOffset = CGSize(width: 3.0, height: 5.0)
        cookieImage.layer.shadowOpacity = 0.5
        cookieImage.layer.shadowRadius = 2
        
        counterLabel.layer.shadowOffset = CGSize(width: 3.0, height: 5.0)
        counterLabel.layer.shadowOpacity = 0.5
        counterLabel.layer.shadowRadius = 2
        
        nextViewButton.layer.shadowOffset = CGSize(width: 2.0, height: 5.0)
        nextViewButton.layer.shadowOpacity = 0.5
        nextViewButton.layer.shadowRadius = 2
    }
    
    func navBarCustom(){
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    // MARK: - Save data to CoreData
    
    func saveData(oneItemImage: UIImage, OnePriceItem: Int, descrip: String){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            //            let itemsSet = TableViewItems(imageArray: imageArray, price: price)
            let newItem = Item(context: context)
            //            for index in itemsSet.priceItem{
            //                newItem.price = Int32(index)
            //            }
            //            for index in itemsSet.imageItem{
            //                newItem.imageSet = index?.pngData() as Data?
            //            }
            newItem.price = Int32(OnePriceItem)
            newItem.imageSet = oneItemImage.pngData() as Data?
            newItem.decsript = descrip
            
            
            do{
                try context.save()
                print("Save successfully")
            }catch{
                print("Error save")
            }
            
            
            
        }
        
    }
    
    
}

extension ViewController: ShopViewControllerDelegate{
    
    func saveSelectImage(a: UIImage) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let lastImages = LastImage(context: context)
            lastImages.imageLast = a.pngData() as Data?
            do{
                try context.save()
                print("Картинка сохранилась")
            }catch{
                print("Error with save image")
            }
        }
    }
    func fetchLastImage(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let request: NSFetchRequest<LastImage> = LastImage.fetchRequest()
            request.returnsObjectsAsFaults = false
            do {
                let result = try context.fetch(request)
                for data in result{
                    let image = data.value(forKey: "imageLast") as! Data
                    cookieImage.image = UIImage(data: image)
                }
            }catch{
                print("Error with fetching data")
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shopviewSegue"{
            
            let destinationVC = segue.destination as! ShopViewController
            destinationVC.delegate = self
        }
    }
    
}




