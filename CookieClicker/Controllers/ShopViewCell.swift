//
//  ShopViewCell.swift
//  CookieClicker
//
//  Created by Temirlan Dzodziev on 31.05.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class ShopViewCell: UITableViewCell {
    @IBOutlet weak var cookieImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descUILabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func prepareForReuse() {
        
//                super.prepareForReuse()
        //        cookieImage.image = nil
        //        priceLabel.text = nil
        //        descUILabel.text = nil
        if UserDefaults.standard.bool(forKey: "change"){
            cookieImage.isHidden = false
            descUILabel.isHidden = true
//            descUILabel.text = nil
            priceLabel.isHidden = false
//            priceLabel.text = nil
            super.prepareForReuse()
            
        }else{
            cookieImage.isHidden = false
            descUILabel.isHidden = true
            priceLabel.isHidden = false
            super.prepareForReuse()
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
