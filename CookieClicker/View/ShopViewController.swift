//
//  ShopViewControllerTableViewController.swift
//  CookieClicker
//
//  Created by Temirlan Dzodziev on 31.05.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import CoreData
protocol ShopViewControllerDelegate {
    func saveSelectImage(a: UIImage)
}

class ShopViewController: UITableViewController{
    
    var delegate: ShopViewControllerDelegate?
    
    var item = [Item]()
    
    var priceSet: [Int] = []
    var imageSet: [UIImage?] = []
    var descrip: [String?] = []
    var switchLogic = UserDefaults.standard.bool(forKey: "change")
    
   
    @IBAction func switcher(_ sender: UISwitch) {
        if sender.isOn == true{
            UserDefaults.standard.set(true, forKey: "change")
            print(switchLogic)
        }else if sender.isOn == false{
            UserDefaults.standard.set(false, forKey: "change")
            print(switchLogic)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell") as! ShopViewCell
        cell.cookieImage.image =  UIImage(data: item[indexPath.row].imageSet!)
        cell.descUILabel.text = item[indexPath.row].decsript
        cell.priceLabel?.text = String(item[indexPath.row].price)
        cell.backgroundColor = UIColor(displayP3Red: 48, green: 57, blue: 96, alpha: 0)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell") as! ShopViewCell
        
        let imageCell = UIImage(data: item[indexPath.row].imageSet!)
        
        delegate?.saveSelectImage(a: imageCell!)
        navigationController?.popViewController(animated: true)
    }
    // MARK: - Fetching Data from CoreData
    func fetchData() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let request: NSFetchRequest<Item> = Item.fetchRequest()
            request.returnsObjectsAsFaults = false
            do {
                let result = try context.fetch(request)
                item = result
            } catch{
                print("Error with fetching data")
            }
        }
    }
    
    
    
}

