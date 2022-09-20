//
//  ViewController.swift
//  CafeMiniApp
//
//  Created by MAX WIDHALM on 9/16/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cafeLabelOutlet: UILabel!
    @IBOutlet weak var itemTextViewOutlet: UITextView!
    @IBOutlet weak var priceTextViewOutlet: UITextView!
    
    @IBOutlet weak var itemSortButtonOutlet: UIButton!
    @IBOutlet weak var priceSortButtonOutlet: UIButton!
    
    @IBOutlet weak var enterItemTextFieldOutlet: UITextField!
    @IBOutlet weak var errorLabelOutlet: UILabel!
    @IBOutlet weak var submitItemButtonOutlet: UIButton!
    
    @IBOutlet weak var orderTextViewOutlet: UITextView!
    @IBOutlet weak var orderPriceTextViewOutlet: UITextView!
    @IBOutlet weak var totalLabelOutlet: UILabel!
    
    //var itemDict = ["mcchicken": 1.50, "fries": 2.00, "soup": 4.50, "smoothie": 5.00, "heisenburger": 7.50]
    var items = ["McChicken", "Fries", "Soup", "Smoothie", "Heisenburger"]
    var prices = [1.50, 2.00, 4.50, 5.00, 7.50]
    var total = 0.00
    var adminState = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitItemButtonAction(_ sender: Any)    {
        var buyKey : String?
        buyKey = enterItemTextFieldOutlet.text?.lowercased()
        let numID = (buyKey as! NSString).integerValue
        var bypass = false
        
        // ADMIN ****************************************************
        if (adminState && buyKey == "exit")
        {
            adminState = false
            view.backgroundColor = UIColor.systemCyan
            cafeLabelOutlet.text = "Cafe"
            cafeLabelOutlet.textColor = UIColor.black
            orderTextViewOutlet.isHidden = false
            orderPriceTextViewOutlet.isHidden = false
            enterItemTextFieldOutlet.placeholder = "Enter your item here (Item or ID)"
        }
        
        if (!adminState && buyKey == "400mbestrace")
        {
            adminState = true
            view.backgroundColor = UIColor.black
            cafeLabelOutlet.text = "Admin"
            cafeLabelOutlet.textColor = UIColor.white
            orderTextViewOutlet.isHidden = true
            orderPriceTextViewOutlet.isHidden = true
            enterItemTextFieldOutlet.placeholder = "Add/remove item name here"
        }
        
        
        // CUSTOMER *************************************************
        
        if let blah = buyKey {
            var j = 0
            while (j < items.count) {
                if (items[j].lowercased() == blah ) {
                    orderTextViewOutlet.text += "\(items[j])\n"
                    orderPriceTextViewOutlet.text += "$\(prices[j])0\n"
                    total += prices[j]
                    totalLabelOutlet.text = "Total: $\(total)0"
                    bypass = true
                    break
                }
                
                j+=1
            }
            
            if (!bypass && numID > 0 && numID <= items.count)
            {
                orderTextViewOutlet.text += "\(items[numID-1])\n"
                orderPriceTextViewOutlet.text += "$\(prices[numID-1])0\n"
                total += prices[numID-1]
                totalLabelOutlet.text = "Total: $\(total)0"
                //break
            }
            
            
            
            
        }
        
        
        
        
    }
    


}

