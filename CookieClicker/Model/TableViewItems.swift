//
//  TableViewItems.swift
//  CookieClicker
//
//  Created by Temirlan Dzodziev on 31.05.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation
import UIKit

class TableViewItems {
    

        
    var imageItem: [UIImage?]
    var priceItem: [Int]
    
    
    init(imageArray: [UIImage?], price: [Int]) {
        
        
//        for index in imageArray{
            self.imageItem = imageArray
//        }
//        for index in price{
            self.priceItem = price
//        }
        
    }
    
}
    

